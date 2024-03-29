<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>당근마켓 - 우리 동네 중고거래</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.6.2/css/bootstrap-slider.min.css" integrity="sha256-G3IAYJYIQvZgPksNQDbjvxd/Ca1SfCDFwu2s2lt0oGo=" crossorigin="anonymous" />
    <link rel="stylesheet" type="text/css" href="resources/css/style.css">
</head>
<body>
    <nav class="navbar nav-global fixed-top navbar-expand-sm">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img class="img-brand" alt="당근마켓" width="132" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/header/logo-basic-00b7e471b721ce9db8b0758c05a84684413c8aef1ad54caa0f3fcbe7328c947f.svg">
            </a>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a href="item_create"><i class="material-icons ic-create">create</i></a>
                </li>
            </ul>
        </div>
    </nav>

<div class="container container-main-index">
    <h5 class="container-headline">중고 거래 제품</h5>

    <div class="categories-group">
        <a href="#" class="btn btn-category">차량</a>
        <a href="#" class="btn btn-category">인기매물</a>
        <a href="#" class="btn btn-category">가구/인테리어</a>
        <a href="#" class="btn btn-category">유아동/유아도서</a>
        <a href="#" class="btn btn-category">생활/가공식품</a>
    </div>

    <form id='movePage' action='goCategorized'>
    	<input type='hidden' id='category' name='category'>
    </form>
    <ul class="list-products row">
    	<c:forEach items="${pList}" var="product">
		    	<li class="list-products-item col-12 col-md-4 col-lg-3">
		            <a href="detail?seq=${product.productseq}">
		                <div class="card">
		                    <div class="card-img-top" style="background: url('http://www.shareshard.com/CarrotMarket/resources/images/${product.image}') no-repeat center; background-size: cover; height: 240px"></div>
		                    <div class="card-body">
		                        <h5 class="title">${product.title}</h5>
		                        <h6 class="price">
		                        <fmt:formatNumber type= "number" maxFractionDigits="3" value="${product.price}"/>원</h6>
		
		                        <div class="text-muted">
		                            <h6 class="category">${product.category}</h6>
		                            <time datetime='${product.created_at}'>${product.diffDays}일전</time>
		                        </div>
		                    </div>
		                </div>
		            </a>
		        </li>
    	</c:forEach>
    </ul>
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
<script>
    // With JQuery
    $("#carYeara").slider({ min: 0, max: 10, value: 0, focus: true });
    $("#sliderCarModelYear").slider({ min: 0, max: 10, value: [0, 10], focus: true });

    $("#carDistancea").slider({ min: 0, max: 10, value: 0, focus: true });
    $("#sliderCarMileage").slider({ min: 0, max: 10, value: [0, 10], focus: true });
    
    $(function(){
    	
    	$('.btn-category').on('click',function(){
    		
    		var content=$(this).text();
    		/* $('.btn-category').removeClass('active');
    		$(this).addClass('active'); */
    		
    		$('#category').val(content);
    		$('#movePage').submit();
    		
    	});
    	
    });
    
</script>
</body>
</html>

