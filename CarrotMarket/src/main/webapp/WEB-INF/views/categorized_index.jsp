<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>당근마켓 - 중고거래는 당근마켓!</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.6.2/css/bootstrap-slider.min.css" integrity="sha256-G3IAYJYIQvZgPksNQDbjvxd/Ca1SfCDFwu2s2lt0oGo=" crossorigin="anonymous" />
    <link rel="stylesheet" type="text/css" href="resources/css/style.css">
</head>
<body>
    <nav class="navbar nav-global fixed-top navbar-expand-sm">
        <div class="container">
            <a class="navbar-brand" href="index">
                <img class="img-brand" alt="당근마켓" width="132" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/header/logo-basic-00b7e471b721ce9db8b0758c05a84684413c8aef1ad54caa0f3fcbe7328c947f.svg">
            </a>
            <ul class="navbar-nav ml-auto">
            
            	<c:if test='${category=="차량"}'>
	                <li class="nav-item">
	                    <button class="btn-filter" id="filterModal" data-toggle="modal" data-target="#section-filter">
	                        <!-- filter가 적용되어 있다면 btn-filter에 active 클레스를 추가해주세요.-->
	                        <i class="material-icons ic-filter">filter_list</i>
	                    </button>
	                </li>
				</c:if>
                <li class="nav-item">
                    <a href="item_create?category=${category}"><i class="material-icons ic-create">create</i></a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container container-categorized-index">
        <h5 class="container-headline">중고 ${category} 목록</h5>

        <ul class="list-products row" id="contents">
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

    <div class="modal fade" id="section-filter" tabindex="-1" role="dialog" data-controller="design" data-action="modal_example" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-filter" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">차량 조건 설정</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="material-icons">clear</i>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="form-group filter-car-model-year">
                        <label class="" for="sliderCarModelYear">차량 연식 범위</label>
                        <input class="input-slider-item" id="sliderCarModelYear" type="text" aria-describedby="sliderCarModelYearHelp">
                        <small id="sliderCarModelYearHelp" class="text-muted">2010년부터 2020년까지</small>
                    </div>

                    <div class="form-group filter-car-mileage">
                        <label for="sliderCarMileage">차량 주행 거리</label>
                        <input class="input-slider-item" id="sliderCarMileage" type="text" aria-describedby="sliderCarMileageHelp">
                        <small id="sliderCarMileageHelp" class="text-muted">0km부터 10000km까지</small>
                    </div>

                    <div class="form-group filter-car-smoking">
                        <label>차량 판매자 흡연 여부</label>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="formRadiosSmoking" id="formRadiosSmoking_1" value="option1" checked>
                            <label class="form-check-label" for="formRadiosSmoking_1">
                                흡연
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="formRadiosSmoking" id="formRadiosSmoking_2" value="option2">
                            <label class="form-check-label" for="formRadiosSmoking_2">
                                비흡연
                            </label>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" id="rollBackBtn" class="btn btn-secondary mr-auto">초기화</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="button" id="filterBtn" class="btn btn-primary">적용</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.6.2/bootstrap-slider.js" integrity="sha256-59/apVFrosMLFX2dHZLGvb3nPpu7e0Yx1rsDr1dTRrk=" crossorigin="anonymous"></script>
    <script>
    $(function(){
    	
		$("#filterBtn").on('click',function(){
    		$("#filterModal").addClass("active");
    		
    		$.ajax({
        		url:"filteCars",
        		data:{
        			
        			sliderCarModelYear:$("#sliderCarModelYear").val(),
        			sliderCarMileage:$("#sliderCarMileage").val(),
        			formRadiosSmoking:$("input:radio[name=formRadiosSmoking]:checked").val()
        			
        		},
        		type:"post",
        		success:function(serverData){
					var content="";
        			
        			
        			for(var i=0;i<serverData.length;i++){
        				content+='<li class="list-products-item col-12 col-md-4 col-lg-3">';
            			content+='<a href="detail?seq='+serverData[i].productseq+'">';
            			content+='<div class="card">';
            			content+='<div class="card-img-top" style="background: url(\'http://www.shareshard.com/CarrotMarket/resources/images/'+serverData[i].image+'\') no-repeat center; background-size: cover; height: 240px"></div>';
            			content+='<div class="card-body">';
            			content+='<h5 class="title">'+serverData[i].title+'</h5>';
            			content+='<h6 class="price">';
            			content+=serverData[i].price.toLocaleString()+'원</h6>';
            			content+='<div class="text-muted">';
            			content+='<h6 class="category">'+serverData[i].category+'</h6>';
            			content+='<time datetime="'+serverData[i].created_at+'">'+serverData[i].diffDays+'일전</time>';
            			content+='</div></div></div></a></li>';
        			}
        			
        			$("#contents").html(content);
        		}
        	});
    		
    	});
    	
    	$("#rollBackBtn").on('click',function(){
    		$("#filterModal").removeClass("active");
    		
    		$.ajax({
        		url:"rollBackBtn",
        		type:"post",
        		success:function(serverData){
        			var content="";
        			
        			
        			for(var i=0;i<serverData.length;i++){
        				content+='<li class="list-products-item col-12 col-md-4 col-lg-3">';
            			content+='<a href="detail?seq='+serverData[i].productseq+'">';
            			content+='<div class="card">';
            			content+='<div class="card-img-top" style="background: url(\'http://www.shareshard.com/CarrotMarket/resources/images/'+serverData[i].image+'\') no-repeat center; background-size: cover; height: 240px"></div>';
            			content+='<div class="card-body">';
            			content+='<h5 class="title">'+serverData[i].title+'</h5>';
            			content+='<h6 class="price">';
            			content+=serverData[i].price.toLocaleString()+'원</h6>';
            			content+='<div class="text-muted">';
            			content+='<h6 class="category">'+serverData[i].category+'</h6>';
            			content+='<time datetime="'+serverData[i].created_at+'">'+serverData[i].diffDays+'일전</time>';
            			content+='</div></div></div></a></li>';
        			}
        			
        			$("#contents").html(content);
		            
        		}
        	});
    		
    	});

    	$('#sliderCarModelYear').on('change',function(){
    		var from =$(this).val().split(",")[0];
    		var to =$(this).val().split(",")[1];
    		$("#sliderCarModelYearHelp").html(from+"년부터 "+to+"년까지"); 
    		
    	});
    	$('#sliderCarMileage').on('change',function(){
    		var from =$(this).val().split(",")[0];
    		var to =$(this).val().split(",")[1];
    		$("#sliderCarMileageHelp").html(from+"km부터 "+to+"km까지");
    		
    	});
    	
    })
    
        // With JQuery
        $("#sliderCarModelYear").slider({min: 2010, max: 2020, value: [2010, 2020], focus: true});
        $("#sliderCarMileage").slider({min: 0, max: 10000, value: [0, 10000], focus: true});
        $('#myModal').modal(options);
        
        
        
    </script>
</body>
</html>