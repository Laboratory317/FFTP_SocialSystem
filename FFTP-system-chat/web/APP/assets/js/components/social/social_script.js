// BUTTON NEW POST CLICKED
function addPost( ){

  var content = document.getElementById("textArea").value;

  if( content != "" ){

   $.getJSON( "../../addPost" ,
    {
      content: content
    },
    ( result, status ) => {
        if( result.status ){

          document.getElementById("textArea").value = ''; // set empty
          showNotify("You posted success.");
          addDivPost( result, result.user );  // show html<div>

        }else showNotify("Error posting.");
    }
   ).fail( () => showNotify("Error posting, no connection!") );

  }
}

// BUTTON ON POST clicked -> get id_post
function addComment( id_post, oForm ){

  var content = oForm.elements[0].value;
  if( content != "" ){

   $.getJSON( "../../addComment" ,
    {
      id_post: id_post,
      content: content
    },
    ( result, status ) => {
      if( result.status ){

        oForm.elements[0].value = ''; // null
        showNotify("You comment success.");
        addDivComment( result );  // show html<div>

      }else showNotify("Error commenting.");
     }
   ).fail( () => showNotify("Error commenting, no connection!") );

  }
}


// GET POST on load page
window.onload = loadPageTimeLine();

function loadPageTimeLine() {

    var type_page = "allTimeLine"; // get from page < $('time line ...').name attribure

    $.getJSON( "../../getPC" , { query : type_page }, ( result, status ) => {
        if( result.status ){

          // [ array  { post }, { post }, {post } .. ]
          $( result.receive.reverse() ).each( function() {
            addDivPost( this , result.user );
          });

        }else showNotify("Error get timeLine.");
      }
    ).fail( () => showNotify("Error get timeLine, no connection!") );

}


// GET COMMENTS FOR POST
function check_newCommentars(){

  var type_connection = "check_newCommentars";
  var arrAsk = [] ; // for put query ask( ask new coments? )


  // =======================================================
  // timeLine -> timeLine items[]
  // each items[] > id_post > comment_last > id

  $( $("#time-line-insert ").find(".timeline-item")  ).each( function() {

      var _coments = $(this).find("footer .comment") ;  // > get comment []
      var _com = _coments[ _coments.length - 1 ];         // > get last comentar

      if( _com === undefined || _com === null ) _com = { "id" : 0 } ; // undefined if empty box[ comentars ] -> is 0 (all)

      arrAsk.push(
        {
          "lastCom_id" : _com.id ,
          "post_id"    : this.id
        }
      );

    }
  );


  // ==========================================================
  // -> connect to server
  // -> check for available new comments ( jsonAsk )
  // <- get result[] -> each result -> this.newComentars ->
  // show < div .. > addDivComment( result for this posts )
  var type_ask = "check_newCommentars";

  $.getJSON( "../../getPC" ,
    {
      query : type_ask,
      ask   : arrAsk
    },
     ( result, status ) => {
      console.log( result );

      if( result.status ){

        $( result.receive.reverse() ).each( function() {
          addDivComment( result );
        });

      }//else showNotify("Error get update.");

    }
  ).fail( () => showNotify("Error update, no connection!") );


}



setInterval( check_newCommentars , 1500 ); // only 1,5 sec check for new ?



// BUTTON SEE MORE -> load more post
function seeMore(){
  // get JSON data posts/comments id_lastPost
}


var jsonExample = {
  "status" : true,
  "user": {
    "id"             : "5",
    "profilePicture" : "223662617914085463758693509.jpg",
    "firstName"      : "Pe6o",
    "lastName"       : "Ivanov"
  },
  "receive": [
    {
      "id_post"  : "12",

      "poster" : {
        "id"             : "2",
        "profilePicture" : "223662617914085463758693509.jpg",
        "firstName"      : "Georgi",
        "lastName"       : "Chakarov"
      },
      "date"     : "sega",
      "content"  : "this is content",

      "com": [
        {
          "poster": {
            "id"             : "5",
            "profilePicture" : "223662617914085463758693509.jpg",
            "firstName"      : "Georgi",
            "lastName"       : "Chakarov"
          },
          "id"         : "4",
          "date"       : "20-16-2018",
          "content"    : "Bla bla georgi"
        },
        {
          "poster": {
            "id"             : "5",
            "profilePicture" : "223662617914085463758693509.jpg",
            "firstName"      : "Bor",
            "lastName"       : "Chakarov"
          },
          "id"           : "3",
          "date"         : "16-17-2018",
          "content"      : "Bla bla ivan"
        } // .. next coments ..
      ]
    } //.. next post ..
  ]

};


// === NOTIFY ===
function showNotify( text ){
  // get text for notify
  // set in coockie ( text, time )
  // if time > set -> show notify else return;
  //$.cookie( text , Date.now() );
  //document.cookie(text);

  new PNotify({
      text    : text,
      confirm : {
          confirm: true,
          buttons: [
              {
                  text    : 'Dismiss',
                  addClass: 'btn btn-link',
                  click   : function (notice) {
                      notice.remove();
                  }
              },
              null
          ]
      },
      buttons : {
          closer : false,
          sticker: false
      },
      animate : {
          animate  : true,
          in_class : 'slideInDown',
          out_class: 'slideOutUp'
      },
      addclass: 'md'
  });
}


// === DIV HTML SHOW ===
function addDivPost( data, user ){

  // WRITE COMENTAR
  var _html_div_icom =
  '<footer class="bg-light p-4">'+
      '<div class="reply row no-gutters">'+

          '<img src="../assets/images/avatars/'+user.profilePicture+'" class="col-auto avatar mr-2" />'+

          '<form name="" class="col">'+

              '<textarea  class="p-2 mb-2 w-100" placeholder="Add a comment..."></textarea>'+
              '<button type="button" onclick="addComment( '+data.id_post+', this.form )" class="post-comment-button btn btn-sm btn-secondary" aria-label="Post Comment">'+
              'Post Comment'+
              '</button>'+

          '</form>'+

      '</div>'+
  '</footer>' ;

  // CONTENT POST
  var _html_div_post =
  '<div class="timeline-item card mb-6" id="'+data.id_post+'">' +

    '<header class="row no-gutters align-items-center justify-content-between p-4">'+
        '<div class="user col">'+
            '<div class="row no-gutters align-items-center justify-content-start">' +

                '<img class="avatar col-auto mr-2" src="../assets/images/avatars/'+data.poster.profilePicture+'">' +

                '<div class="col">' +
                    '<div class="title font-weight-bold">' +
                        '<span class="username">'+data.poster.firstName+' '+data.poster.lastName+' </span>'+
                        '<span> posted</span>'+
                    '</div>'+
                    '<div class="time text-muted">'+ data.date+'</div>'+
                '</div>'+

            '</div>'+
        '</div>'+

        '<button type="button" class="col-auto btn btn-icon" aria-label="more">'+
            '<i class="icon icon-dots-vertical"></i>'+
        '</button>'+
    '</header>'+

    '<div class="content">'+
        '<div class="message py-2 px-4"> '+data.content+' </div>'+

        '<!-- REACTION / SHARE -->'+
        '<div class="row no-gutters align-items-center py-2 px-4">'+
            '<button type="button" class="like-button btn btn-link">'+
                '<i class="icon-heart-outline s-4"></i>'+
                '<span>Like</span>'+
            '</button>'+
        '</div>'+
    '</div>'+

    _html_div_icom +

  '</div>';

  //console.log( $("#time-line-insert") ); // трябда да го оправя да лови само едната форма
  $("#time-line-insert ").prepend( _html_div_post ); // add on timeLine ^ front
  if( addDivCommentNumber( data ) )  addDivComment( data ); // add num comments and if available comments -> show

}

function addDivCommentNumber( data ){
  $('.divider')     //  SELECT class .divider
      .find( '#'+data.id_post )    // > SELECT post with ID# data.id_post
          .find("footer")                   // > SELECT FOOTER
              .prepend( '<div class="comment-count mb-4">'+data.com.length+' comments </div>' );   // > INSERET UP <div num posts>
  return data.com.length > 0;
}

function addDivComment( data ){
  var _html_div_com = '';

  // ADD IN CONTENTE COMENTAR
  $( data.com ).each( function() {

    _html_div_com += '<div class="comment row no-gutters mb-6" id="'+this.id_com+'">' +
                        '<img src="../assets/images/avatars/'+this.poster.profilePicture+'" class="col-auto avatar mr-2" />' +
                        '<div class="col">' +

                            '<div class="row no-gutters align-items-center">' +
                                  '<span class="username font-weight-bold mr-1">'+this.poster.firstName+' '+this.poster.lastName+' </span>' +
                                  '<span class="time text-muted">'+this.date+'</span>' +
                            '</div>'+

                            '<div class="message">'+this.content+' </div>'+
                        '</div>'+
                    '</div>';
  });

  $('#time-line-insert')     //  SELECT class .divider
      .find( '#'+data.id_post )    // > SELECT post with ID# data.id_post
          .find("footer .reply ")   // > SELECT FOOTER > .comment-count
              .before(  _html_div_com );         // > INSERET DOWN


}
