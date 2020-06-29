
package dao;
import db.DBUtils;

import static funct.code.generateRandNumber;
import static funct.code.send_sms;
import static funct.hash.get_SHA512_SecurePassword;

import java.io.IOException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.colector;
import model.user;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;



public class DataAccess {

    // add User -> success added return true
    public static boolean addUser(user n){
        boolean status = false;
        PreparedStatement ps;
        colector cl ;
        try {
            cl = DBUtils.getPreparedStatement("INSERT INTO users(firstName, lastName, username, password, phoneNumber, address, city, country, bd, sex, data_startInCompany, typeWork, profilePicture )VALUE ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now(), ?, ? )");
            ps = cl.getPreparedStatement();

            ps.setString(1, n.getFirstName());
            ps.setString(2, n.getLastName());
            ps.setString(3, n.getUsername());
            ps.setString(4, n.getPassword());
            ps.setString(5, n.getPhoneNumber());
            ps.setString(6, n.getAddress());
            ps.setString(7, n.getCity());
            ps.setString(8, n.getCountry());
            ps.setString(9, n.getBd());
            ps.setBoolean(10, n.getSex());
        //    ps.setString(11, n.getDate_startInCompany()); // now();
            ps.setString(11, n.getTypeWork());
            ps.setString(12, "profile.jpg"); // default profilePicture

            status =  ps.executeUpdate() > 0;

            ps.close();
            cl.getConnection().close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return status;
    }

    // get all Users
    public static JSONArray getAll() throws JSONException{
        JSONArray arrayUsers = new JSONArray();
        PreparedStatement ps;
        colector cl ;
        try {
            cl = DBUtils.getPreparedStatement("SELECT users.*, action.action FROM users JOIN action ON users.id_action = action.id");
            ps = cl.getPreparedStatement();
            ResultSet rs = ps.executeQuery();

            while( rs.next() ){

                arrayUsers.put( new JSONObject().put("user", new JSONObject()
                            .put( "id",            rs.getInt(1)      )      // id
                            .put( "firstName",     rs.getString(2)   )  // firstname
                            .put( "lastName",      rs.getString(3)   )  // lastname
                                //  rs.getString(4),       // username
                                //  rs.getString(5),       // password
                            .put( "phoneNumber",   rs.getString(6)   )  // phoneNumber
                                // rs.getString(7)   )     // address
                                // rs.getString(8)   )     // city
                                // rs.getString(9)   )     // country
                            .put( "email",         rs.getString(10)  )  // email
                                // rs.getString(11),       // email_password
                                // rs.getString(12)  )     // bd burday
                                // rs.getBoolean(13) )     // sex
                                // rs.getString(14)  )     // data_startInCompany
                            .put( "typeWork",       rs.getString(15)  )  // typeWork
                                // rs.getInt(16),          // id id_action INT
                                // rs.getString(17)  )     // about
                            .put( "profilePicture", rs.getString(18)  )  // profilePicture
                            .put( "action",         rs.getString(19)  )  // action String
                        ) 
                );
            }

            ps.close();
            cl.getConnection().close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }

        return arrayUsers ;
    }

    // get user secure data
    public static user getUserById( int id_user ) {
      user _user = null;
      List<user> ls = new LinkedList<>();
      PreparedStatement ps;
      colector cl ;
      try {
          cl = DBUtils.getPreparedStatement("SELECT users.*, action.action FROM users JOIN action ON users.id_action = action.id WHERE users.id LIKE ?");
          ps = cl.getPreparedStatement();
          ps.setInt(1, id_user);

          ResultSet rs = ps.executeQuery();
          while(rs.next()){
              _user = new user(
                      rs.getInt(1),   // id
                      rs.getString(2),  // firstname
                      rs.getString(3),  // lastname
                    //  rs.getString(4),  // username
                    //  rs.getString(5),  // password
                      rs.getString(6),  // phoneNumber
                      rs.getString(7),  // address
                      rs.getString(8),  // city
                      rs.getString(9),  // country
                      rs.getString(10), // email
                  //    rs.getString(11), // email_password
                      rs.getString(12), // bd burday
                      rs.getBoolean(13), // sex
                      rs.getString(14), // data_startInCompany
                      rs.getString(15), // typeWork
                      // rs.getInt(16), // id id_action INT
                      rs.getString(17), // about
                      rs.getString(18), // profilePicture
                      rs.getString(19)  // action String
              );
              ls.add( _user );
          }
          ps.close();
          cl.getConnection().close();

      } catch (ClassNotFoundException | SQLException ex) {
          Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
      }
      return _user;
    }

    public static List<user> getUserByName(String firstName, String lastName ){
      List<user> lu = new LinkedList<>();
      PreparedStatement ps;
      String query = null;
      colector cl ;

      if(firstName != null && lastName != null)
        query="SELECT users.*, action.action FROM users JOIN action ON users.id_action = action.id WHERE users.firstName LIKE ? AND users.lastName LIKE ?";
      else
        query="SELECT users.*, action.action FROM users JOIN action ON users.id_action = action.id WHERE users.firstName LIKE ? OR users.lastName LIKE ?";

      try {
          cl = DBUtils.getPreparedStatement(query);
          ps = cl.getPreparedStatement();
          ps.setString(1, firstName);
          ps.setString(2, lastName );

          ResultSet rs = ps.executeQuery();

          while( rs.next() ){ // getSecure
              user coincidesUser = new user(
                        rs.getInt(1),      // id
                        rs.getString(2),   // firstname
                        rs.getString(3),   // lastname
                    //  rs.getString(4),   // username
                    //  rs.getString(5),   // password
                        rs.getString(6),   // phoneNumber
                        rs.getString(7),   // address
                        rs.getString(8),   // city
                        rs.getString(9),   // country
                        rs.getString(10),  // email
                    //  rs.getString(11),  // email_password
                        rs.getString(12),  // bd burday
                        rs.getBoolean(13), // sex
                        rs.getString(14),  // data_startInCompany
                        rs.getString(15),  // typeWork
                     // rs.getInt(16),     // id id_action INT
                        rs.getString(17),  // about
                        rs.getString(18),  // profilePicture
                        rs.getString(19)   // action String
              );
              lu.add( coincidesUser );
          }
          ps.close();
          cl.getConnection().close();

      } catch (ClassNotFoundException | SQLException ex) {
          Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
      }
      return lu;
    }


    // get number users in company - за момента по default е users-FFTP(main)
    public static int getSize(){
      PreparedStatement ps;
      int numberUsers = 0;
      colector cl ;
      try {
          cl = DBUtils.getPreparedStatement("SELECT COUNT(users.id) FROM users");
          ps = cl.getPreparedStatement();
          ResultSet rs = ps.executeQuery();
          while(rs.next()){
              numberUsers  = rs.getInt(1); // count(id) users -> number
          }
          ps.close();
          cl.getConnection().close();
      } catch (ClassNotFoundException | SQLException ex) {
          Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
      }
      return numberUsers;
    }

    // login -> return full object user
    public static user login(String username, String password){
        PreparedStatement ps;
        colector cl ;
        user obj_user = null;
        try {
            cl = DBUtils.getPreparedStatement( "SELECT users.*, action.action FROM users JOIN action ON users.id_action = action.id WHERE username like ? and password like ?");
            ps = cl.getPreparedStatement();
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                obj_user = new user(
                      rs.getInt(1),   // id
                      rs.getString(2),  // firstname
                      rs.getString(3),  // lastname
                      rs.getString(4),  // username
                      rs.getString(5),  // password
                      rs.getString(6),  // phoneNumber
                      rs.getString(7),  // address
                      rs.getString(8),  // city
                      rs.getString(9),  // country
                      rs.getString(10), // email
                      rs.getString(11), // email_password
                      rs.getString(12), // bd burday
                      rs.getBoolean(13), // sex
                      rs.getString(14), // data_startInCompany
                      rs.getString(15), // typeWork
                      // rs.getInt(16), // id id_action INT
                      rs.getString(17), // about
                      rs.getString(18), // profilePicture
                      rs.getString(19)  // action String
                );

            }
            ps.close();
            cl.getConnection().close();

        }catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }

        return obj_user;
    }



    // === GET POST METHOD ===
    public static JSONArray getPostFromGroup( int id_group ) throws SQLException, ClassNotFoundException, JSONException {
      PreparedStatement ps ;
      colector cl ;

      cl = DBUtils.getPreparedStatement( "SELECT * FROM posts WHERE group_id LIKE ? ORDER BY id DESC LIMIT ?" );
      ps = cl.getPreparedStatement();
      ps.setInt(1, id_group);
      ps.setInt(2, 20);

      cl.setPreparedStatement( ps );
      return getPost( cl );
    }

    public static JSONArray getPostFromUser( int id_user ) throws ClassNotFoundException, SQLException, JSONException {
      PreparedStatement ps;
      colector cl ;

      cl = DBUtils.getPreparedStatement( "SELECT id, data_post, content, id_poster FROM posts WHERE group_id IS NULL AND id_poster LIKE ? ORDER BY id DESC LIMIT ?" );
      ps = cl.getPreparedStatement();
      ps.setInt(1, id_user);
      ps.setInt(2, 20); // limit 20 post

      cl.setPreparedStatement( ps );
      return getPost( cl );
    }

    public static JSONArray getPostTimeLine( int id_user ) throws ClassNotFoundException, SQLException, JSONException {   // get post -> all timeline for user + group (user in)
      PreparedStatement ps;
      colector cl ;

      cl = DBUtils.getPreparedStatement( "SELECT * FROM posts ORDER BY id DESC LIMIT ?" );
      ps = cl.getPreparedStatement();
      ps.setInt(1, 20); // limit 20 post

      cl.setPreparedStatement( ps );
      return getPost( cl );
    }

    // main get post
    public static JSONArray getPost( colector cl  ) throws JSONException {
        PreparedStatement ps;
        JSONArray _posts = new JSONArray();

        try {
            ps = cl.getPreparedStatement();
            ResultSet rs = ps.executeQuery();

            while( rs.next() ){
                // id_post
                // poster { user }
                // date
                // content
                // com [ {} ]

                _posts.put( new JSONObject()
                                .put( "id_post" , rs.getInt(1)    )
                                .put( "date"    , rs.getString(2) )
                                .put( "content" , rs.getString(3) )
                                .put( "poster"  , getUserById( rs.getInt(4) ).toJSON()   )
                                .put( "com"     , getComments( rs.getInt(1) ).get("com") ) // array

                );
            }

            ps.close();
            cl.getConnection().close();

        } catch (SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }

      return _posts;
    }

    // add new post in system with( data )
    public static JSONObject newPost( JSONObject _post , user _user) throws JSONException{
      boolean status = false;
      PreparedStatement ps;
      colector cl ;
      String date = "";
      int id_post = 0;

      try {

          if( _post.isNull("id_group") ) {  // if available group and USER IN GROUP - sql трябва да се добави
            cl = DBUtils.getPreparedStatement ("INSERT INTO posts( data_post, content, id_poster) VALUE ( now(), ?, ? )");
            ps = cl.getPreparedStatement();

            ps.setString(1, _post.getString("content") );
            ps.setInt(2,    _user.getId()              );

          }else{
            cl = DBUtils.getPreparedStatement ("INSERT INTO posts( data_post, content, id_poster, group_id ) VALUE ( now(), ?, ?, ? )");
            ps = cl.getPreparedStatement();

            ps.setString(1, _post.getString("content") );
            ps.setInt(2,    _user.getId()              );
            ps.setInt(3,    _post.getInt("id_group")   );

          }

          status =  ps.executeUpdate() > 0;
          ResultSet rs  =  ps.getGeneratedKeys()    ; // return value id
          // receive id_post and date
          if( rs.next() ) {

              id_post = rs.getInt(1) ;

              colector _cl = DBUtils.getPreparedStatement ("SELECT data_post FROM posts WHERE id = ? ");
              PreparedStatement _ps = _cl.getPreparedStatement();
              _ps.setInt( 1,    id_post   );
              ResultSet _rs  = _ps.executeQuery();

              while( _rs.next() ){
                 date = _rs.getString( 1 );
              }

              _ps.close();
              _cl.getConnection().close();
          }


          ps.close();
          cl.getConnection().close();


      } catch (ClassNotFoundException | SQLException ex) {
          Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
      }

      return new JSONObject()
                .put( "status"  , status  )
                .put( "date"    , date    )
                .put( "id_post" , id_post )
      ;

    }



    // get comments for post with id ( id_post ) -> return list
    public static JSONObject getComments( int id_post ) throws JSONException{
      PreparedStatement ps;
      colector cl ;
      JSONArray _com = new JSONArray();

      try {
          cl = DBUtils.getPreparedStatement("SELECT id, data_post, content, id_poster FROM comments WHERE id_post like ?");
          ps = cl.getPreparedStatement();
          ps.setInt(1, id_post);

          ResultSet rs = ps.executeQuery();
          while( rs.next() ){

              _com.put( new JSONObject()
                          .put( "poster"  , getUserById( rs.getInt(4) ).toJSON() )
                          .put( "id_com"  , rs.getString(1)  )
                          .put( "date"    , rs.getString(2)  )
                          .put( "content" , rs.getString(3)  )

              );
          }

          ps.close();
          cl.getConnection().close();

      } catch ( ClassNotFoundException | SQLException ex ) {
          Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
      }

      return new JSONObject()
                .put("id_post" , id_post )
                .put("com"     , _com    ) // array
      ;
    }

    public static JSONArray getAvailableNewComment( JSONArray arrAsk ){
        JSONArray result = new JSONArray(); // empty

        for ( int i=0; i < arrAsk.length(); i++ ) {
            try {
                JSONObject _ask  = arrAsk.getJSONObject(i);

                PreparedStatement ps;
                colector cl ;
                JSONArray _coms = new JSONArray();

                // set ask for new comments
                cl = DBUtils.getPreparedStatement("SELECT id, data_post, content, id_poster FROM comments WHERE id_post LIKE ? AND comments.id > ? "); // + last id ?
                ps = cl.getPreparedStatement();
                ps.setInt(1, _ask.getInt("post_id")    );
                ps.setInt(2, _ask.getInt("lastCom_id") );

                ResultSet rs = ps.executeQuery();

                while( rs.next() ) // put available new coments
                    _coms.put( new JSONObject()
                                .put( "poster"  , getUserById( rs.getInt(4) ).toJSON() )
                                .put( "id_com"  , rs.getString(1)  )
                                .put( "date"    , rs.getString(2)  )
                                .put( "content" , rs.getString(3)  )
                    );


                ps.close();
                cl.getConnection().close();

                result.put( new JSONObject()
                              .put("id_post" , _ask.getInt("post_id") )
                              .put("com"     , _coms                  ) // null array if not available new comments
                );

            } catch (JSONException | ClassNotFoundException | SQLException ex) {
                Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return result;
    }

    // add comment( data )
    public static JSONObject addComment( JSONObject _com, user _user ) throws JSONException{
      boolean status = false;
      String date = "";
      int id_com = 0;
      PreparedStatement ps;
      colector cl ;

      try {
          cl = DBUtils.getPreparedStatement ("INSERT INTO comments( data_post, content, id_post, id_poster ) VALUE ( now(), ?, ?, ? ) ");
          ps = cl.getPreparedStatement();

          ps.setString( 1, _com.getString("content")  );
          ps.setInt( 2,    _com.getInt("id_post")     );
          ps.setInt( 3,    _user.getId()              );

          status        =  ps.executeUpdate() > 0 ;
          ResultSet rs  =  ps.getGeneratedKeys()    ; // return value id



          if( rs.next() ) {
            id_com = rs.getInt(1);

            colector _cl = DBUtils.getPreparedStatement ("SELECT data_post FROM comments WHERE id = ? ");

            PreparedStatement _ps = _cl.getPreparedStatement();
            _ps.setInt( 1, id_com  );
            ResultSet _rs  = _ps.executeQuery();

            while( _rs.next() ){
               date = _rs.getString( 1 );
            }

            _ps.close();
            _cl.getConnection().close();
          }



          ps.close();
          cl.getConnection().close();

      } catch (ClassNotFoundException | SQLException ex) {
          Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
      }

      return new JSONObject()
                .put("status", status )
                .put("date"  , date   )
                .put("id_com", id_com )
      ;

    }



    // == ADD ==
    public static void addPointLog( JSONObject point ){
      PreparedStatement ps;
      colector cl ;
      try {
          cl = DBUtils.getPreparedStatement("INSERT INTO point_map(coordinate, coot, ip, id_user )VALUE ( ?, now(), ?, ?)");
          ps = cl.getPreparedStatement();

          ps.setString(1, point.getString("coordinate") ); // put JSON lat + lon
          ps.setString(2, point.getString("ip")         );
          ps.setInt(3, point.getInt("id")               );

          ps.executeUpdate();
          ps.close();
          cl.getConnection().close();

      } catch (ClassNotFoundException | SQLException | JSONException ex) {
          Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
      }
    }


    // === UPDATE ===
    public static boolean updateUserAuthenById( int id, user newUserData ) {
        // update user.id like id with data newUsername and newPassword
        PreparedStatement ps;
        boolean stat = false;
        colector cl ;
        try {
            cl = DBUtils.getPreparedStatement("UPDATE users SET username = ?, password = ? WHERE id = ? ");
            ps = cl.getPreparedStatement();

            ps.setString(1, newUserData.getUsername() );
            ps.setString(2, newUserData.getPassword() );
            ps.setInt(3, id);

            stat = ps.executeUpdate() > 0;
            ps.close();
            cl.getConnection().close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger( DataAccess.class.getName() ).log( Level.SEVERE, null, ex );
        }

        return stat;
    }

    public static boolean updateUserEmailConfigById( int id, user newUserData ){
      // update user.id like id with data email_name_host  and  email_password
      PreparedStatement ps;
      boolean stat = false;
      colector cl ;
      try {
          cl = DBUtils.getPreparedStatement("UPDATE users SET email = ?, email_password = ?  WHERE id = ? ");
          ps = cl.getPreparedStatement();

          ps.setString(1, newUserData.getEmail()         );
          ps.setString(2, newUserData.getEmailPassword() );
          ps.setInt(3, id);

          stat = ps.executeUpdate() > 0;
          ps.close();
          cl.getConnection().close();

      } catch (ClassNotFoundException | SQLException ex) {
          Logger.getLogger( DataAccess.class.getName() ).log( Level.SEVERE, null, ex );
      }

      return stat;
    }

    public static boolean updateUserGeneralCongigById( int id, user newUserData ){
      // update user.id like id with data :
      // profilePicture, Fname, Lname, about
      PreparedStatement ps;
      boolean stat = false;
      colector cl ;
      try { // тук ще се преправи дирекно в заявката с IF() ...
          if( newUserData.getTypeWork().equals("programer" ) ) {
            cl = DBUtils.getPreparedStatement("UPDATE users SET profilePicture = ?, about = ? WHERE id = ? ");
            ps = cl.getPreparedStatement();

            ps.setString(  1, newUserData.getProfilePicture() );
            ps.setString(  2, newUserData.getAbout()          );
            ps.setInt(     3, id                              );

          }else{

            cl = DBUtils.getPreparedStatement("UPDATE users SET firstName = ?, lastName = ?, profilePicture = ?, about = ? WHERE id = ? ");
            ps = cl.getPreparedStatement();

            ps.setString(  1, newUserData.getFirstName()      );
            ps.setString(  2, newUserData.getLastName()       );
            ps.setString(  3, newUserData.getProfilePicture() );
            ps.setString(  4, newUserData.getAbout()          );
            ps.setInt(     5, id                              );
          }



          stat = ps.executeUpdate() > 0;
          ps.close();
          cl.getConnection().close();

      } catch (ClassNotFoundException | SQLException ex) {
          Logger.getLogger( DataAccess.class.getName() ).log( Level.SEVERE, null, ex );
      }

      return stat;
    }

    public static boolean updateUserContactConfigById( int id, user newUserData ){
      // update user.id like id with data :
      // typeWork, telephone, address, country, city, address
      PreparedStatement ps;
      boolean stat = false;
      colector cl ;

      try {
          cl = DBUtils.getPreparedStatement("UPDATE users SET phoneNumber = ?, address = ?, city = ?, country = ?, typeWork = ?,  WHERE id = ? ");
          ps = cl.getPreparedStatement();

          ps.setString( 1, newUserData.getPhoneNumber() );
          ps.setString( 2, newUserData.getAddress()     );
          ps.setString( 3, newUserData.getCity()        );
          ps.setString( 4, newUserData.getCountry()     );
          ps.setString( 5, newUserData.getTypeWork()    );
          ps.setInt( 6, id );

          stat = ps.executeUpdate() > 0;
          ps.close();
          cl.getConnection().close();

      } catch (ClassNotFoundException | SQLException ex) {
          Logger.getLogger( DataAccess.class.getName() ).log( Level.SEVERE, null, ex );
      }

      return stat;
    }

    public static boolean updatePassword( int id, String hash_NewPassword ){
      PreparedStatement ps;
      boolean stat = false;
      colector cl ;

      try {
          cl = DBUtils.getPreparedStatement("UPDATE users SET password = ? WHERE id = ? ");
          ps = cl.getPreparedStatement();

          ps.setString(1, hash_NewPassword);
          ps.setInt(2, id);
          stat = ps.executeUpdate() > 0;
          ps.close();
          cl.getConnection().close();

      } catch (ClassNotFoundException | SQLException ex) {
          Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
      }
      return stat;
    }

    public static boolean updateUserActionById( int id, user newUserData ){
      PreparedStatement ps;
      boolean stat = false;
      colector cl ;

      try {
          cl = DBUtils.getPreparedStatement("UPDATE users SET id_action = (SELECT id FROM action WHERE action LIKE ?) WHERE id = ?");
          ps = cl.getPreparedStatement();

          ps.setString(1, newUserData.getAction() );
          ps.setInt(2, id);

          stat = ps.executeUpdate() > 0;
          ps.close();
          cl.getConnection().close();

      } catch (ClassNotFoundException | SQLException ex) {
          Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
      }
      return stat;
    }


    public static byte resetPassword( String username ) throws IOException, JSONException{
      PreparedStatement ps;
      colector cl ;
      int id_user = 0 ;
      String firstName = null, phoneNumber = null , email = null;

      try {
          cl = DBUtils.getPreparedStatement("SELECT id, firstName, phoneNumber, email FROM users WHERE username like ?");
          ps = cl.getPreparedStatement();
          ps.setString(1, username);
          ResultSet rs = ps.executeQuery();

          while(rs.next()){
              id_user     = rs.getInt(1)    ;
              firstName   = rs.getString(2) ;
              phoneNumber = rs.getString(3) ;
              email       = rs.getString(4) ;
          }
          ps.close();
          cl.getConnection().close();

      } catch (ClassNotFoundException | SQLException ex) {
          Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
      }

      if( firstName != null && phoneNumber != null && email != null){

        String code = Integer.toString( generateRandNumber() );
        String hash_NewPassword = get_SHA512_SecurePassword( code );

        if( send_sms( "192.168.122.1", 5379, phoneNumber, firstName + ", your reset code is: "+ code ) ){
          updatePassword(id_user, hash_NewPassword ) ;
          return 1; // success
        }
        return 0; // error server
      }
      return 2; // error user not found
    }

    // add server
    // remove server

    // add - executors ( all )
    // change status executors ( ip, port, comport, status, sizeQueue, timeExecute )
    // get - executors ( all )
    // remove executors ( num )

    // update about me
    // set raiting
    // add category - raiting ( sleeping, working, traveling)



}
