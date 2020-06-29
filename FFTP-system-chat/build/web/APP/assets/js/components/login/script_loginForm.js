if( sessionStorage.getItem("username") != null
 && sessionStorage.getItem("fftp_userFirstName") != null
 && sessionStorage.getItem("fftp_userLastName") != null
 && sessionStorage.getItem("timeLock") != null
){
    window.location.replace("unlock.html");
}

window.onload = getPosition();

var position = { coordinate: null, ip: null };

// get ip and coordinate from client
function geoFindMe() {

  if (!navigator.geolocation){
    console.log("Geolocation is not supported by your browser. ");
  }

  function success( positionByBrowser ) {
    // set more accurate coordinate from browser if enabled
    position.coordinate = { lat: positionByBrowser.coords.latitude, lon: positionByBrowser.coords.longitude };
  }

  function error() {
    console.log("Unable to retrieve your location");
  }

  navigator.geolocation.getCurrentPosition( success, error );
}

function getPosition(){

  $.ajax({
		url: "http://ip-api.com/json",
		type: "GET",
		success: function( positionByIp ){
        console.log( positionByIp );
        position.coordinate = { lat: positionByIp.lat, lon: positionByIp.lon };
        position.ip = positionByIp.query ;
		}
	});

  geoFindMe();
}



// == !DEV FUNCTION ==
function point(){
  console.log(position);
  console.log("lat:"+ position.coordinate.lat + "/lon:" + position.coordinate.lon + "/ip:" + position.ip ) ;
}



$('#login').click(function(){
    $('.login').addClass('tilt') // naklanq nazad
    // move to left login form
    setTimeout(function(){
        $('.login').addClass('moveLeft1')
      },300
    );


    $.ajax({
      type: "POST",
      url: "../../login",
      data: {
        username: document.getElementsByName("username")[0].value ,
        password: document.getElementsByName("password")[0].value ,
        point:    position
      },
      beforeSend: function(){
        // form authent loading move top ^
        setTimeout(function(){
              $(".authent").show().animate({top:-1000},{easing : 'easeOutQuint' ,duration: 5700, queue: false });
              $(".authent").animate({opacity: 1},{duration: 200, queue: false }).addClass('visible');
            },500
        );
        // return to center - login form
        setTimeout(function(){
              $(".authent").show().animate({right:25},{easing : 'easeOutQuint' ,duration: 600, queue: false });
              $(".authent").animate({opacity: 0},{duration: 200, queue: false }).addClass('visible');
              $('.login').removeClass('moveLeft1');
            }, 2500// time loading success
        );
      },
      success: function( data ){
        var result = JSON.parse( data );

        // create form for result - form login
        setTimeout(function(){
              $('.login').removeClass('tilt')
              $('.login div').fadeOut(123); // remove all from div.login
            },2800
          );
        // show subject in form result -> ok or error | authentication -> true/false
        if( result.status === true){  // login ok
          setTimeout(
              function(){
                $('.success').fadeIn();
                // wait and sendRedirect to url
                setTimeout(function(){
                    window.location.replace("app-home.jsp");
                  }, 1000
                );
              },
              3200
            );
        }else{ // error login
          setTimeout(
              function(){
                $('.error').fadeIn();
              }
              ,3200
            );
        }
      }

    });

});


$('input[type="text"],input[type="password"]').focus(function(){
  $(this).prev().animate({'opacity':'1'},200)
});
$('input[type="text"],input[type="password"]').blur(function(){
  $(this).prev().animate({'opacity':'.5'},200)
});
$('input[type="text"],input[type="password"]').keyup(function(){
  if(!$(this).val() == ''){
    $(this).next().animate({'opacity':'1','right' : '30'},200)
  } else {
    $(this).next().animate({'opacity':'0','right' : '20'},200)
  }
});

var open = 0;
$('.tab').click(function(){
  $(this).fadeOut(200,function(){
    $(this).parent().animate({'left':'0'})
  });
});

// ====== BACK BUTTON =====
$('#back_button').click(function(){
    // if in login return to index(home)
    // if in forgotPassword-> to login
    if ($('.forgotPassword').is(":visible")){
      window.location.replace("login.jsp");
    }else{
      window.location.replace("../../index.html");
    }
  }
);

// ========== FORGOT PASSWORD FORM =========
$('#forgot_pass').click(function(){
    $('.login').addClass('tilt') // naklanq nazad
    // move to left forgotPassword form
    setTimeout(function(){
        $('.login').addClass('moveLeft2')
      },300
    );
    // show forgotPassword
    setTimeout(function(){
        //reset form
        $('.reset_password_box').show();
        document.getElementById("username_rsf").value = ''; // null value username
        document.getElementById('text_title').innerHTML = "Reset your password"; // set title

        $('.forgotPassword').fadeIn();
      }, 1200
    );
  }
);

$('#reset').click(function(){

    $.ajax({
      type: "POST",
      url: "../../Reset_password",
      data: {
        username: document.getElementById("username_rsf").value
      },
      beforeSend: function(){
        $('.reset_password_box').hide();
      },
      success: function(data){
        var result = JSON.parse( data );

        if( result.status === 1){   // OK
          document.getElementById('text_title').innerHTML = 'You will get a SMS with instructions as well as an email.';
          // show authent form -> ...top ^...
          setTimeout(function(){
                document.getElementById('text_authForm').innerHTML = 'Sending...';
                $(".authent").show().animate({top:-1000},{easing : 'easeOutQuint' ,duration: 5700, queue: false });
                $(".authent").animate({opacity: 1},{duration: 200, queue: false }).addClass('visible');
            },500
          );
          setTimeout(function(){
                $(".authent").show().animate({bottom:25},{easing : 'easeOutQuint' ,duration: 600, queue: false });
                $(".authent").animate({opacity: 0},{duration: 200, queue: false }).addClass('visible');
              },2500
          );
        }else if( result.status === 2){
          // set new title on forgotPassword form
          document.getElementById('text_title').innerHTML = 'Error, user not found';
        }else if( result.status === 0){ // ERROR SERVER
          document.getElementById('text_title').innerHTML = 'Error sending. Try again';
        }else{ // ERROR
          document.getElementById('text_title').innerHTML = 'Error. Try again';
        }

        // return to login form
        setTimeout(function(){
            // remove forgotPassword
            $('.forgotPassword').fadeOut(200); // remove form forgotPassword
            //  return login to center
            setTimeout(function(){
              $('.login').removeClass('moveLeft2');
            }, 800// time loading success
          );
            // standup and reload login
            setTimeout(function(){
              $('.login').removeClass('tilt');
              location.reload(); // reload
            },1500
          );
          }, 2500
        );
      }

    });

  }
);
