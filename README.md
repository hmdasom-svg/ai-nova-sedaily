# 서울경제 AI NOVA
빅카인즈 AI 기반 심리스 뉴스 서비스
키워드 중심 뉴스 클러스터링 및 종합 요약 시스템

## 목차
[1. 서버 적용](#1-서버-적용)
[2. 클라이언트 적용](#2-클라이언트-적용)

## 1. 서버 적용
- Lambda
- S3
- Step Functions
- CloudFront
- EventBridge

### 1. Lambda 함수 생성
코드는 모두 올리되, batchAPI의 핸들러 별/handlerAPI는 람다 함수를 각각 다르게 생성하고 handler 설정 변경합니다.
batchAPI는 Step Functions에서 각 람다 함수를 호출하는 구조로 설계합니다. 설계 방식에 따라 람다 함수 설정 및 개수도 변경 가능하니 원하는대로 설계합니다.
현재는 키워드 추출, 이슈맵 생성, 요약 생성 람다 함수로 구성되어 있습니다.
handlerAPI는 클라이언트에서 호출하는 람다 함수로, 람다 URL을 클라이언트에 적용합니다. CORS 설정도 적용해야 합니다.

### 2. S3 버킷 생성
- Lambda 코드 업로드용 버킷
- 데이터 저장용 버킷(이슈맵, 요약내용, 키워드)

### 3. Step Functions + EventBridge 생성
Lambda 함수들을 호출하는 Step Functions 생성합니다.
하루에 2번 실행되도록 EventBridge도 설정합니다.

### 4. CloudFront 생성
S3 버킷과 연동하여 비용 절감을 위해 사용합니다.


<div align="right">
  
[목차로](#목차)

</div>

## 2. 클라이언트 적용


<div align="right">
  
[목차로](#목차)

</div>
