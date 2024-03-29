<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>당근마켓 - 중고 제품 상세!</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.6.2/css/bootstrap-slider.min.css" integrity="sha256-G3IAYJYIQvZgPksNQDbjvxd/Ca1SfCDFwu2s2lt0oGo=" crossorigin="anonymous" />
    <link rel="stylesheet" type="text/css" href="resources/css/style.css">
</head>
<body>
    <nav class="navbar nav-global fixed-top navbar-expand-sm">
        <div class="container">
            <a class="navbar-brand" href="javascript:history.back()">
                <i class="material-icons ic-filter">arrow_back_ios</i>뒤로
            </a>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a href="" class="btn btn-sm btn-warning disabled">채팅으로 거래하기</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container container-sm container-detail">
        <img src="http://www.shareshard.com/CarrotMarket/resources/images/${product.image}" alt="" width="100%">
        <h3 class="product-title">${product.title}</h3>
        <h4 class="product-price" style="font-weight:bold;">
            <fmt:formatNumber type= "number" maxFractionDigits="3" value="${product.price}"/>원
        </h4>
        <ul class="list-product-information">
            <li class="list-item category">카테고리 <span>${product.category}</span></li>
            <li class="list-item date">상품 등록 시간 <span><time datetime='${product.created_at}'>${product.diffDays}일전</time></span></li>
    
            <c:if test='${product.category=="차량"}'>
	            <li class="list-item car-model-year">차량 연식 <span>${diffYear}년</span></li>
	            <li class="list-item car-mileage">주행 거리 <span><fmt:formatNumber type= "number" maxFractionDigits="3" value="${product.randistance}"/>km</span></li>
	            <li class="list-item car-smoking">판매자 흡연 여부 
		            <c:if test='${product.issmoke=="true"}'>
		            	<span>흡연자</span>
		            </c:if>
		            <c:if test='${product.issmoke=="false"}'>
		            	<span>비흡연자</span>
		            </c:if>
		            </li>
		     </c:if>
           
        </ul>
        <div class="description" style="white-space:pre-line;">
        	${product.description}
           <!--  <p>중고차 딜리버리(delivery)는 허위,미끼매물 없는 100% 실제매물입니다.<br>중고차 딜리버리(delivery)로 중고차구매하세요!!</p>

            <p>판매가격: 1,590만원
                <br>피아트 500 쿠페 1.4 컬러 플러스
                <br>차량번호; 40고1579
                <br>년식;15년 03월등록 (15년식)
                <br>주행거리:72,836km
                <br>연료:가솔린
                <br>배기량: 1,400CC
                <br>변속기:오토
                <br>색상:갈색
                <br>1인소유 신조 무사고
            </p>

            <p>★◇◈◇ 좋은 중고차 많이 파는 딜러, 자동차 판매실적 좋은 딜러, [피아트] 500 전문 매입판매 딜러 김인찬입니다.자동차 구매는 많이 파는 딜러, 실적이 좋은 딜러에게 구매하셔야 바가지를 안 씁니다</p>

            <p>내가 탈 중고차 내 가족이 탈 중고차 싸다고 사기꾼, 깡패, 건달 같은 놈에게 속고 강매 당하는 어리석은 행동은 절대 하지마시고, 내가 선택한 이 좋은 자동차를 운행할 때 나를 보며 부러워하는 타인의 시선과 나의 품위,품격만 생각하세요~~</p>

            <p>프로자동차매매상사는 중고차 딜리버리(delivery) 서비스를 제공합니다.계속적인 허위, 미끼매물로 중고차구입 예정 고객의 피해가 심각하여 그 피해를 막고자 안전하게 중고차를 고객님께서 원하시는 곳에서 원하는 중고차를 편안하게 허위, 미끼매물 걱정 없이 안전하게 받아보실 수 있도록 중고차 딜리버리(delivery) 하여드리겠습니다.이제 매장까지 오시지 마시고 집에서 편안하고 안전하게 중고차구입, 중고차거래하세요~~~</p>

            <p>“고객님과 함께 할 중고차 최고 좋은 중고차로 저렴한 중고차 은하계 최저 가격
                <br>단 한번 파격조건으로 구매할 수 있게 도와드리겠습니다.”</p>

            <p>나에게 꼭!! 필요한 중고차 [피아트] 500 쿠페 1.4 컬러 플러스를 월17만원의 거품 빠진 부담 없는 동급 최저가격, 특별한 가격, 특별한 혜택,지금 구매하시면 특별히 할부금리 1.9% 더 할인된(신한 마이카, 국민은행 KB매직카, 대출금리 4%때 최장120개월)초 저금리로 초기비용 없이 구매 진행 도와드립니다~~높은 할부금융(캐피탈) 살인이자 저렴한 이자로 대환대출 도와드립니다.고민하지 마시고 바로 전화 주시고 예약 방문하세요! 무면허,군미필,외국인동포,F4,F5분들도 할부구매가능하며,구입한 차량이 마음에 안 드시면 3개월내 구입가격에 위탁판매, 경매진행 도와드립니다.</p>

            <p>2015년식 갈색  1인소유 신조 무사고 차량입니다.
                <br>압축도어,가죽씨트,열선씨트,브라운씨트,ECM룸미러,ABS,커튼에어백,TCS,자동접이식 사이드미러, 전,후,측방감지기,CDP,풀오토 좌우독립식 전자동에어컨,크루즈컨트롤,가죽핸들,전동썬루프,최고급 2채널 차량용 블랙박스,등이 장착된 풀 옵션 (장착옵션 계약시 확인必!!)미세오일누유 없는  최고의 컨디션을 유지하고 있는 주행거리 짧은 특A급 차량입니다.</p>

            <p>내가 탈 중고차 내 가족이 탈 중고차 싸다고 사기꾼, 깡패 , 건달 같은 놈에게 속고 강매 당하는 어리석은 행동은 절대 하지마세요~~~고객님께 꼭! 필요한 중고차 믿고 살 수 있는 곳, 내가 타던 중고차 믿고 팔 수 있는 곳,프로자동차매매상사는 (네이버밴드-'프로자동차매매상사/A급중고차매매/블랙박스/판매사원모집' 밴드로 초대합니다.<a href="https://band.us/band/55863835">https://band.us/band/55863835</a> 밴드명을 검색해 가입할 수 있습니다.중고차직거래가능)
                <br>①철저한 A/S와 중고차 마음에 안 드시면 언제든지 반품 가능합니다. !!
                <br>②전 차종 차량용 블랙박스, 네비게이션, 스마트키, ABS, 에어백, 등이 장착된 차량으로만 우선 중고차추천 판매합니다.!! ( 자동차는 사용자가 안전하고 편안해야 합니다.)
                <br>③자동차구매 후 연막살균소독, 자동차유리 발수코팅, 최고급 차량용 블랙박스 중
                <br>1개를 선택 공짜[무료]증정, 또한 블랙박스를 시중가격보다 20% 저렴하게 장착해드리고 구형 블랙박스도 보상판매합니다!!!
                <br>특히 프로자동차매매상사는 공중파 예능프로그램에 중고차를 협찬하였고 08년 10월, 10년4월 2회연속, MBC 소비자 고발 프로그램 불만제로에 출연하여 중고차 허위, 미끼매물 없는 1등 모범업소, 월간지 한국경제21에서 추천상사로 선정된 업체입니다.1등 모범업소 인천 불만제로 중고차, 믿을 만한 중고차 매매상사, 20년이상 중고차매매업체를 운영 중이며 중고차거래 고객님 중 2회이상 재거래, 재방문이 많은 딜러 김인찬에게 중고차상담,중고차판매, 중고차구매 하시면 안전하며 거품 빼고 마진 없이 정확한 매물과 최고의 차량만 광고합니다.다수 상태 좋은 매물을 다량 확보하고 있으니 차 한잔 드시면서 직접 시운전 해보시고 결정하세요!!! ★◇◈◇
                <br>----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                <br>★☆방문하시는 방법☆★
                <br>국철 간석역 하차 또는 인천지하철 2호선 인천 제이밸리역 하차 네비게이션은 전화 032-874-5300을 입력하시고 오시거나,인천 남동구 방축로 414 간석자동차매매단지 224호 프로자동차매매상사를 입력하시면 됩니다.
                <br>-------------------------------------------------------------------------------------------------------------------------------
                <br>“고객님과 함께 했던 정든 내 자동차 파실 때도 손해 안보고 좋은 가격에 팔 수 있게 도와드리겠습니다.” 대차할 차량은 상담 후 결정합니다.
                <br>★남,녀 딜러사원모집,차량용 블랙박스,네비게이션 판매,영업사원모집,급전 필요한 분 신용대출, 압류과다차량, 300만원대 중고차전문판매,전액할부판매, 자동차구매시 신용카드 온라인,전화 결재가능, 전문상담★
                <br>☎ 011-310-0532 ☏ 016-9991-8989 ☎ 010-9948-5300 ☏ 016-754-0532 ☎1899-7445(차사사오) 카톡 상담 ID: ickim123, carpro5300</p>

            <p>더 많은 차량은 car8989.com 에서 (네이버밴드,주요 포털 검색창에 김인찬중고차를 치세요!!)</p>
        </div>

        <p>
            100%실매물.다량매물보유 <br>
            경형차(모닝.레이.스파크).세단(승용차)
            승합(SUV.투싼.스포티지.큐엠3.티볼리.)
            LF쏘나타.제네시스.K3.K5.K7.K9.그랜저.등등
            구입을하시든하지않으시든중고차를구매할분들에게..꼭저희차를구매하지않으셔도도움이되어드리고싶습니다.꿀팁!!!!알면케미.모르면독박^^독박쓰지않도록도움이되는사람이고싶습니다^^;;
            언제든지편하게연락주세요~~^^**
            010.6523.7494.#♡#
            출장판매.매입.당일이전&당일출고.
            중고차에관한.모든상담언제든지환영.
        </p> -->
    </div>

    <footer>
        <div class="container">
            <a href="index.html">2019 당근 마켓</a>
            <h6>Copyright © Danggeun Market Inc. All rights reserved.</h6>
        </div>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.6.2/bootstrap-slider.js" integrity="sha256-59/apVFrosMLFX2dHZLGvb3nPpu7e0Yx1rsDr1dTRrk=" crossorigin="anonymous"></script>
</body>
</html>

