var current = null;

document.querySelector('#password').addEventListener('focus', function(e) {
  if (current) current.pause();
  current = anime({
    targets: 'path',
    strokeDashoffset: {
      value: 0, // -336
      duration: 3500,
      easing: 'easeOutQuart'
    },
    strokeDasharray: {
      value: '240 1386',
      duration: 700,
      easing: 'easeOutQuart'
    }
  });
});
document.querySelector('#submit').addEventListener('focus', function(e) {
  if (current) current.pause();
  current = anime({
    targets: 'path',
    strokeDashoffset: {
      value: -730,  // -336 , -730
      duration: 3500,
      easing: 'easeOutQuart'
    },
    strokeDasharray: {
      value: '530 1386', // '240 1386' , 50-25
      duration: 3500,
      easing: 'easeOutQuart'
    }
  });
});
$( "#password" ).keyup( function() {
  if( $( this ).val() != "" ) {
      $( "#submit" ).css("color", "#f2f2f2");
      if (current) current.pause();
      current = anime({
        targets: 'path',
        strokeDashoffset: {
        value: -730,
        duration: 3500,
        easing: 'easeOutQuart'
      },
      strokeDasharray: {
        value: '530 1386',
        duration: 3500,
        easing: 'easeOutQuart'
      }
    });
  }
}
).keyup();

// ====== BUTTONS =====
$('#submit').click( function() {
  // send to java servlet

      $.ajax({
        type: "POST",
        url: "../../login",
        data: {
          username: sessionStorage.getItem("username"),
          password:  document.getElementById("password").value
         },
         success: function(data){
           var result = JSON.parse( data );

           setTimeout(function(){
              if(result.status === true){  // login ok
                window.location.replace("app-home.jsp");
              }else{ // error login
                alert("Error - password");
              }
            }, 1000
          );
        }

      });

});

$('#btn_back').click( function(){
      window.location.replace("../../index.html");
  }
);
$('#btn_singout').click( function(){
      window.location.replace('../../Logout');
  }
);

// if session element is null -> to login
if( sessionStorage.getItem("timeLock") == null
 || sessionStorage.getItem("fftp_userFirstName") == null
 || sessionStorage.getItem("fftp_userLastName") == null
 || sessionStorage.getItem("username") == null
){
  window.location.replace("login.jsp");
}

setInterval( function myTimer() {
    var time_lock = new Date ( sessionStorage.getItem("timeLock") ) ;
    var time_now = new Date();

    // result
    var h = time_now.getHours() - time_lock.getHours() ;
    var m = time_now.getMinutes() - time_lock.getMinutes();

    if( h != 0 )
      document.getElementById("timeLock_h").innerHTML = h + "h " ;
    if( m != 0 )
      document.getElementById("timeLock_m").innerHTML = m + "m " ;

},  1000 );

document.getElementById("fullName").innerHTML =  sessionStorage.getItem("fftp_userFirstName") + " " + sessionStorage.getItem("fftp_userLastName");
