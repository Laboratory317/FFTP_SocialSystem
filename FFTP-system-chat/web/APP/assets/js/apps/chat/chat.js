(function ()
{

    loadContacts();

    function changeView(wrapper, view)
    {
        var wrapper = $(wrapper);
        wrapper.find('.view').removeClass('d-none d-flex');
        wrapper.find('.view').not(view).addClass('d-none');
        wrapper.find(view).addClass('d-flex');
    }

    // временно е по този начин
    function loadContacts() {

      $.getJSON( "../../getAllUserInCompany", ( result ) =>  {

          $( result.users ).each(  function() {
            if( result.user.id === this.user.id ) this.user.firstName = "You" ;
            addUserInContactList( this );
          });

        }
      ).fail( () => showNotify("Error get contact, no connection!") );

    }

    // === SHOW HTML DIV USER ( json contact )
    function addUserInContactList( data ){


      var _div_date = ( data.date === null || data.date === undefined ) ? '' :
      '<div class="col-12 col-sm-auto d-flex flex-column align-items-end">  \
          <div class="last-message-time">'+data.date+'</div>                \
      </div>';

      var _last_message = ( data.lastMessage === null || data.lastMessage === undefined ) ? '' : '<p class="last-message text-truncate text-muted">'+ data.lastMessage +'</p>';

      var _contact =
      '<div class="contact ripple flex-wrap flex-sm-nowrap row p-4 no-gutters align-items-center" id="'+data.user.id+'" >        \
                                                                                                                                 \
          <div class="col-auto avatar-wrapper">                                                                                  \
              <img src="../assets/images/avatars/'+data.user.profilePicture+'" class="avatar" alt="'+data.user.firstName+'" />   \
              <i class="status '+ switchActive( data.user.action ) +' s-4" name="status-contact" ></i>                           \
          </div>                                                                                                                 \
                                                                                                                                 \
          <div class="col px-4">                                                                                                 \
              <span class="name h6">'+data.user.firstName+'</span>                                                               \
              '+_last_message+'                                                                                                  \
          </div>                                                                                                                 \
                                                                                                                                 \
            '+_div_date+'                                                                                                        \
                                                                                                                                 \
      </div>                                                                                                                     \
      <div class="divider"></div>';

      $('.chat-list').append( _contact ); // user - add in contact

    }

    $('.chat-list .contact').on('click', function () {
        // get id contact
        // setup '#chat-view' for this user
        changeView('#chat-content-views', '#chat-view'); // conteiner chat <- user chat timeline
        console.log( "open");
    });


})();

// SEARCH FUNCTION -> from input search
function search( input ){
  // select chat list -> contacts -> each( user name ? search input )
  $('.chat-list .contact').each( function() {
    //var filter = this.innerText; // < - You, Me , I ( for log user )
    //var _val = input[0].value.toUpperCase();

    if ( this.innerText.indexOf( input[0].value.toUpperCase() ) > -1)
       this.style.display = "";
    else this.style.display = "none";

  });

}



/*
$('#contacts-button').on('click', function ()
{
    changeView('#chat-left-sidebar-views', '#contacts-view');
});

$('.back-to-chats-button').on('click', function ()
{
    changeView('#chat-left-sidebar-views', '#chats-view');
});

$('#user-avatar-button').on('click', function ()
{
    changeView('#chat-left-sidebar-views', '#user-view');
});*/
