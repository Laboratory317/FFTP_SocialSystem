

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"      %>

<c:set var="obj_user" scope="session" value="${ sessionScope.user }"/>
<c:choose>
  <c:when test="${ obj_user == null }">
    <c:redirect url = "login.jsp" />
  </c:when>
  <c:otherwise>
    <!-- LOAD PAGE -->

    <c:set var="id_user"        scope="session" value="${obj_user.getId()}"                                   />
    <c:set var="firstName"      scope="session" value="${obj_user.getFirstName()}"                            />
    <c:set var="lastName"       scope="session" value="${obj_user.getLastName()}"                             />
    <c:set var="username"       scope="session" value="${obj_user.getUsername()}"                             />
    <c:set var="profilePicture" scope="session" value="${obj_user.getProfilePicture()}"                       />

<!DOCTYPE html>
<html lang="en-us">

<head>
    <title>FFTP | Dashboard</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="shortcut icon" type="image/x-icon" href="../assets/favicon.ico" />

    <link href="https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700italic,700,900,900italic" rel="stylesheet">

    <!-- STYLESHEETS -->
    <style type="text/css">
            [fuse-cloak],
            .fuse-cloak {
                display: none !important;
            }
    </style>
    <!-- Icons.css -->
    <link type="text/css" rel="stylesheet" href="../assets/icons/fuse-icon-font/style.css">
    <!-- Animate.css -->
    <link type="text/css" rel="stylesheet" href="../assets/vendor/animate.css/animate.min.css">
    <!-- PNotify -->
    <link type="text/css" rel="stylesheet" href="../assets/vendor/pnotify/pnotify.custom.min.css">
    <!-- Nvd3 - D3 Charts -->
    <link type="text/css" rel="stylesheet" href="../assets/vendor/nvd3/build/nv.d3.min.css" />
    <!-- Perfect Scrollbar -->
    <link type="text/css" rel="stylesheet" href="../assets/vendor/perfect-scrollbar/css/perfect-scrollbar.min.css" />
    <!-- WEATHER APP -->
    <link type="text/css" rel="stylesheet" href="../_scss/apps/weather/style_weather_visualize.css" />
    <!-- Fuse Html -->
    <link type="text/css" rel="stylesheet" href="../assets/vendor/fuse-html/fuse-html.min.css" />
    <!-- Main CSS -->
    <link type="text/css" rel="stylesheet" href="../assets/css/main.css">
    <!-- / STYLESHEETS -->

    <!-- JAVASCRIPT -->
    <!-- jQuery -->
    <script type="text/javascript" src="../assets/vendor/jquery/dist/jquery.min.js"></script>
    <!-- Mobile Detect -->
    <script type="text/javascript" src="../assets/vendor/mobile-detect/mobile-detect.min.js"></script>
    <!-- Perfect Scrollbar -->
    <script type="text/javascript" src="../assets/vendor/perfect-scrollbar/js/perfect-scrollbar.jquery.min.js"></script>
    <!-- Popper.js -->
    <script type="text/javascript" src="../assets/vendor/popper.js/index.js"></script>
    <!-- Bootstrap -->
    <script type="text/javascript" src="../assets/vendor/bootstrap/bootstrap.min.js"></script>
    <!-- Nvd3 - D3 Charts -->
    <script type="text/javascript" src="../assets/vendor/d3/d3.min.js"></script>
    <script type="text/javascript" src="../assets/vendor/nvd3/build/nv.d3.min.js"></script>
    <!-- Data tables -->
    <script type="text/javascript" src="../assets/vendor/datatables.net/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../assets/vendor/datatables-responsive/js/dataTables.responsive.js"></script>
    <!-- PNotify -->
    <script type="text/javascript" src="../assets/vendor/pnotify/pnotify.custom.min.js"></script>
    <!-- Fuse Html -->
    <script type="text/javascript" src="../assets/vendor/fuse-html/fuse-html.min.js"></script>
    <!-- Main JS -->
    <script type="text/javascript" src="../assets/js/main.js"></script>
    <!-- Social JS -->
    <script type="text/javascript" src="../assets/js/components/social/social_script.js"></script>
    <!-- Users in company JS -->
    <script type="text/javascript" src="../assets/js/components/social/users.js"></script>
    <!-- Weather app JS -->
    <script type="text/javascript" src="../assets/js/apps/weather/weather.js"></script>
    <!-- StatusChanger JS -->
    <script type="text/javascript" src="../assets/vendor/userActive/script-statusChanger.js"></script>

    <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>

    <!-- / JAVASCRIPT -->
</head>

<body class="layout layout-vertical layout-left-navigation layout-below-toolbar">
    <main>
        <div id="wrapper">
            <aside id="aside" class="aside aside-left" data-fuse-bar="aside" data-fuse-bar-media-step="md" data-fuse-bar-position="left">
                <div class="aside-content-wrapper">

                    <div class="aside-content bg-primary-700 text-auto">

                        <!-- LOGO BOX -->
                        <div class="aside-toolbar">

                            <div class="logo">
                                <span class="logo-icon">F</span>
                                <a class="logo-text" href="app-home.jsp" target="_blank" style="color:white; text-decoration: none;" >FFTP</a>
                            </div>

                            <button id="toggle-fold-aside-button" type="button" class="btn btn-icon d-none d-lg-block" data-fuse-aside-toggle-fold>
                                <i class="icon icon-backburger"></i>
                            </button>

                        </div>

                        <!-- LEFT NAV BAR -->
                        <ul class="nav flex-column custom-scrollbar" id="sidenav" data-children=".nav-item">

                            <li class="subheader">
                                <span>APPS</span>
                            </li>

                            <!-- Button add project -->
                            <c:if test = "${! obj_user.getTypeWork().equals("programer") }">
                              <li class="subheader">
                                <a type="post-button button" class="btn btn-secondary" href="apps-projects.jsp#new_project" aria-label="new_project">
                                  <i class="icon s-4 icon-plus"></i>
                                  <span>New Project</span>
                                </a>
                              </li>
                            </c:if>

                            <!-- DASHBOARD -->
                            <li class="nav-item" role="tab" id="heading-dashboards">
                                <a class="nav-link ripple with-arrow collapsed" data-toggle="collapse" data-target="#collapse-dashboards" href="#" aria-expanded="false" aria-controls="collapse-dashboards">
                                    <i class="icon s-4 icon-tile-four"></i>
                                    <span>Dashboards</span>
                                </a>
                                <ul id="collapse-dashboards" class='collapse show' role="tabpanel" aria-labelledby="heading-dashboards" data-children=".nav-item">
                                    <li class="nav-item">
                                        <a class="nav-link ripple active" href="app-home.jsp" data-url="app-home.jsp">
                                            <span>Home </span>
                                        </a>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link ripple" href="app-project.jsp" data-url="apps-project.jsp">
                                            <span>Project</span>
                                        </a>
                                    </li>

                                </ul>
                            </li>

                            <!-- EMAIL -->
                            <li class="nav-item">
                                <a class="nav-link ripple " href="apps-mail.jsp" data-url="apps-mail.jsp">
                                    <i class="icon s-4 icon-email"></i>
                                    <span>E-Mail</span>
                                </a>
                            </li>

                            <!-- CHAT -->
                            <li class="nav-item">
                                <a class="nav-link ripple " href="apps-chat.jsp" data-url="apps-chat.jsp">
                                    <i class="icon s-4 icon-hangouts"></i>
                                    <span>Chat</span>
                                    <!-- VALUE SET FROM JAVA /JS -> <span class="badge badge-secondary badge-pill"></span>-->
                                </a>

                            </li>

                            <!-- FILE MANAGER -->
                            <li class="nav-item">
                                <a class="nav-link ripple" href="apps-file-manager.jsp" data-url="apps-file-manager.jsp">
                                    <i class="icon s-4 icon-folder"></i>
                                    <span>File Manager</span>
                                </a>
                            </li>

                            <!-- MAP -->
                            <li class="nav-item">
                                <a class="nav-link ripple " href="apps-map.jsp" data-url="apps-map.jsp" >
                                    <i class="icon s-4 icon-map-marker"></i>
                                    <span>Map</span>
                                </a>
                            </li>

                            <li class="subheader">
                                <span>PAGES</span>
                            </li>

                            <!-- PROFILE -->
                            <li class="nav-item" role="tab" id="heading-acount">
                                <a class="nav-link ripple with-arrow collapsed" data-toggle="collapse" data-target="#collapse-acount" href="#" aria-expanded="false" aria-controls="collapse-acount">
                                    <i class="icon s-4 icon-account"></i>
                                    <span>Acount</span>
                                </a>
                                <ul id="collapse-acount" class='collapse' role="tabpanel" aria-labelledby="heading-dashboards" data-children=".nav-item">
                                    <li class="nav-item">
                                        <a class="nav-link ripple" href="pages-profile.jsp" data-url="pages-profile.jsp">
                                            <span>Profile</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link ripple" href="pages-settings.jsp" data-url="pages-settings.jsp">
                                            <span>Settings</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                        </ul>

                    </div>
                </div>
            </aside>
            <div class="content-wrapper">
                <!-- UP NAV BAR-->
                <nav id="toolbar" class="bg-white">

                    <div class="row no-gutters align-items-center flex-nowrap">

                        <div class="col">

                            <div class="row no-gutters align-items-center flex-nowrap">

                                <button type="button" class="toggle-aside-button btn btn-icon d-block d-lg-none" data-fuse-bar-toggle="aside">
                                    <i class="icon icon-menu"></i>
                                </button>


                            </div>
                        </div>

                        <div class="col-auto">

                            <div class="row no-gutters align-items-center justify-content-end">

                              <div class="user-menu-button dropdown">

                                  <div class="dropdown-toggle ripple row align-items-center no-gutters px-2 px-sm-4" role="button" id="dropdownUserMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                      <div class="avatar-wrapper">
                                          <!-- JAVA SET PROFILE IMAGE -->
                                          <img class="avatar" src="../assets/images/avatars/<c:out value="${profilePicture}"/> ">

                                          <!-- JS SET STATUS -->
                                          <i class="status s-4" name="status-user"></i>
                                      </div>
                                      <!-- JAVA SET F,L name -->
                                      <span class="username mx-3 d-none d-md-block"> <c:out value="${firstName}"/> <c:out value="${lastName}"/> </span>
                                  </div>

                                  <div class="dropdown-menu" aria-labelledby="dropdownUserMenu">

                                      <a class="dropdown-item" href="pages-settings.jsp">
                                          <div class="row no-gutters align-items-center flex-nowrap">
                                              <i class="icon-account"></i>
                                              <span class="px-3">Settings</span>
                                          </div>
                                      </a>


                                      <a class="dropdown-item" data-toggle="modal" data-target="#modal-action"  data-whatever="@getbootstrap">
                                          <div class="row no-gutters align-items-center flex-nowrap">
                                              <!-- JS SET STATUS -->
                                              <i class="status" name="status-user" ></i>
                                              <span id="action_label" class="px-3"></span>
                                          </div>
                                      </a>

                                      <div class="dropdown-divider"></div>

                                      <a class="dropdown-item" href="../../Logout">
                                          <div class="row no-gutters align-items-center flex-nowrap">
                                                <i class="icon-logout"></i>
                                                <span class="px-3">Logout</span>
                                          </div>
                                      </a>

                                  </div>
                              </div>

                                <div class="toolbar-separator"></div>

                                <button  type="button" class="search-button btn btn-icon">
                                    <!-- JS -> SEARCH -> result to JS or JAVA  -->
                                    <i class="icon icon-magnify"></i>
                                </button>

                                <div class="toolbar-separator"></div>

                                <button onclick="window.location.replace('../../Lock');" type="button" class="search-button btn btn-icon">
                                    <!-- JS -> JAVA LOCK BUTTON   -->
                                    <i class="icon icon-lock" ></i>
                                </button>

                                <div class="toolbar-separator"></div>

                                <!-- BUTTON CHAT -->
                                <button type="button" class="quick-panel-button btn btn-icon" data-fuse-bar-toggle="quick-panel-sidebar">
                                    <i class="icon icon-hangouts"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </nav>

                <!-- CONTENT CENTER -->
                <div class="content custom-scrollbar">
                    <div id="e-commerce-product" class="page-layout simple tabbed">

                          <!-- HEADER -->
                          <div class="page-header bg-secondary text-auto row no-gutters align-items-center justify-content-between p-6">

                            <div class="row no-gutters align-items-center">
                                  <div>
                                      <span class="h2">Welcome, <c:out value="${firstName}"/></span>
                                  </div>
                            </div>

                          </div>
                          <!-- / HEADER -->


                          <!-- CONTENT -->
                          <div class="page-content">

                              <!-- TABS -->
                              <ul class="nav nav-tabs" id="myTab" role="tablist">
                                  <!-- TAB home -->
                                  <li class="nav-item">
                                      <a class="nav-link btn active" id="home-tab" data-toggle="tab" href="#timeline-tab-pane" role="tab" aria-controls="home-tab-pane" aria-expanded="true">Home</a>
                                  </li>

                                  <!-- TAB users -->
                                  <li class="nav-item">
                                      <a class="nav-link btn" id="team-members-tab" data-toggle="tab" href="#team-members-tab-pane" role="tab" aria-controls="team-members-tab-pane">Users in company</a>
                                  </li>
                              </ul>

                              <div class="tab-content">

                                  <!-- TAB POSTS -->
                                  <div role="tabpanel" class="tab-pane fade show active p-3" id="timeline-tab-pane" aria-labelledby="timeline-tab">
                                    <div class="row">

                                        <!-- POST's -->
                                        <div class="timeline col-12 col-sm-7 col-xl-9">

                                                    <!-- WRITE POST -->
                                                    <div class="profile-box add-post card">

                                                        <div class="form">

                                                            <textarea id="textArea" class="w-100 p-4" placeholder="Write something.."></textarea>

                                                            <footer class="row no-gutters align-items-center justify-content-between bg-light p-2">
                                                                <!-- BUTTONS -->
                                                                <div class="row no-gutters">

                                                                    <button type="button" class="btn btn-icon" aria-label="insert photo">
                                                                        <i class="icon icon-file-image-box"></i>
                                                                    </button>

                                                                    <button type="button" class="btn btn-icon" aria-label="insert photo">
                                                                        <i class="icon icon-cloud-upload"></i>
                                                                    </button>

                                                                    <button type="button" class="btn btn-icon" aria-label="add person">
                                                                        <i class="icon icon-person-plus"></i>
                                                                    </button>

                                                                    <button type="button" class="btn btn-icon" aria-label="add person">
                                                                        <i class="icon icon-map-marker"></i>
                                                                    </button>

                                                                </div>

                                                                <button onClick="addPost()" type="post-button button" class="btn btn-secondary" aria-label="post">
                                                                    POST
                                                                </button>

                                                            </footer>
                                                        </div>
                                                    </div>

                                                    <!-- CONATINER POSTS -->
                                                    <div class="divider my-8" id="time-line-insert" name="allTimeLine" ></div>

                                                    <!-- SEE MORE -->
                                                    <button type="button" onclick="seeMore()" class="post-comment-button btn btn-sm btn-secondary"  aria-label="see_more">
                                                      <span>
                                                        .. See more ..
                                                      <span>
                                                    </button>


                                        </div>
                                        <!-- / POST's -->

                                        <!-- LEFT - NOTICE + WEATHER APPS -->
                                        <div class="timeline-sidebar col-12 col-sm-5 col-xl-3">

                                                    <div class="profile-box latest-activity card mb-4">

                                                        <header class="row no-gutters align-items-center justify-content-between bg-secondary text-auto p-4">
                                                            <div class="title h6">
                                                              <i class="icon icon-paw"></i>
                                                              Notices
                                                            </div>
                                                            <div class="more text-muted">See All</div>
                                                        </header>


                                                        <div class="content activities p-4">
                                                            <!-- container -->
                                                            <div class="activity row no-gutters py-4">

                                                                <img src="../assets/images/avatars/joyce.jpg" class="col-auto avatar mr-4" alt="Judith Burton" />
                                                                <div class="col">

                                                                    <div>
                                                                        <span class="username md-accent-color">Judith Burton</span>
                                                                        <span class="message"> shared a photo with you.</span>
                                                                    </div>

                                                                    <span class="time text-muted">June 5,2015</span>

                                                                </div>
                                                            </div>
                                                            <!-- / container -->
                                                        </div>
                                                    </div>

                                                    <div class="profile-box friends card mb-4">

                                                        <header class="row no-gutters align-items-center justify-content-between bg-secondary text-auto p-4">
                                                            <div class="title h6">Weather</div>
                                                            <div class="more text">

                                                               <button type="button" onclick="geoFindMe()" class="btn btn-icon" aria-label="reload">
                                                                   <i class="icon icon-cached"></i>
                                                               </button>

                                                            </div>
                                                        </header>

                                                        <div class="content row no-gutters p-4">
                                                          <!-- API WEATHER visualize data -->
                                                          <div class="container clearfix" style="background-color: #00000029">
                                                            <p class="error"></p>
                                                            <p class="location"></p>
                                                            <p class="temperature"></p>
                                                            <div class="climate_bg"></div>

                                                            <div class="info_bg">
                                                                <img class="dropicon" src="../assets/weather/icon/Droplet.svg"/>
                                                                <p class="humidity"></p>
                                                                <img class="windicon" src="../assets/weather/icon/Wind.svg"/>
                                                                <div class="windspeed"></div>
                                                            </div>
                                                          </div>
                                                          <!-- / API WEATHER -->

                                                        </div>
                                                    </div>
                                        </div>



                                    </div>
                                  </div>
                                  <!-- / TAB POSTS -->

                                  <!-- TAB ALL USERS  -->
                                  <div class="tab-pane fade p-6" id="team-members-tab-pane" role="tabpanel" aria-labelledby="team-members-tab">

                                      <!-- WIDGET GROUP -->
                                      <div class="widget-group row no-gutters">

                                          <!-- WIDGET 1 -->
                                          <div class="col-12">

                                              <div class="card">

                                                  <div class="widget-header px-4 py-6 row no-gutters align-items-center justify-content-between">

                                                      <div class="col">
                                                          <span class="h5">All users</span>
                                                      </div>

                                                      <div>
                                                          <!-- JS SET NUM USERS  -->
                                                          <span class="badge badge-danger" id="users_in_company_num"></span>
                                                      </div>

                                                  </div>

                                                  <div class="divider"></div>

                                                  <div class="widget-content table-responsive">
                                                      <!-- JS DATA TABLE -->
                                                      <table class="table" id="users_in_company">
                                                      </table>
                                                  </div>

                                              </div>
                                          </div>
                                          <!-- WIDGET 1 -->
                                      </div>
                                  </div>
                                  <!-- / TAB ALL USERS  -->
                              </div>

                          </div>
                          <!-- / CONTENT -->

                    </div>

                    <script type="text/javascript" src="../assets/js/apps/dashboard/project.js"></script>

                </div>
            </div>

            <!-- MODAL ACTION SHOW -->
            <div class="modal fade" id="modal-action" tabindex="-1" role="dialog" aria-labelledby="modal-compose" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Chouse action</h5>

                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="modal-body">
                            <form>
                                <button type="button" class="btn btn-secondary" onclick="userChangeAction('online')" data-dismiss="modal">online <i class="icon icon-checkbox-marked-circle"></i> </button>
                                <button type="button" class="btn btn-secondary" onclick="userChangeAction('work')" data-dismiss="modal">work <i class="icon icon-flash"></i></button>
                                <button type="button" class="btn btn-secondary" onclick="userChangeAction('offline')" data-dismiss="modal">offline <i class="icon icon-do-not-disturb"></i> </button>
                            </form>
                        </div>

                    </div>
                </div>
            </div>


            <!-- RIGHT - Chat panel --
            <div class="quick-panel-sidebar custom-scrollbar" fuse-cloak data-fuse-bar="quick-panel-sidebar" data-fuse-bar-position="right">
              <!-- TABS --
              <ul class="nav nav-tabs" id="myTab" role="tablist">
                  <!-- TAB CHAT --
                  <li class="nav-item">
                      <a class="nav-link btn active" id="chat-tab" data-toggle="tab" href="#chat-panel" role="tab" aria-controls="home-tab-pane" aria-expanded="true">Chat</a>
                  </li>
              </ul>
            </div>-->


        </div>
    </main>
</body>

</html>


</c:otherwise>
</c:choose>
