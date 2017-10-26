<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/bootstrap/css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="/css/steps.css" type="text/css">
   
<title>Insert title here</title>
   

</head>
<body>

  <div>
    프로모션 아이디 : ${promotion.promo_id}
    <br>
    주최자 아이디 : ${promotion.user_id}
    <br>
    주최자 이름 : ${ownUser.user_name}
    </div>

<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%"><span class="sr-only">45% Complete</span></div>



	<div class="container">
	<div class="row">
		<section>
        <div class="wizard">
            <h1>Test</h1>
            ${promotion.join_cnt}
            
            <div class="wizard-inner">
                <div class="connecting-line"></div>
                <div class="connecting-line" style="background: #5BC0D8; width: 32%; margin-left: 10%;"></div>
                <ul class="nav nav-tabs" role="tablist" id="stepContent">
                
 <!--         

                    <li role="presentation" class="active">
                        <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Step 1">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-folder-open"></i>
                            </span>
                        </a>
                    </li>

					<li role="presentation" class="active">
                        <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Test">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-folder-open"></i>
                            </span>
                        </a>
                    </li>

                    <li role="presentation" class="disabled">
                        <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Step 2">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-pencil"></i>
                            </span>
                        </a>
                    </li>
                    <li role="presentation" class="disabled">
                        <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Step 3">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-picture"></i>
                            </span>
                        </a>
                    </li>

                    <li role="presentation" class="disabled">
                        <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Complete">
                            <span class="round-tab">
                           		 <div class="numberCircle">30</div>
                            </span>
                        </a>
                    </li> -->
                </ul>
            </div>

            <form role="form">
                <div class="tab-content">
                    <div class="tab-pane active" role="tabpanel" id="step1">
                        <h3>Step one</h3>
                        <p>first step</p>
                        <ul class="list-inline pull-right">
                            <li><button type="button" class="btn btn-primary next-step">next</button></li>
                        </ul>
                    </div>
                    <div class="tab-pane" role="tabpanel" id="step2">
                        <h3>Step two</h3>
                        <p>Second step</p>
                        <ul class="list-inline pull-right">
                            <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                            <li><button type="button" class="btn btn-primary next-step">next</button></li>
                        </ul>
                    </div>
                    <div class="tab-pane" role="tabpanel" id="step3">
                        <h3>Step three</h3>
                        <p>Third step</p>
                        <ul class="list-inline pull-right">
                            <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                            <li><button type="button" class="btn btn-default next-step">next</button></li>
                        </ul>
                    </div>
                    <div class="tab-pane" role="tabpanel" id="complete">
                        <h3>Complete steps</h3>
                        <p>You have successfully completed every steps.</p>
                        <ul class="list-inline pull-right">
                            <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                            <li><button type="button" class="btn btn-primary btn-info-full next-step">Submit</button></li>
                        </ul>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </form>
       	    </div>
   		 </section>
 	</div>
	</div>
	 
<script>
	$(document).ready(function () {
	    //Initialize tooltips
	    $('.nav-tabs > li a[title]').tooltip();
	    
	    
	    //목표 갯수에 따른 width변
	    $('.wizard .nav-tabs > li').css('width', '20%'); 
	    

	    
	    $('#stepContent').append
	   
	    
	    //Wizard
	    $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
	
	        var $target = $(e.target);
	    
	        if ($target.parent().hasClass('disabled')) {
	            return false;
	        }
	    });
	
	    $(".next-step").click(function (e) {
	
	        var $active = $('.wizard .nav-tabs li.active');
	        $active.next().removeClass('disabled');
	        nextTab($active);
	
	    });
	    $(".prev-step").click(function (e) {
	
	        var $active = $('.wizard .nav-tabs li.active');
	        prevTab($active);
	
	    });
	    
	    

	    
  		alert('${promotion.promo_id}');
  		alert(' ${benefit.get(1).getGoal_cnt}');
    	
	    
	    var benefits = ${benefits} 
	    	    
	    var benefit_list_html  = ''
	
	    
	    for (var i = 0; i < benefits.length; i++) {
    	    		var obj = benefits[i];
    	    			if (${promotion.join_cnt} > obj.goal_cnt) {
    	    			 	benefit_list_html += '<li role="presentation" class="active" >'
    	    			}else{
	   	   			benefit_list_html += '<li role="presentation" class="disabled" >'
    	    			}
			   	benefit_list_html += '<a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="' +obj.product_name + '"">'
			   	benefit_list_html += '<span class="round-tab"> '+  obj.goal_cnt   +' </span>    </a>   </li>		'	    
	    }
	    $("#stepContent").append(benefit_list_html);
	    	

	   
	});
	
	function nextTab(elem) {
	    $(elem).next().find('a[data-toggle="tab"]').click();
	}
	function prevTab(elem) {
	    $(elem).prev().find('a[data-toggle="tab"]').click();
	}

</script>	
	
	
</body>
</html