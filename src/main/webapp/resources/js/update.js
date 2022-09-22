$(function () {
		
    /**************** 등록버튼 클릭! ****************/
    $("#insert").click(function () {
        console.log("우랄랄랄라랄ㄹ라?");

/*
        if (!confirm("수정하시겠습니까?")) {
            alert("취소되었습니다.");
            return false;
        }
   */     
        
        
       // alert("수정이 완료 되었습니다.")
        $("#updatedForm").attr("action", "/updated_ok.action").submit();


    });


    /****************  한글 영문 숫자 유효성 검사 ****************/
    $("#id").keyup(function () {
        var re = /[ㄱ-ㅎㅏ-ㅣ가-힣]|[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
        f = $("#id").val();
        if (re.test(f)) {
            alert("영문자 및 숫자를 입력해주세요");
            $(this).val(f.replace(no, ''));
        }
    });
    $("#email1").keyup(function () {
        var re = /[ㄱ-ㅎㅏ-ㅣ가-힣]|[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
        f = $("#email1").val();
        if (re.test(f)) {
            alert("제대로된 E-mail 양식이 아닙니다.");
            $(this).val(f.replace(no, ''));
        }
    });

	$("#name").keyup(function(){
		var re = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
		f = $("#name").val();
		if (re.test(f)){alert("한글만 입력해주세요"); $(this).val(f.replace(no, ''));}
	});

    $("#eng_name").keyup(function () {
        var re = /[ㄱ-ㅎ0-9ㅏ-ㅣ가-힣]|[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
        f = $("#eng_name").val();
        if (re.test(f)) {
            alert("영문자만 입력해주세요");
            $(this).val(f.replace(no, ''));
        }
    });
    
	/******************* 아이디 중복체크 ********************/
	
		
	/******************* 비밀번호 중복체크 ********************/
		$(".pwdchk_button").click(function(){
			var pwd1 = $("#pwd1").val();
			var pwd2 = $("#pwd2").val();
			
			if(pwd1 !=""){
				if (pwd1 == pwd2) {
		                  alert("사용 가능한 비밀번호 입니다")
		                   $(".pwd1").val(pwd1);
		              } else {
		                  alert("비밀번호가 일치하지 않습니다!")
			    		 $("#pwd2").focus();
			    }
			   }else{
			       alert("비밀번호 입력하셈!!")
			    		 $("#pwd1").focus();
			}
		});
		
		
		
	/******************* selectbox에서 받은 이메일 값 input으로 넘기기 ********************/
		
    $("select[name=Emailselect]").on("change", function(){
        var $addr = $(this).closest(".mail").find("input[id=email2]");
        if ($(this).val() == "etc") {
            $addr.val('');
            $addr.prop("readonly",false);

        } else {
            $addr.val($(this).val());
            $addr.prop("readonly",true);
        }
    });

  /******************* 이메일 값 합치기 ********************/
		$("#insert").click(function(){    //등록 버튼 누르면 아래 이벤트 발생
			var email_id = $("#email1").val();
			var email_do = $("#email2").val();
			var mail = ""
			mail = email_id + "@" + email_do;
			
			$("#email").val(mail);
			console.log($("#email").val());
		}); 
		
	/******************* 전화번호 하이픈 넣기 ********************/	
			$(document).on("keyup", ".phone", function() { 
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		});	

	/******************* 휴대폰번호 하이픈 넣기 ********************/	
			$(document).on("keyup", ".hp", function() { 
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		});

	/******************* 주민등록번호 하이픈 넣기 	********************/	
			$(document).on("keyup", ".reg_no", function() { 
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/([\d|*]{6})([\d|*]+)/, '$1-$2'));
		});	
		
	/******************* 주민등록번호 별 넣기 	********************/	
			$(document).on("keyup", ".reg_no", function() { 
			$(this).val( $(this).val().replace(/(-?)([1-4]{1})([0-9]{6})\b/gi, '$1$2******'));
		});	
	
	
	/******************* 사업자 등록번호 하이픈 넣기 ********************/		
			$(document).on("keyup", ".cmp_reg_no", function() { 
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		});	
		
		
	/******************* 연령 ********************/		
		 	$("#reg_no").keyup(function(){
			var age1 = $("#reg_no").val();
			var age2 = age1.substring(0,2);
			
			
			
				if((2022-age2)>2000){
					var age3 = 2022-(Number(age2)+2000)+1;
					$("#years").val(age3+" 세");
				}else{
				var age3 = 2022-(Number(age2)+1900)+1;
				$("#years").val(age3+" 세");
			}		
		});
		
	/******************* 성별구분 ********************/			

		 	$("#reg_no").keyup(function(){
			var sex1 = $("#reg_no").val();
			var sex2 = sex1.substr(7,1);
			
			console.log(sex2);
			 
			 switch (sex2){
			    case "1": 
			    $("#sex").val("남성");
			      break; 
			      
			    case "2":
			    $("#sex").val("여성");
			      break;
			      
			    case "3":
			      $("#sex").val("남성");
			      break;
			      
			    case "4":
			      $("#sex").val("여성");
			      break; 

			      case "5": 
			    $("#sex").val("남성");
			      break; 
			      
			    case "6":
			    $("#sex").val("여성");
			      break;
			      
			    case "7":
			      $("#sex").val("남성");
			      break;
			      
			    case "8":
			      $("#sex").val("여성");
			      break; 
			  }
		});
		
		/******************* 입영일, 입사일 날짜비교 ********************/			
		
			$("#insert").click(function(){
			var mil_startdate = $(".mil_startdate").val();
			var mil_enddate = $(".mil_enddate").val();
			
			if(mil_startdate<=mil_enddate){
			  $(".mil_startdate").val(mil_startdate);
			}else{
			alert("전역일이 입영일보다 빠를 수 없습니다!");
			$(".mil_enddate").val("").focus();
			}
			});
		
			$("#insert").click(function(){
			var join_day = $(".join_day").val();
			var retire_day = $(".retire_day").val();
		
		
		/*
			
			if(join_day<=mil_enddate){
			  $(".join_day").val(join_day);
			}else{
			alert("전역일이 입영일보다 빠를 수 없습니다!");
			$(".retire_day").val("").focus();
			}
			
					*/
			
			});
			
	
			
		/******************* 연봉 콤마찍기 ********************/		
		
		$("#salary").on("keyup", function(){    
			$(this).val($(this).val().replace(/\,/g, '').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
		});
		
		
		/******************* 파일 업로드 ********************/		
			//profile_thumbnail 이미지 변경
			
				function setThumbnail(event){
					var reader = new FileReader();	
					reader.onload = function(event){ 
						var img = document.getElementById("profile_image");
						img.setAttribute("src", event.target.result);
						document.querySelector("#profile_image").appendChild(img);
					};				
					reader.readAsDataURL(event.target.files[0]);
				}
				
				
				// profile 미리보기
				
				function readImage(input) {
					if (input.files && input.files[0]) {
						const reader = new FileReader();
				
						reader.onload = (e) => {
							const previewImage = document.getElementById('profile_image');
							previewImage.src = e.target.result;
						}
						reader.readAsDataURL(input.files[0]);
					}
				}
					
				// 등록증 미리보기(modal)
				
					function readImage1(input) {
						if (input.files && input.files[0]) {
							const reader = new FileReader();
					
							reader.onload = (e) => {
								const previewImage = document.getElementById('modal-image1');
								previewImage.src = e.target.result;
							}
							reader.readAsDataURL(input.files[0]);
						}
					}
					
					// 이력서 미리보기(modal)
					
					function readImage2(input) {
						if (input.files && input.files[0]) {
							const reader = new FileReader();
					
							reader.onload = (e) => {
								const previewImage = document.getElementById('modal-image2');
								previewImage.src = e.target.result;
							}
							reader.readAsDataURL(input.files[0]);
						}
					}
										
										
							
			// profile 사진 preview
			$("#profile").change(function(e) {
				readImage(e.target);
			})
			// cmpRegImage 사진 preview
			$("#cmp_reg_image").change(function(e) {
				readImage1(e.target);
			})
			// carrier 사진 preview
			$("#carrier").change(function(e) {
				readImage2(e.target);
			})
		
		
		
				
				
				// Image 처리
				
				
			$("#cmp_reg_image").change(function() {
				$("#cmp_upload_txt").val($(this).val());
			})
			$("#carrier").change(function() {
				$("#carrier_upload_txt").val($(this).val());  
			})
			
			

	
				
						
						
						
						
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

});