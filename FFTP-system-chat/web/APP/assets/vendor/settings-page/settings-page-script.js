var result; // JSON userData


// === ON START UP ===
$(window).on('load', function() {

  $.post( "../../getDataUser" ).done( function( data ) {
    window.result = JSON.parse( data );

    $('#date_startInCompany').val( result.generalConfig.date_startInCompany  ); //временно


  });

});



// === ON CHANGE getEVENT ===

function eventChanges( element ){
   $( element )
          .closest('form')
              .find(":submit")
                  .prop( 'disabled',  element.val() === result.generalConfig[ element.attr('id') ] );
}

function uploadPicture( newPicture ){
  var file_label = document.getElementsByClassName("custom-file-label"); // label picture


  if ('files' in newPicture[0] ) {
    if ( newPicture[0].files[0].length != 1 ){
      var valide = valid_img( newPicture[0].files[0] );

      $( newPicture )          // > find element
            .closest('form')     // > find form
                .find(":submit")    // > find submit button
                    .prop( 'disabled', !valide );   // enable/disable submit button

      // show messages
      file_label[0].innerHTML = valide ? "Selected: " + newPicture[0].files[0].name : "Unsuported file.";


    }else file_label[0].innerHTML = "Select one file.";
  }else file_label[0].innerHTML = "Unsuported browser";

}



// === EventListener SUBMIT FORM  ===
document.querySelectorAll('form')       // > get array[ all forms in page ]
  .forEach( form => form.addEventListener( 'submit', event => {
            event.preventDefault(); // stop submiting
            // validating ..
            // ajax submiting ..
        }
    )
  );
  
function submit( ){
  console.log("submit form" );
}





// === VALIDATION ELEMENTS FORM ===

// == Exception message ==
const UNKNOWN_ERROR  = "Detect unknown error validate";
const ERROR_EMAIL    = "Email error! Example: name@host.domain";
const ERROR_USERNAME = "Username error! Contains: minimum 7 symbol, Aa-Zz ";
const ERROR_PASSWORD = "Password error! ";
const ERROR_PHONE_NUMBER = "phoneNumber error! Example: +359 000 0000";

// == Requirements ==
  // 1 not null
  // 2 phoneNumber (regex)  +359 000 0000          /^\+?([0-9]{3})\)?[ ]?([0-9]{3})[ ]?([0-9]{4})$/;
  // 3 email       (regex)  name@host.domain       /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
  // 4 username    (regex)  min-7 Aa-zZ            /^[a-zA-Z\]+$/;
  // 5 password    (regex)  min-15 Aa-zZ 0-9 #@%/|
  // 6 newPassword === confirm password

const REGEX_EMAIL    =  "/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/";
const REGEX_USERNAME =  "/^[a-zA-Z\]+$/;";
const REGEX_PASSWORD =  "";
const REGEX_PHONE_NUMBER = "/^\+?([0-9]{3})\)?[ ]?([0-9]{3})[ ]?([0-9]{4})$/;";


function valid_img( file ) {
    var types = file.type.split('/');
    return ( types[0] === "image" && ( types[1] === 'jpg' || types[1]  === 'png' ) ) ;
}

/*
function validation( element ){
  switch( element.attr('id') ) {
    case "phoneNumber": if(! element.val().match( REGEX_PHONE_NUMBER ) ) throw new ValidationException( ERROR_PHONE_NUMBER ); break;
    case "email":       if(! element.val().match( REGEX_EMAIL   ) )      throw new ValidationException( ERROR_EMAIL );        break;
    case "username":    if(! element.val().match( REGEX_USERNAME ) )     throw new ValidationException( ERROR_USERNAME );     break;
    case "password":    if(! element.val().match( REGEX_PASSWORD ) )     throw new ValidationException( ERROR_PASSWORD );     break;
  }
}

class ValidationException extends Error {

    constructor( error_message ) {
    // Pass remaining arguments (including vendor specific ones) to parent constructor
    super(...params);

    // Maintains proper stack trace for where our error was thrown (only available on V8)
    if (Error.captureStackTrace) {
      Error.captureStackTrace(this, CustomError);
    }
  }
}
*/


// === DEV CONTAINER ===

//.log( newPicture[0].files[0].size + "bytes");
//var emailReg = /^([w-.]+@([w-]+.)+[w-]{2,4})?$/;
//var $form = $( element ).closest('form'); // get form
//var submitBtn = $form.find(":submit"); // find from:submit button
// get last element array
//var extension = file.name.substring (file.name.lastIndexOf('.') + 1);
    //form.find("input[name='searchbox']").val(); // get elements
 // enable button if value from input != JSON.valueForThisInput
// $('#profile_picture').attr("src", "../assets/images/avatars/"+ data.generalConfig.profilePicture )
/*$('input[ type="submit" ]').click(function() {
    var form = $(this).closest("form"); // get form submited
    form.preventDefault();

    console.log("Stop submiting by input[type='submit']");

    for (var i = 0; i < form.elements.length; i++) {
      console.log( form.elements[i].value ); // print all elements in form
    }

    // validate form elements[]
    // -> ajax
});*/
//if( $('#input_profilePicture').val() === null )

//$('#input_firstName').val( data.generalConfig.firstName );
//$('#input_lastName').val( data.generalConfig.lastName);
//$('#input_sex').val( data.generalConfig.sex);
//$('#input_bd').val( data.generalConfig.bd );
//$('#input_aboutMe').val( data.generalConfig.aboutMe );

//$('#input_typeWork').val( data.contactConfig.typeWork );
//$('#input_tel').val( data.contactConfig.phoneNumber );
//$('#input_country').val( data.contactConfig.country );
//$('#input_city').val( data.contactConfig.city );
//$('#input_address').val( data.contactConfig.address );
//$('#input_email_newPassword').val(); // null

//$('#input_newUsername').val( data.log.username );
//$('#input_newPassword').val(); // null
//$('#input_newPassword2').val(); // null



/* === EventListener SUBMIT FORM  ===
document.querySelectorAll('form').addEventListener('submit', event => {
      event.preventDefault(); // stop submiting

      // validate the form
      try {

        for (var i = 0; i < form.elements.length; i++) {
          validation( form.elements[i] );
        }

        event.action = "../../Servlet" // set address for send
        event.submit();

      }catch( error ) {
      //  console.log( error instanceof ValidationException ?  error : UNKNOWN_ERROR ;
      }
});*/
