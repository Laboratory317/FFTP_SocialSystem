window.onload = checkNewStatus();

function userChangeAction( newAction ){
  // UPDATE user_status :
  $.post( "../../changeStatus", { action : newAction } ).done( function( status ) {
    console.log("SET:" + newAction + '/' + status);
  });
  checkNewStatus();
}

// check only 5 sec. for new data
setInterval( function(){ checkNewStatus() } ,  5000 );

function checkNewStatus(){
  $.post( "../../changeStatus" ).done( function( data ) {
    result = JSON.parse( data );


    var active = result.active;

    $('#action_label').text( active );

    var action_style = switchActive( active );

    // get elements by name (status-user)
    var elements = document.getElementsByName("status-user");

    for( var i = elements.length - 1; i >= 0; --i ){
        elements[i].className =  "status " + action_style + " s-4"  ; // set new class status ( online/offline....)
    }

  });
}

function switchActive( active ){
  var action_style ;

  if( active === "online" ){
     action_style = "text-green icon-checkbox-marked-circle";

  }else if( active === "work" ){
     action_style = "text-blue icon-flash";

  }else {
     action_style = "text-gray icon-do-not-disturb ";
  }
  return action_style;
}

// get elements by class "status" and set new class :
//var elements = document.getElementsById("action_icon");
//for(var i = elements.length - 1; i >= 0; --i) {
//    elements[i].className =  "status-user " + action_style + " s-4"  ; // set new class status ( online/offline....)
//}
