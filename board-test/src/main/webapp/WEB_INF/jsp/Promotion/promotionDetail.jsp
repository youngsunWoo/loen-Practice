<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page session="true" %>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>상세보기</title>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>

<link rel="stylesheet" href="/bootstrap/css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="https://cdnimg.melon.co.kr/static/member/resource/style/me1/qy/y/1edydz6hfyj.css" type="text/css">
<link rel="stylesheet" href="/css/steps.css" type="text/css">

<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


<style type="text/css">

/*Form Wizard*/
.bs-wizard {border-bottom: solid 1px #e0e0e0; padding: 0 0 10px 0;}
.bs-wizard > .bs-wizard-step {padding: 0; position: relative;}
.bs-wizard > .bs-wizard-step + .bs-wizard-step {}
.bs-wizard > .bs-wizard-step .bs-wizard-stepnum {color: #595959; font-size: 16px; margin-bottom: 5px;}
.bs-wizard > .bs-wizard-step .bs-wizard-info {color: #999; font-size: 14px;}
.bs-wizard > .bs-wizard-step > .bs-wizard-dot {position: absolute; width: 30px; height: 30px; display: block; background: #fbe8aa; top: 45px; left: 50%; margin-top: -15px; margin-left: -15px; border-radius: 50%;} 
.bs-wizard > .bs-wizard-step > .bs-wizard-dot:after {content: ' '; width: 14px; height: 14px; background: #fbbd19; border-radius: 50px; position: absolute; top: 8px; left: 8px; } 
.bs-wizard > .bs-wizard-step > .progress {position: relative; border-radius: 0px; height: 8px; box-shadow: none; margin: 20px 0;}
.bs-wizard > .bs-wizard-step > .progress > .progress-bar {width:0px; box-shadow: none; background: #fbe8aa;}
.bs-wizard > .bs-wizard-step.complete > .progress > .progress-bar {width:100%;}
.bs-wizard > .bs-wizard-step.active > .progress > .progress-bar {width:50%;}
.bs-wizard > .bs-wizard-step:first-child.active > .progress > .progress-bar {width:0%;}
.bs-wizard > .bs-wizard-step:last-child.active > .progress > .progress-bar {width: 100%;}
.bs-wizard > .bs-wizard-step.disabled > .bs-wizard-dot {background-color: #f5f5f5;}
.bs-wizard > .bs-wizard-step.disabled > .bs-wizard-dot:after {opacity: 0;}
.bs-wizard > .bs-wizard-step:first-child  > .progress {left: 50%; width: 50%;}
.bs-wizard > .bs-wizard-step:last-child  > .progress {width: 50%;}
.bs-wizard > .bs-wizard-step.disabled a.bs-wizard-dot{ pointer-events: none; }
/*END Form Wizard*/

.evenvtBt {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    border-radius: 25px;
    margin-left: 20px;
    margin-right: 20px;
}
    
</style>

<style type="text/css">
.product_detail_icon {
    display: inline-block;
    width: 62px;
    height: 16px;
    background: url(//image.melon.co.kr/resource/image/web/cm/bg_icon_product.png) no-repeat 0 0;
    font-size: 0;
    line-height: 0;
    vertical-align: top;
}

.product_detail_icon.mobile {
    background-position: 0 -20px;
}
.product_detail_icon.pc {
    background-position: 0 -41px;
}

</style>

</head>
<body>
<div class="modal fade" id="statusModal" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <center><h2>이미 종료된 프로모션 입니다.</h2></center>
        </div>
        <div class="modal-body">
       		<center><h2>제공된 혜택 내역</h2></center>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="productModalClose">선택완료</button>
        </div>
      </div>
      
    </div>
</div>


<div class="modal fade" id="productModal" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">참여자 List보기</h4>
        </div>
        <div class="modal-body">
        		<div id="participateDiv"></div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="productModalClose">선택완료</button>
        </div>
      </div>
      
    </div>
</div>

 <div id="wrap" class="join">
	<div id="member_header" 
		style="  background: url(http://cdnimg.melon.co.kr/resource/image/web/event/bg_vip_benefit01.jpg) no-repeat 0 0; width: 1008px;">
	
			<!-- GNB -->
			<div id="gnb" >
				<h2>
				<p style="color: #f9f1d8; font-size: 15px; margin-top: 20px; padding: 30px;">
					[ ${ownUser.user_name} ] 님이 추천하는 상품을 구매하고 특별한 혜택을 함께하세요!
				</p>
				</h2>
				
				<h2 class="mem_info_title"> ${ownUser.user_name} 님의 Promotion</h2>
			</div>
			<!-- //GNB -->
	
    
    <div id="member_cont_wrap" class="clfix">
    
					<h2>추천상품</h2>
		<div class="box_mem_info" style=" background: rgba(0, 0, 0, 0);">
					
				<div style=" margin:auto; width: fit-content;padding: 20px;">
						<img src="/img/product/${promotion.productCode}.png" width="250" height="120" style="position: relative;margin: auto;">

						<div id = "Product_name_div">
							<p id ='product_name' style="color: #00b423; font-size: 23px; margin-top: 20px;">${product.product_name}</p>
						</div>
				</div>
					
					<br>	
					
					
				    <div>
					    <ul class="product_icon">
							<li><span class="product_detail_icon">모바일 PC</span><span class="txt">무제한 듣기</span></li>
							<li><span class="product_detail_icon mobile">모바일</span><span class="txt">무제한 다운로드</span></li>
							<li><span class="product_detail_icon pc">모바일</span><span class="txt">무제한 다운로드</span></li>
						</ul>
					</div>
				    
     	 </div>
     	 
     	 
     	  			<div>
					    <table>
					    	<tr>
					    	    <td>
					    	    		<img src="/img/caution.png" width="20" height="20" style="position: relative;margin: 8px;">
					    	    
					    	    </td>
					     	<td >
					 			<div id = "caution"></div>
							</td>
					    	</tr>
					    </table>
				    </div>
      </div>
      

	</div>
	
	
	
	<div id="member_header" 
		style="  background: #f3f3f2; width: 1008px;">
		
			<div id="gnb">
				<!-- 모일수록 커지는 혜택 img -->
				<img src="/img/promo_1.png" width="250" height="85" style="position: relative;margin: auto;">

			
				
				<h2 class="mem_info_title"> SUNNY 님의 Promotion</h2>
				
				
			</div>
			
			
			<div style="  margin: 50px;">
				<p id="joinedInfo" style="   font-size: 18px;"> </p>
			
			</div>
			
			<!-- 혜택 출력하기 위한 Div영역 -->
			
			<div class="row bs-wizard" id="benefitDiv" style="border-bottom:0;margin-top: 20px;margin-bottom: 80px;width: 1008px;padding: 10px;">
                
               
            </div>
			
			<!-- 혜택 출력용 끝 -->
			
			
		
			<div class="wrap_btn">
				<form method="post" name="paticipateForm" id="paticipateForm">
				 	<input type="hidden" name ="promoId" value="${promotion.promoId}">
				 	<input type="hidden" name ="productCode" value="${promotion.productCode}">
				 	<input type="hidden" name ="prehref" id = "prehref">
				</form>		 
				
				<center>
					<input type="button" id ="participateBt" href="#" class="evenvtBt"  onclick="checkAvailable();" value="이벤트참여하기" />
					<input type="button" id = "participateListBt" href="#" class="evenvtBt" value="참여자확인하기" class="btn btn-default" />
				</center>
			</div>
					 

</div>
        


	<script type="text/javascript">
			
		$(document).ready(function () {
				
			
			
			
		       var  status = ${promotion.state}
		       if (status=='1'){
		    	   		$("#participateBt").css("background-color", "#929292");
		    	   		$("#participateBt").attr("disabled","disabled")
		    	   		
		    	   		$('#statusModal').modal();
		       } 
			
			
			
				// 가져오기   
			    var benefits = ${benefits} ;
			    var joinCnt =  ${promotion.joinCnt};
			    var stepwidth = $(benefitDiv).width()/(benefits.length+1);
			    
			
			    var benefit_list_html  = '';
			    	//혜택 출력하기
	    			benefit_list_html += '<div class="col-xs-3 bs-wizard-step complete" style="width:'+stepwidth+'px;">';
				benefit_list_html += '<div class="text-center bs-wizard-stepnum"> START! </div>';
				benefit_list_html += '<div class="progress"><div class="progress-bar" id="prograssBar0"></div></div>';
				benefit_list_html += '<a href="#" class="bs-wizard-dot"></a>';
				benefit_list_html += '</div>';
				
			    for (var i = 0; i < benefits.length; i++) {
		    	    		var obj = benefits[i];
		    	    			if (joinCnt >= obj.goal_cnt) {
		    	    			 	benefit_list_html += '<div class="col-xs-3 bs-wizard-step complete" style="width:'+stepwidth+'px;">';
		    	    			}else{
			   	   			benefit_list_html += '<div class="col-xs-3 bs-wizard-step disabled" style="width:'+stepwidth+'px;">';
		    	    			}
					   	benefit_list_html += '<div class="text-center bs-wizard-stepnum">'+ obj.goal_cnt +'명 </div>';
					   	benefit_list_html += '<div class="progress"><div class="progress-bar" id="prograssBar'+(i+1)+'"></div></div>';
						benefit_list_html += '<a href="#" class="bs-wizard-dot"></a>';
						benefit_list_html += ' <div class="bs-wizard-info text-center">제공예정 혜택</div>';
						benefit_list_html += ' <div>'+obj.offer +obj.unit+'</div>';
						benefit_list_html += '</div>';
			    }
			    $("#benefitDiv").append(benefit_list_html);
			
			    joined_info_html =  benefits[benefits.length-1].goal_cnt+ "명중 "+ joinCnt + "명 참여완료!";
			        
			    $("#joinedInfo").append(joined_info_html);
			    
			    //Prograss  UI처리 
			    for (var i = 0; i < benefits.length; i++) {
    	    				var obj = benefits[i];
    	    				var obj_next = benefits[i+1];

    	    				if (i==0 && joinCnt < obj.goal_cnt){
    	    					var midCnt = obj.goal_cnt / 2
    	    					if (midCnt > joinCnt){
        	    					var prograssRate =  ( joinCnt ) * (100 / midCnt )
    	    						 $("#prograssBar0").css('width', prograssRate+'%');
    	    					}
    	    					else{
    	    						var prograssRate = (joinCnt - midCnt) * (100 / benefits[0].goal_cnt )
   	    						 $("#prograssBar1").css('width', prograssRate+'%');
    	    					}    	    					    	    				
    	    				}
    	    			
    	    				if (obj.goal_cnt <= joinCnt &&  joinCnt <  obj_next.goal_cnt){
    	    					alert ('obj.goal_cnt : '+ obj.goal_cnt )
    	    					var midCnt = (obj.goal_cnt + obj_next.goal_cnt)/ 2 ;
    	    					if (midCnt > joinCnt){
    							var prograssRate =   55 + ( joinCnt - obj.goal_cnt ) * (100 / (obj_next.goal_cnt - obj.goal_cnt) )		
    						    
    						    $("#prograssBar"+(i+1)).css('width', prograssRate+'%');
    							
    						    
    				    		}else{
    				    			var prograssRate =  ( joinCnt - midCnt ) * (100 / (obj_next.goal_cnt - obj.goal_cnt) )
    				    			if ((i+2) == benefits.length){
    				    				prograssRate = prograssRate*2
    				    			}
							$("#prograssBar"+(i+2)).css('width', prograssRate+'%');
    				    		}
    	    				}
			    	}
			    
			    //상품 주의사항 출력
			    var productCode = ${promotion.productCode}
			    cautionGubun = productCode.substr(0, 1);
			   
			    alert(cautionGubun)
			    
				var product_caution_html ='<div id = "cautionInfo">'
				
				if (cautionGubun == '0') {
					product_caution_html += '<p>다운로드 파일은 DRM(무단 복제 방지 기술)이 적용되어 있어, 매월 기간연장이 필요합니다.</p>'
					product_caution_html += '<p>프리클럽은 스마트 프리클럽과 달리 PC에서도 100곡까지 다운로드 가능합니다.</p>'
					product_caution_html += '<p>음악 외 EBS, 이보영 등 어학 서비스도 무제한으로 다운로드/듣기 가능합니다.</p>'
				} else if (cautionGubun == '1'){
					product_caution_html += '<p>모바일 스트리밍클럽은 휴대폰과 태블릿만 지원합니다.</p>'
					product_caution_html += '<p>PC에서도 이용을 원하시는 고객님은 스트리밍클럽을 구매해 주세요.</p>'
					product_caution_html += '<p>음악 외 EBS, 이보영 등 어학 서비스를 무제한으로 들으실수 있습니다.</p>'
					
				}else {
					product_caution_html += '<p>다운로드 파일은 MP3 파일을 지원하는 모든 기기에서 재생되며, 기간 연장이 필요 없습니다.</p>'
					product_caution_html += '<p>음악 외 어학을 무제한으로 들으실 수 있으며, 음악 곡 수만큼 어학을 다운로드 하실 수 있습니다</p>'
				}
				
				product_caution_html += "</div>"

				$("#caution").append(product_caution_html);
			    
			    
			}
		)
	    
		</script>
	    
	    
		<script type="text/javascript">

		//$("#prehref").val() = document.referrer;

		var formData = $("#paticipateForm").serialize();
		 
		function insertParticipate() {
					 $.ajax({
						url : '/Promotion/PaticipatePromotion',
			           type: "POST",	
					   data : formData,
					   beforeSend : function(xmlHttpRequest){
			                xmlHttpRequest.setRequestHeader("AJAX", "true"); // ajax 호출을  header에 기록
			            },
			           dataType : "json", 
			           success: function(data) {
			        	 	 if(data == null){
			        		 }else{
			        		  	 alert("프로모션 참여 완료!");
			        		  	 openShareWindow(data);
			        		  	 location.reload();
			        		 }
			           },
					   error:function(xhr, textStatus, error){
					 		  if(xhr.status=="503"){
					 			 alert("로그인이 필요한 서비스 입니다. 로그인 후 이용해주세요.");
					 			 location.href = "/login";
					 			 return false;
					 		  }else{
						 		 alert("[프로모션 참여 오류] 관리자에게 문의하세요.");
					 		  }
					 	 }
					 });
		}
		  
		</script>
		
		<script type="text/javascript">
		function checkAvailable(){
			
				
		       if( '${sessionScope.LoginUser.user_id}' == '${promotion.userId}'){
		            alert("프로모션 주최자는 참여하실 수 없습니다." );
		            return false;
		        }
		       
		       $.ajax({
					url :  '/Promotion/checkAbailable',
		           type : "POST",	
				   data : formData,	
				   beforeSend : function(xmlHttpRequest){
		                xmlHttpRequest.setRequestHeader("AJAX", "true"); // ajax 호출을  header에 기록
		            },
		           dataType : "text", 
		           success: function(data) {
		               if(data == '0'){
		               		insertParticipate();
		               }else if (data == 1){
		               		alert("동일한 상품 구매이력이 있어 참여하실수 없습니다.");
		               	 	return false ;
		               }else {
		               		alert("이미 참여한 프로모션은 참여하실수 없습니다.");
		            	   	 	return false; 
		               }
		           },
				 	   error:function(xhr, textStatus, error){
				 		  if(xhr.status=="503"){
				 			 alert("로그인이 필요한 서비스 입니다. 로그인 후 이용해주세요.");
				 			 location.href = "/login";
				 			 return false
				 			 }
				 	 }
				 });
		}
		
	
		
		 $('#participateListBt').click(function(e){
			 $("#participatesInfo").remove();
		        var participate_list_html = '<table id="participatesInfo" class="table">'
		        	participate_list_html += '  <thead class="thead-dark"> <tr>'
	   	    		participate_list_html += '<th>참여일시</th><th>사용자ID</th><th>사용자이름</th> </td> </thead>'
	   	    		var participates = ${participateList} 
			    for (var i = 0; i < participates.length; i++) {
		    	    		var obj = participates[i];
		    	    		participate_list_html += '<tr>'
			    	    //	participate_list_html += '<td><div class = "benefit_info">' +obj.joinDate +'</div></td>'
			    	    	participate_list_html += '<td><div class = "benefit_info">' +obj.joinDate +'</div></td>'
		    	    		participate_list_html += '<td> <div class = "benefit_goal"> <span>' + obj.userId + '<span></div></td>'
		    	    		participate_list_html += '<td><div class = "benefit_info">' +obj.userName +'</div></td>'
		    	    		//if (obj.gerder == '1'){
		    	    		//	participate_list_html += '<td><div class = "benefit_info">남</div></td>'
		    	    		//} else{
		    	    		//	participate_list_html += '<td><div class = "benefit_info">여</div></td>'
		    	    		//}
		    	    		//participate_list_html += '<td><div class = "benefit_info">' +obj.age +'</div></td>'	    	    		
		    	    		//participate_list_html += '</tr>';
			    }
	   	    		participate_list_html += '</table>';
			    $("#participateDiv").append(participate_list_html);
			 
		 		$('#productModal').modal();
		 });
		
		function openShareWindow(data){
			var popupOption = 'directories=no, toolbar=no, location=no, menubar=no, status=no, scrollbars=no, resizable=no, left=400, top=200, width=600, height=550';
			window.open("/Promotion/SharePopup?promonId=${promotion.promoId}&flag=1", 'test', popupOption);
		}
		
	</script>    
	    

	 
</body>
</html>