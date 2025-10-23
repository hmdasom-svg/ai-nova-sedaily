import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_force_directed_graph/flutter_force_directed_graph.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vector_math/vector_math.dart' as vector;

import '../../core/constants/app_custom_colors.dart';
import '../../core/constants/app_layout_constants.dart';
import '../../core/constants/app_text_styles.dart';
import '../../domain/model/issue_map.dart';
import '../../domain/model/issue_map_link.dart';
import '../../domain/model/issue_map_node.dart';

/// 이슈맵 그래프를 공통으로 렌더링하는 위젯
class IssueMapGraphView extends StatefulWidget {
  const IssueMapGraphView({
    super.key,
    required this.isLoading,
    this.issueMap,
    this.onNodeTap,
    this.emptyMessage = '이슈맵 데이터를 불러올 수 없습니다.',
    this.aspectRatio = 16 / 11,
    this.maxHeight = 550,
    this.isFixedWidth = false,
    this.fixedWidth = 0,
    this.defaultWidth = AppLayoutConstants.homeContentMaxWidth,
    this.minScale = 0.25,
    this.maxScale = 2.5,
    this.spawnExtentFactor = 0.35, //초기 배치 반경(뷰포트 대비 비율)
    this.staticLayout = false,
    this.graphConfig = const GraphConfig(
      scaling: 0.0048,
      elasticity: 0.65, //엣지 연결선의 스프링 탄성 정도
      repulsion: 180, //노드들 간 반발력 정도
      repulsionRange: 300, //반발력이 작용하는 거리 범위
      length: 100, //엣지 연결선의 길이
      ///운동 감쇠나 최소 속도 제한
      damping: 0.1,
      maxStaticFriction: 18.0,
      minVelocity: 0.8,
    ),
    this.cachePaintOffset = 48,
    this.isFixedHeight = false,
    this.fixedHeight = 220,
    this.nodeScaleMultiplier = 2.0, // 노드 기본 스케일 배수
    this.nodeMinDiameter = 36.0,
    this.nodeMaxDiameter = 110.0,
    this.nodeLabelTextStyle,
    this.nodeLabelMaxLines = 2,
    this.nodeLabelMinWidth = 88.0,
    this.enableHoverGrowth = true,
  });

  final bool isLoading;
  final IssueMap? issueMap;
  final void Function(BuildContext context, IssueMapNode node)? onNodeTap;
  final String emptyMessage;
  final double aspectRatio;
  final double maxHeight;
  final bool isFixedWidth;
  final double fixedWidth;
  final double defaultWidth;
  final double minScale;
  final double maxScale;
  final GraphConfig graphConfig;
  final double cachePaintOffset;
  final double spawnExtentFactor;
  final bool staticLayout;
  final bool isFixedHeight;
  final double fixedHeight;
  final double nodeScaleMultiplier;
  final double nodeMinDiameter;
  final double nodeMaxDiameter;
  final TextStyle? nodeLabelTextStyle;
  final int nodeLabelMaxLines;
  final double nodeLabelMinWidth;
  final bool enableHoverGrowth;

  @override
  State<IssueMapGraphView> createState() => _IssueMapGraphViewState();
}

class _IssueMapGraphViewState extends State<IssueMapGraphView> {
  static const double _edgeMinimumWidth = 16;
  late final ForceDirectedGraphController<IssueMapNode> _graphController;
  IssueMap? _renderedIssueMap;
  Map<String, double> _nodeSizeLookup = <String, double>{};
  Map<String, double> _linkWidthLookup = <String, double>{};
  Size? _graphViewportSize;
  double _viewportScale = 1.0;
  bool _isDisposing = false;
  String? _hoveredNodeId;

  @override
  void initState() {
    super.initState();
    _graphController = ForceDirectedGraphController<IssueMapNode>(
      graph: ForceDirectedGraph<IssueMapNode>(config: widget.graphConfig),
      minScale: widget.minScale,
      maxScale: widget.maxScale,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _syncGraph(widget.issueMap);
      if (!widget.enableHoverGrowth) {
        _hoveredNodeId = null;
      }
    });
  }

  @override
  void didUpdateWidget(covariant IssueMapGraphView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(widget.issueMap, oldWidget.issueMap)) {
      _syncGraph(widget.issueMap);
    }
  }

  @override
  void dispose() {
    _isDisposing = true;
    _graphController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return Center(
        child: const SpinKitThreeBounce(
          color: AppCustomColors.blue006CFF,
          size: 16,
        ),
      );
    }
    if (widget.issueMap == null) {
      return Center(
        child: Text(widget.emptyMessage, style: AppTextStyles.noto14M),
      );
    }
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double maxWidth = constraints.maxWidth;
        double width = maxWidth;
        double height = widget.isFixedHeight
            ? widget.fixedHeight
            : width / widget.aspectRatio;
        if (!widget.isFixedHeight && height > widget.maxHeight) {
          height = widget.maxHeight;
          width = height * widget.aspectRatio;
        }
        if (widget.isFixedWidth) {
          width = widget.fixedWidth;
          if (!widget.isFixedHeight) {
            height = width / widget.aspectRatio;
          }
        }
        final Size size = Size(width, height);
        _updateViewportSize(size);
        return SizedBox(
          width: width,
          height: height,
          child: ClipRect(
            child: ForceDirectedGraphWidget<IssueMapNode>(
              controller: _graphController,
              cachePaintOffset: widget.cachePaintOffset,
              nodesBuilder: (BuildContext context, IssueMapNode node) {
                return _buildGraphNode(context, node);
              },
              edgesBuilder:
                  (
                    BuildContext context,
                    IssueMapNode a,
                    IssueMapNode b,
                    double distance,
                  ) {
                    return _buildGraphEdge(a, b, distance);
                  },
            ),
          ),
        );
      },
    );
  }

  void _syncGraph(IssueMap? issueMap) {
    if (_isDisposing) {
      return;
    }
    if (issueMap == null) {
      if (_renderedIssueMap != null) {
        _renderedIssueMap = null;
        _nodeSizeLookup = <String, double>{};
        _linkWidthLookup = <String, double>{};
        _graphController.graph = ForceDirectedGraph<IssueMapNode>();
        _hoveredNodeId = null;
      }
      return;
    }
    if (identical(issueMap, _renderedIssueMap)) {
      return;
    }
    final ForceDirectedGraph<IssueMapNode> graph = _createGraph(issueMap);
    _graphController.graph = graph;
    _graphController.scale = _viewportScale;
    if (widget.enableHoverGrowth) {
      _hoveredNodeId = null;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _isDisposing) {
        return;
      }
      _graphController.center();
      _graphController.needUpdate();
    });
    _renderedIssueMap = issueMap;
  }

  ForceDirectedGraph<IssueMapNode> _createGraph(IssueMap issueMap) {
    _nodeSizeLookup = _deriveNodeSizes(issueMap);
    _linkWidthLookup = _deriveLinkWidths(issueMap.links);
    final ForceDirectedGraph<IssueMapNode> graph =
        ForceDirectedGraph<IssueMapNode>();
    final Map<String, Node<IssueMapNode>> nodeMap =
        <String, Node<IssueMapNode>>{};
    if (issueMap.nodes.isEmpty) {
      return graph;
    }
    final math.Random random = math.Random(42);
    final double halfWidth =
        (_graphViewportSize?.width ?? widget.defaultWidth) *
        widget.spawnExtentFactor;
    final double halfHeight =
        (_graphViewportSize?.height ?? widget.maxHeight) *
        widget.spawnExtentFactor;
    for (final IssueMapNode node in issueMap.nodes) {
      final double x = (random.nextDouble() - 0.5) * halfWidth * 2;
      final double y = (random.nextDouble() - 0.5) * halfHeight * 2;
      final vector.Vector2 position = vector.Vector2(x, y);
      final Node<IssueMapNode> graphNode = Node<IssueMapNode>(node, position)
        ..mass = 1 + (_resolveNodeDiameter(node.id, node.symbolSize) / 140);
      graph.addNode(graphNode);
      nodeMap[node.id] = graphNode;
    }
    for (final IssueMapLink link in issueMap.links) {
      final Node<IssueMapNode>? source = nodeMap[link.sourceId];
      final Node<IssueMapNode>? target = nodeMap[link.targetId];
      if (source == null || target == null) {
        continue;
      }
      graph.addEdge(source.connect(target));
    }
    // 정적 모드
    if (widget.staticLayout) {
      for (final Node<IssueMapNode> n in graph.nodes) {
        n.static();
      }
    }
    return graph;
  }

  Map<String, double> _deriveNodeSizes(IssueMap issueMap) {
    final Map<String, double> sizeMap = <String, double>{};
    for (final IssueMapNode node in issueMap.nodes) {
      sizeMap[node.id] = node.symbolSize;
    }
    for (final IssueMapLink link in issueMap.links) {
      final double width = link.style.width;
      if (width <= 0) {
        continue;
      }
      sizeMap.update(
        link.sourceId,
        (double value) => math.max(value, width),
        ifAbsent: () => width,
      );
      sizeMap.update(
        link.targetId,
        (double value) => math.max(value, width),
        ifAbsent: () => width,
      );
    }
    return sizeMap;
  }

  Map<String, double> _deriveLinkWidths(List<IssueMapLink> links) {
    final Map<String, double> widthMap = <String, double>{};
    for (final IssueMapLink link in links) {
      final double width = link.style.width;
      final String forwardKey = _buildLinkKey(link.sourceId, link.targetId);
      final String backwardKey = _buildLinkKey(link.targetId, link.sourceId);
      widthMap[forwardKey] = width;
      widthMap[backwardKey] = width;
    }
    return widthMap;
  }

  String _buildLinkKey(String first, String second) {
    return '$first|$second';
  }

  double _resolveNodeDiameter(String nodeId, double fallbackSize) {
    final double base = _nodeSizeLookup[nodeId] ?? fallbackSize;
    final double clamped = base.clamp(4, 40).toDouble();
    final double scaled = clamped * widget.nodeScaleMultiplier;
    return scaled
        .clamp(widget.nodeMinDiameter, widget.nodeMaxDiameter)
        .toDouble();
  }

  double _resolveEdgeThickness(String sourceId, String targetId) {
    final double width =
        _linkWidthLookup[_buildLinkKey(sourceId, targetId)] ?? 1;
    return width.clamp(2, 18).toDouble();
  }

  void _handleNodeHover(String nodeId) {
    if (!widget.enableHoverGrowth || _isDisposing) {
      return;
    }
    if (_hoveredNodeId == nodeId) {
      return;
    }
    setState(() {
      _hoveredNodeId = nodeId;
    });
  }

  void _handleNodeHoverExit(String nodeId) {
    if (!widget.enableHoverGrowth || _isDisposing) {
      return;
    }
    if (_hoveredNodeId != nodeId) {
      return;
    }
    setState(() {
      _hoveredNodeId = null;
    });
  }

  Widget _buildGraphNode(BuildContext context, IssueMapNode node) {
    final double baseDiameter = _resolveNodeDiameter(node.id, node.symbolSize);
    final Color color = _resolveCategoryColor(node.categoryName);
    final bool isHovered =
        widget.enableHoverGrowth && _hoveredNodeId == node.id;
    final double effectiveDiameter = isHovered
        ? (baseDiameter * 1.12)
              .clamp(widget.nodeMinDiameter, widget.nodeMaxDiameter)
              .toDouble()
        : baseDiameter;

    Widget nodeVisual = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          width: effectiveDiameter,
          height: effectiveDiameter,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppCustomColors.grey999.withValues(alpha: 0.25),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
        ),
        const SizedBox(height: 1),
        SizedBox(
          width: math.max(widget.nodeLabelMinWidth, effectiveDiameter),
          child: Text(
            node.name,
            style:
                widget.nodeLabelTextStyle ??
                AppTextStyles.noto13M.copyWith(color: AppCustomColors.black1C),
            textAlign: TextAlign.center,
            maxLines: widget.nodeLabelMaxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );

    if (widget.enableHoverGrowth) {
      nodeVisual = MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => _handleNodeHover(node.id),
        onExit: (_) => _handleNodeHoverExit(node.id),
        child: nodeVisual,
      );
    }

    return GestureDetector(
      onTap: widget.onNodeTap == null
          ? null
          : () => widget.onNodeTap!(context, node),
      child: nodeVisual,
    );
  }

  Widget _buildGraphEdge(IssueMapNode a, IssueMapNode b, double distance) {
    final double thickness = _resolveEdgeThickness(a.id, b.id);
    final double width = math.max(distance, _edgeMinimumWidth);
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: width,
        height: thickness,
        decoration: BoxDecoration(
          color: AppCustomColors.grey999.withValues(alpha: 0.35),
          borderRadius: BorderRadius.circular(thickness),
        ),
      ),
    );
  }

  void _updateViewportSize(Size size) {
    if (_isDisposing) {
      return;
    }
    if (!size.width.isFinite || !size.height.isFinite) {
      return;
    }
    final bool shouldUpdate =
        _graphViewportSize == null ||
        (_graphViewportSize!.width - size.width).abs() > 0.5 ||
        (_graphViewportSize!.height - size.height).abs() > 0.5;
    if (!shouldUpdate) {
      return;
    }
    _graphViewportSize = size;
    _viewportScale = _calculateViewportScale(size);
    _graphController.scale = _viewportScale;
  }

  double _calculateViewportScale(Size size) {
    final double widthRatio = size.width / widget.defaultWidth;
    final double heightRatio = size.height / widget.maxHeight;
    final double ratio = math.min(widthRatio, heightRatio);
    return ratio.clamp(widget.minScale, widget.maxScale);
  }

  Color _resolveCategoryColor(String categoryName) {
    final String key = categoryName.toUpperCase();
    if (key == 'LOCATION') {
      return AppCustomColors.blue006CFF;
    }
    if (key == 'ORGNIZATION') {
      return const Color(0xFF4ECDC4);
    }
    if (key == 'KEYWORD') {
      return const Color(0xFFFF9F43);
    }
    if (key == 'PERSON') {
      return const Color(0xFF786FA6);
    }
    return AppCustomColors.blue257ACD;
  }
}
