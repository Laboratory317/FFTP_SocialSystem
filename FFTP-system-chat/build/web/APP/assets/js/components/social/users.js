/*
JS ajax connect to servlet getUseR()
                            |  RETURN JSON data   =DataAccess.getPostTimeLine( obj_user.getId() ) ;
JS get result data and show in div
*/



function getAllUsersInCompany( callback ){


  $.getJSON( "../../getAllUserInCompany", ( json ) =>  {
        var _dataForSet = [];

        $( json.users ).each(  function() {
                _dataForSet.push(
                    [ '<img class="avatar" src="../assets/images/avatars/' + this.user.profilePicture + '">' ,
                      this.user.firstName ,
                      this.user.lastName  ,
                      this.user.typeWork  ,
                      this.user.email     ,
                      this.user.phoneNumber
                    ]
                );
         }
      );

      callback( _dataForSet );
    }
  );


}


$(window).on('load', () =>  {

    getAllUsersInCompany( ( dataForSet ) => {

      $('#users_in_company').DataTable( {
        "scrollX": true,
        "processing": true,
        data: dataForSet,
        columns: [
            { title: ""          },
            { title: "FirstName" },
            { title: "LastName"  },
            { title: "Position"  },
            { title: "E-Mail"    },
            { title: "Phone"     },
        ]
      } );

      $('#users_in_company_num').text( dataForSet.length + " members" );
    });

} );






/* click on colom row
$('#users_in_company tbody').on('click', 'tr', function () {
        var data = table.row( this ).data();
        alert( 'You clicked on '+data[0]+'\'s row' );
    } );

*/
