<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>상품 등록</title>
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
        </div>
    </nav>

    <div class="container container-sm container-item-create">
        <h5 class="container-headline">중고거래 상품 등록</h5>

        <form class="form-item-create" action="uploadItem"  method="post" id="uploadForm" enctype="multipart/form-data">
            <div class="form-group form-picture">
                <div class="file-box">
                    <input class="upload-name" value="파일선택" disabled="disabled">

                    <label for="ex_filename" class="btn btn-secondary">업로드</label>
                    <input type="file" id="ex_filename" class="upload-hidden"  name="upload">
                </div>
            </div>

            <div class="form-group form-title">
                <input type="text" class="form-control" id="productsTitle" placeholder="제품 이름을 입력해주세요." name="title">
            </div>
            <div class="form-group form-category">
                <select id="productsCategory" class="form-control" name="category">
                    <option value="" disabled selected>카테고리를 선택해주세요.</option>
                    <option value="차량" <c:if test="${category=='차량'}">selected</c:if>>차량</option>
                    <option value="가구/인테리어" <c:if test="${category=='가구/인테리어'}">selected</c:if>>가구/인테리어</option>
                    <option value="유아동/유아도서" <c:if test="${category=='유아동/유아도서'}">selected</c:if>>유아동/유아도서</option>
                    <option value="생활/가공식품" <c:if test="${category=='생활/가공식품'}">selected</c:if>>생활/가공식품</option>
                </select>
            </div>
            <div class="form-group form-price">
                <input type="number" name="price" class="form-control" id="productsPrice" min="0" step="1000" placeholder="가격을 입력해주세요. (￦)">
            </div>
            <div class="form-group form-description">
                <textarea class="form-control" name="descriptionText" id="productsDescription" rows="10" placeholder="제품 설명을 작성해주세요."></textarea>
            	<input type="hidden" name="description" id="descriptionhtml">
            </div>
            <div class="form-group form-car-model-year car-relate">
                <select id="carModelYear" class="form-control" name="madedate">
                    <option value="" disabled selected>차량 연식을 선택해주세요</option>
                    <option value="2020">2020년</option>
                    <option value="2019">2019년</option>
                    <option value="2018">2018년</option>
                    <option value="2017">2017년</option>
                    <option value="2016">2016년</option>
                    <option value="2015">2015년</option>
                    <option value="2014">2014년</option>
                    <option value="2013">2013년</option>
                    <option value="2012">2012년</option>
                    <option value="2011">2011년</option>
                    <option value="2010">2010년</option>
                </select>
            </div>
            <div class="form-group form-car-mileage car-relate">
                <input type="number" class="form-control" id="carMileage" name="randistances" placeholder="주행거리를 입력해주세요.(km)">
            </div>
            <div class="form-group form-car-smoking car-relate">
                <label>차량 판매자 흡연 여부</label>
                <div class="form-check form-check-inline form-check-smoking">
                    <input class="form-check-input" type="radio" name="issmoke" id="inlineSmoker" value="true" checked>
                    <label class="form-check-label smoker" for="inlineSmoker">예, 흡연자 입니다.</label>
                </div>
                <div class="form-check form-check-inline form-check-nonsmoking">
                    <input class="form-check-input" type="radio" name="issmoke" id="inlineNonSmoker" value="false">
                    <label class="form-check-label non-smoker" for="inlineNonSmoker">아니오, 비 흡연자 입니다.</label>
                </div>
            </div>
            <button class="btn btn-primary btn-submit" type="button" id="submitButton">상품 등록하기</button>
        </form>
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
        $(document).ready(function(){
            var fileTarget = $('.file-box .upload-hidden');
			var fn;
            fileTarget.on('change', function(){
                if(window.FileReader){
                    var filename = $(this)[0].files[0].name;
                    fn=$(this)[0].files[0];
                } else {
                    var filename = $(this).val().split('/').pop().split('\\').pop();
                }

                $(this).siblings('.upload-name').val(filename);
                $("#ex_filename").val(fn);
            });
            
            $('.car-relate').css('display','none');
            
            
            if($('#productsCategory').val()=='차량'){
            	 $('.car-relate').css('display','block');
            }
            
            $('#productsCategory').on('change', function() {
            	  if(this.value=='차량'){
            		  $('.car-relate').css('display','block');
            	  }else{
            		  $('.car-relate').css('display','none');
            	  }
            });
            
            $("#submitButton").on('click',function(){
            	
            	var category=$('#productsCategory').val();
            	var carModelYear=$('#carModelYear').val();
            	var carMileage=$('#carMileage').val();

            	var ex_filename=$('#ex_filename').val();
            	var productsTitle=$('#productsTitle').val();
            	var productsPrice=$('#productsPrice').val();
            	var productsDescription=$('#productsDescription').val();
            	
            	
            	if(category==null){
            		alert('카테고리는 반드시 선택해주세요.');
            		return;
            	}
            	if(category=='차량'){//차량 제품 등록의 경우
            		if(carModelYear==null){
                		alert('차량연식은 반드시 선택해주세요.');
                		return;
            		}
            		if(carMileage=='' || carMileage.length==0){
                		alert('주행거리를 반드시 입력해주세요.');
                		return;
            		}
            	}else{//일반 제품 등록의 경우

            		if(!$.trim(ex_filename).length){
            	  		alert("제품이미지를 확인해주세요.");
            	  		return;
            	  	}

            		if(!$.trim(productsTitle).length){
            	  		alert("등록 제품제목을 확인해주세요.");
            	  		return;
            	  	}

            		if(!$.trim(productsPrice).length){
            	  		alert("가격을 확인해주세요.");
            	  		return;
            	  	}

            		if(!$.trim(productsDescription).length){
            	  		alert("설명칸을 확인해주세요.");
            	  		return;
            	  	}
            	}
            	
            	$("#descriptionhtml").val($('#productsDescription').val());
            	
            	$('#uploadForm').submit();
            });
            
        });
    </script>
</body>
</html>