import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/app_custom_colors.dart';
import '../../../core/constants/app_layout_constants.dart';
import '../../../core/constants/app_text_styles.dart';
import 'home_content_title_section.dart';

/// 카테고리 카드 데이터 모델
class CategoryCard {
  const CategoryCard({
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.url,
  });

  final String title;
  final String subtitle;
  final String iconPath;
  final String url;
}

/// AI 넥서스, AI 게임즈, AI 프리즘 섹션을 표시하는 위젯
class CategorySection extends StatelessWidget {
  const CategorySection({super.key});
  static const String _defaultUrl = 'https://sedaily.com/';

  /// AI 넥서스 카드 데이터
  static const List<CategoryCard> _aiNexusCards = <CategoryCard>[
    CategoryCard(
      title: 'T5\n핵심을 꿰뚫는 제목 추천',
      subtitle: '클릭유도형, 저널리즘 충실형 등 5가지 유형별 차별화',
      iconPath: 'assets/icons/ai_nexus/ic_search_icon.png',
      url: 'https://t1.sedaily.ai/11',
    ),
    CategoryCard(
      title: 'C7\n창의력 넘치는 제목 추천',
      subtitle: '언어 혁신, 충돌 생성, 감성 증폭 엔진\n7가지 엔진으로 새로운 아이디어 제시',
      iconPath: 'assets/icons/ai_nexus/ic_light_bulb.png',
      url: 'https://t1.sedaily.ai/22',
    ),
    CategoryCard(
      title: '비즈니스 모드 교열\n경제 금융 산업 등',
      subtitle: '숫자, 단위 표기 등 맞춤법 완벽 체크\n주어-서술어 호응 검증, 중복 표현 제거',
      iconPath: 'assets/icons/ai_nexus/ic_dollar_banknote.png',
      url: 'https://p1.sedaily.ai/11',
    ),
    CategoryCard(
      title: '종합 뉴스 모드 교열\n정치 사회 국제 등',
      subtitle: '인용 부호 정확성, 간접 인용 문법 체크\n불필요한 피동문 개선, 문단 간 연결성 검토',
      iconPath: 'assets/icons/ai_nexus/ic_globe_with_meridians.png',
      url: 'https://p1.sedaily.ai/22',
    ),
    CategoryCard(
      title: '기업 보도자료로\n기사 초안 작성',
      subtitle: '신제품·서비스 요약, 분기 실적 분석 \n산업별 맞춤 템플릿(IT/제조/금융/유통)',
      iconPath: 'assets/icons/ai_nexus/ic_office_building.png',
      url: 'https://w1.sedaily.ai/11',
    ),
    CategoryCard(
      title: '공공기관 보도자료로\n기사 초안 작성',
      subtitle: '경제정책 영향 분석, 정책 수혜 대상 명확화, 부동산 금융 규제 요약.',
      iconPath: 'assets/icons/ai_nexus/ic_classical_building.png',
      url: 'https://w1.sedaily.ai/22',
    ),
    CategoryCard(
      title: '영문 뉴스로\n한글 기사 초안 작성',
      subtitle: '실시간 영문 뉴스 번역, 한국 상황 맥락 추가. 달러 자동환산, 제목 5개 추천',
      iconPath: 'assets/icons/ai_nexus/ic_button_blood_type.png',
      url: 'https://f1.sedaily.ai/11',
    ),
    CategoryCard(
      title: '일본 뉴스로\n한글 기사 초안 작성',
      subtitle: '실시간 일본 뉴스 번역, 한일 관계 맥락 추가. 정치 경제 용어 표준화',
      iconPath: 'assets/icons/ai_nexus/ic_japanese_service_charge_button.png',
      url: 'https://f1.sedaily.ai/22',
    ),
    CategoryCard(
      title: '일보 버디 :\n아이디어를 일보로',
      subtitle: '1단어만 입력해도 3개 기사 방향 즉시 제안. 취재 방향, 차별화 포인트 자동 생성',
      iconPath: 'assets/icons/ai_nexus/ic_books.png',
      url: 'https://b1.sedaily.ai/11',
    ),
    CategoryCard(
      title: '기사 버디 :\n일보&취재 내용 초안 작성',
      subtitle: '보도자료 한 줄로 3분 내 기사 초안 완성. [대괄호]로 확인 필요 사항 표시',
      iconPath: 'assets/icons/ai_nexus/ic_scroll.png',
      url: 'https://b1.sedaily.ai/22',
    ),
    CategoryCard(
      title: '단문 퇴고\n1,000자 미만',
      subtitle: '모바일 첫 2초 입팩트로 이탈률 50%감소.\n3가지 개선 방향 제시',
      iconPath: 'assets/icons/ai_nexus/ic_page_facing_up.png',
      url: 'https://r1.sedaily.ai/11',
    ),
    CategoryCard(
      title: '장문 퇴고\n1,000자 이상',
      subtitle: '독자 이탈 포인트 예측, 구조 재배치 제안. 영웅서사 등 구조 선택 가능',
      iconPath: 'assets/icons/ai_nexus/ic_newspaper.png',
      url: 'https://r1.sedaily.ai/22',
    ),
  ];

  /// AI 게임즈 카드 데이터
  static const List<CategoryCard> _aiGamesCards = <CategoryCard>[
    CategoryCard(
      title: '블랙스완',
      subtitle: '경제 도미노 이해',
      iconPath: 'assets/icons/ai_games/ic_swan.png',
      url: _defaultUrl,
    ),
    CategoryCard(
      title: '시그널 디코딩',
      subtitle: '경제용어 해독',
      iconPath: 'assets/icons/ai_games/ic_currency_exchange.png',
      url: _defaultUrl,
    ),
    CategoryCard(
      title: '죄수의 딜레마',
      subtitle: '동전의 양면 보기',
      iconPath: 'assets/icons/ai_games/ic_coin.png',
      url: _defaultUrl,
    ),
    CategoryCard(
      title: '크로스워드',
      subtitle: '기사 기반 단어 추리',
      iconPath: 'assets/icons/ai_games/ic_input_latin_uppercase.png',
      url: _defaultUrl,
    ),
  ];

  /// AI 프리즘 카드 데이터
  static const List<CategoryCard> _aiPrismCards = <CategoryCard>[
    CategoryCard(
      title: '대학생·취준생\n뉴스 프리즘',
      subtitle: '채용·인턴십부터 청년정책까지,\n오늘의 취업 준비 필수 정보',
      iconPath: 'assets/icons/ai_prism/ic_graduation_cap.png',
      url: 'https://www.sedaily.com/Cube/CubeCollect/368',
    ),
    CategoryCard(
      title: '신입 직장인\n뉴스 프리즘',
      subtitle: '연봉·업무 스킬부터 재테크까지,\n사회초년 성장 가이드 ',
      iconPath: 'assets/icons/ai_prism/ic_necktie.png',
      url: 'https://www.sedaily.com/Cube/CubeCollect/372',
    ),
    CategoryCard(
      title: '스타트업 창업자\n뉴스 프리즘',
      subtitle: '투자 유치부터 성장 전략까지,\n스타트업 생태계 인사이트',
      iconPath: 'assets/icons/ai_prism/ic_rocket.png',
      url: 'https://www.sedaily.com/Cube/CubeCollect/366',
    ),
    CategoryCard(
      title: '기업 CEO\n뉴스 프리즘',
      subtitle: '산업 동향부터 ESG경영까지,\n기업 경영 핵심 인사이트',
      iconPath: 'assets/icons/ai_prism/ic_office_worker.png',
      url: 'https://www.sedaily.com/Cube/CubeCollect/367',
    ),
    CategoryCard(
      title: '주식 투자자\n뉴스 프리즘',
      subtitle: '기업 분석부터 시장 전망까지,\n주식투자 성공 전략',
      iconPath: 'assets/icons/ai_prism/ic_chart_decreasing.png',
      url: 'https://www.sedaily.com/Cube/CubeCollect/371',
    ),
    CategoryCard(
      title: '부동산 투자자\n뉴스 프리즘',
      subtitle: '시장 동향부터 정책 분석까지,\n부동산 투자 필수 정보',
      iconPath: 'assets/icons/ai_prism/ic_house.png',
      url: 'https://www.sedaily.com/Cube/CubeCollect/369',
    ),
    CategoryCard(
      title: '금융상품 투자자\n뉴스 프리즘',
      subtitle: '예적금부부터 투자상품까지,\n똑똑한 금융자산 운용 전략',
      iconPath: 'assets/icons/ai_prism/ic_money_bag.png',
      url: 'https://www.sedaily.com/Cube/CubeCollect/373',
    ),
    CategoryCard(
      title: '글로벌 투자자\n뉴스 프리즘',
      subtitle: '국제 금융시장부터 해외 진출까지,\n글로벌 투자 전략 가이드',
      iconPath: 'assets/icons/ai_prism/ic_globe_showing_americas.png',
      url: 'https://www.sedaily.com/Cube/CubeCollect/370',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final bool isCompact = screenWidth <= AppLayoutConstants.maxCompactWidth;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildCategoryArea(
          context: context,
          titleImagePath: 'assets/images/home/ai_nexus_subtitle.svg',
          cards: _aiNexusCards,
          isCompact: isCompact,
          label: '제목, 교열, 보도자료, 외신 기사 작성 등',
        ),
        _buildCategoryArea(
          context: context,
          titleImagePath: 'assets/images/home/ai_prism_subtitle2.svg',
          cards: _aiPrismCards,
          isCompact: isCompact,
          label: 'AI 뉴스 큐레이션 딱 필요한 뉴스를 한 번에!',
        ),
        _buildCategoryArea(
          context: context,
          titleImagePath: 'assets/images/home/ai_games_subtitle.svg',
          cards: _aiGamesCards,
          isCompact: isCompact,
          label: '제목, 교열, 보도자료, 외신 기사 작성 등',
        ),
      ],
    );
  }

  /// 개별 카테고리 영역 빌드
  Widget _buildCategoryArea({
    required BuildContext context,
    required String titleImagePath,
    required List<CategoryCard> cards,
    required bool isCompact,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HomeContentTitleSection(
            titleImagePath: titleImagePath,
            label: label,
            isCompact: isCompact,
          ),
          const SizedBox(height: 15),
          isCompact ? _buildCompactLayout(cards) : _buildDesktopLayout(cards),
        ],
      ),
    );
  }

  /// 데스크톱 레이아웃 (2열 그리드)
  Widget _buildDesktopLayout(List<CategoryCard> cards) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        const double gap = 6;
        final double cardWidth = (constraints.maxWidth - gap) / 2;
        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: cards.map((CategoryCard card) {
            return SizedBox(width: cardWidth, child: _buildCard(card, false));
          }).toList(),
        );
      },
    );
  }

  /// 모바일 레이아웃 (2열 그리드 또는 캐러셀)
  Widget _buildCompactLayout(List<CategoryCard> cards) {
    if (cards.length <= 4) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double cardWidth = (constraints.maxWidth - 6) / 2;
          return Wrap(
            spacing: 6,
            runSpacing: 6,
            children: cards.map((CategoryCard card) {
              return SizedBox(width: cardWidth, child: _buildCard(card, true));
            }).toList(),
          );
        },
      );
    }
    final List<Widget> carouselPages = <Widget>[];
    for (int i = 0; i < cards.length; i += 2) {
      final CategoryCard firstCard = cards[i];
      final CategoryCard? secondCard = i + 1 < cards.length
          ? cards[i + 1]
          : null;
      carouselPages.add(
        Padding(
          padding: const EdgeInsets.only(right: 6),
          child: Column(
            children: <Widget>[
              _buildCard(firstCard, true),
              if (secondCard != null) ...<Widget>[
                const SizedBox(height: 6),
                _buildCard(secondCard, true),
              ],
            ],
          ),
        ),
      );
    }
    return CarouselSlider(
      options: CarouselOptions(
        height: 246,
        viewportFraction: 0.9,
        enableInfiniteScroll: false,
        padEnds: false,
      ),
      items: carouselPages,
    );
  }

  /// 개별 카드 위젯
  Widget _buildCard(CategoryCard card, bool isCompact) {
    return HoverWidget(
      onHover: (_) {},
      hoverChild: _buildCardContent(card, true, isCompact),
      child: _buildCardContent(card, false, isCompact),
    );
  }

  /// 카드 콘텐츠
  Widget _buildCardContent(CategoryCard card, bool isHovered, bool isCompact) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchUrl(card.url),
        child: Container(
          width: double.infinity,
          height: isCompact ? 120 : 130,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppCustomColors.white,
            borderRadius: BorderRadius.circular(10),
            border: isHovered
                ? Border.all(color: AppCustomColors.blue006CFF, width: 1)
                : null,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withValues(alpha: isHovered ? 0.15 : 0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(card.iconPath, width: 40, height: 40),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      card.title,
                      style: isCompact
                          ? AppTextStyles.noto15B.copyWith(
                              color: isHovered
                                  ? AppCustomColors.blue006CFF
                                  : AppCustomColors.black1C,
                              height: 1.2,
                            )
                          : AppTextStyles.noto18B.copyWith(
                              color: isHovered
                                  ? AppCustomColors.blue006CFF
                                  : AppCustomColors.black1C,
                              height: 1.2,
                            ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                card.subtitle,
                style: isCompact
                    ? AppTextStyles.noto14R.copyWith(
                        height: 1.5,
                        color: AppCustomColors.grey666,
                      )
                    : AppTextStyles.noto16R.copyWith(
                        height: 1.5,
                        color: AppCustomColors.grey666,
                      ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// URL 열기
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
