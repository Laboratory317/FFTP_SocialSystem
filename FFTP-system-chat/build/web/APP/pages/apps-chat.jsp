
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="obj_user" scope="session" value="${ sessionScope.user }"/>
<c:choose>
  <c:when test="${ obj_user == null}">
    <c:redirect url = "login.jsp"/>
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
    <title>FFTP | Chat</title>
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
    <!-- StatusChanger JS -->
    <script type="text/javascript" src="../assets/vendor/userActive/script-statusChanger.js"></script>
    <!-- Fuse Html -->
    <script type="text/javascript" src="../assets/vendor/fuse-html/fuse-html.min.js"></script>
    <!-- Main JS -->
    <script type="text/javascript" src="../assets/js/main.js"></script>
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
                                <ul id="collapse-dashboards" class='collapse ' role="tabpanel" aria-labelledby="heading-dashboards" data-children=".nav-item">
                                    <li class="nav-item">
                                        <a class="nav-link ripple" href="app-home.jsp" data-url="app-home.jsp">
                                            <span>Home </span>
                                        </a>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link ripple" href="app-project.jsp" data-url="app-project.jsp">
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
                              <a class="nav-link ripple active" href="apps-chat.jsp" data-url="apps-chat.jsp">

                                  <i class="icon s-4 icon-hangouts"></i>
                                  <span>Chat</span>
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
                          <!-- UP NAV BAR-->
                          <div class="row no-gutters align-items-center justify-content-end">

                            <div class="user-menu-button dropdown">

                                <div class="dropdown-toggle ripple row align-items-center no-gutters px-2 px-sm-4" role="button" id="dropdownUserMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <div class="avatar-wrapper">
                                        <!-- JAVA SET PROFILE IMAGE -->
                                        <img class="avatar" src="../assets/images/avatars/<c:out value="${profilePicture}"/> ">

                                        <!-- JS SET STATUS -->
                                        <i class="status s-4" name="status-user" ></i>
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
                                            <i class="status" name="status-user"></i>
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

                              <button type="button" class="search-button btn btn-icon">
                                  <!-- JS -> SEARCH -> result to JS or JAVA  -->
                                  <i class="icon icon-magnify"></i>
                              </button>

                              <div class="toolbar-separator"></div>

                              <button type="button"  onclick="window.location.replace('../../Lock');" class="search-button btn btn-icon">
                                  <!-- JS -> JAVA LOCK BUTTON   -->
                                  <i class="icon icon-lock" ></i>
                              </button>

                              <div class="toolbar-separator"></div>

                              <button type="button" class="quick-panel-button btn btn-icon" data-fuse-bar-toggle="quick-panel-sidebar">
                                  <i class="icon icon-format-list-bulleted"></i>
                              </button>
                          </div>
                      </div>
                  </div>
                </nav>

                <div class="content custom-scrollbar">

                    <div id="chat" class="page-layout carded full-width">

                        <!-- background-page  <div class="top-bg bg-secondary"></div>-->

                        <!-- CONTENT -->
                        <div class="page-content-wrapper w-100 mx-auto px-0 pt-0 pt-sm-0 px-sm-0 pt-sm-0">
                            <div class="page-content-card">

                                <!-- LEFT BAR CHAT -->
                                <aside class="left-sidebar" data-fuse-bar="chat-left-sidebar" data-fuse-bar-media-step="lg">
                                    <div id="chat-left-sidebar-views" class="views">
                                      <style>
                                        #chat .page-content-wrapper>.page-content-card>.left-sidebar {
                                          width: 30rem;
                                        }
                                      </style>

                                        <!--  чат page -->
                                        <div id="chats-view" class="view d-flex flex-column no-gutters">
                                            <!-- CHATS TOOLBAR -->
                                            <div class="toolbar">

                                                <!-- TOOLBAR BOTTOM -->
                                                <div class="toolbar-bottom row align-items-center no-gutters px-4">

                                                    <!-- SEARCH -->
                                                    <div class="search-wrapper md-elevation-1 row no-gutters align-items-center w-100 p-2">
                                                        <i class="icon-magnify s-4"></i>
                                                        <input class="col pl-2" onkeyup="search( $(this) )" type="text" placeholder="Search or start new chat">
                                                    </div>
                                                    <!-- / SEARCH -->
                                                </div>
                                                <!-- / TOOLBAR BOTTOM -->

                                            </div>
                                            <!-- / CHATS TOOLBAR -->

                                            <!-- CHATS CONTENT -->
                                            <div class="content col custom-scrollbar">

                                                <!-- JS SET ->  CHAT LIST USER + LAST MESSAGES -->
                                                <div class="chat-list"></div>

                                            </div>
                                            <!-- / CHATS CONTENT -->

                                        </div>
                                    </div>
                                </aside>

                                <!-- тук JS ъпдейтва и сетва за user conversation chat -->
                                <div class="page-content">

                                    <div id="chat-content-views" class="views">

                                        <!-- START CONVERSATION-->
                                        <div id="start-view" class="view d-flex flex-column align-items-center justify-content-center" style="background: url('https://i.pinimg.com/originals/5f/57/79/5f57791069223e10915e9973e16a9b7b.jpg') ;">
                                            <div class="big-circle md-elevation-4 row align-items-center justify-content-center no-gutters">

                                                <i class="s-32 text-secondary icon-hangouts"></i>

                                            </div>

                                            <span class="app-title h3 my-3">Chat App</span>

                                            <span class="text-muted h6 d-none d-xl-block">Select contact to start the chat!..</span>

                                            <button type="button" class="btn btn-secondary d-block d-xl-none" data-fuse-bar-toggle="chat-left-sidebar">
                                                Select contact to start the chat!..
                                            </button>

                                        </div>
                                        <!-- / START CONVERSATION  -->

                                        <!-- CHAT -->
                                        <div id="chat-view" class="view flex-column align-items-center justify-content-center d-none">
                                            <!-- CHAT TOOLBAR NAME , STATUS -->
                                            <div class="toolbar row no-gutters align-items-center justify-content-between w-100 px-4">

                                                <div class="col">

                                                    <div class="row no-gutters align-items-center">

                                                        <!-- RESPONSIVE CHATS BUTTON-
                                                        <button type="button" class="btn btn-icon" data-fuse-bar-toggle="chat-left-sidebar">
                                                            <i class="icon icon-hangouts s-8"></i>
                                                        </button>
                                                        <!-- / RESPONSIVE CHATS BUTTON-->

                                                        <!-- CHAT CONTACT-->
                                                        <div class="chat-contact row no-gutters align-items-center">

                                                            <div class="avatar-wrapper mr-4">
                                                                <img src="../assets/images/avatars/" class="avatar"  />
                                                                <i class="icon icon- s-4 status do-not-disturb"></i>
                                                            </div>

                                                            <div class="chat-contact-name">
                                                                {JS set FirstName}
                                                            </div>
                                                        </div>
                                                        <!-- / CHAT CONTACT-->

                                                    </div>
                                                </div>

                                                <button type="button" class="btn btn-icon">
                                                    <i class="icon icon-dots-vertical"></i>
                                                </button>
                                            </div>

                                            <!-- CHAT CONTENT MESSAGES -->
                                            <div class="chat-content col custom-scrollbar">
                                                <div class="chat-messages">

                                                    <!-- MESSAGE RECEIVER-->  <!-- title class :receiver (contact), me (user)-->
                                                    <div class="row flex-nowrap message-row contact p-4">
                                                        <!-- JS SET -  AVATAR IMAGE RECEIVER -->
                                                        <img class="avatar mr-4" src="../assets/images/avatars/joyce.jpg" />

                                                        <div class="bubble">
                                                            <!-- JS SET CONTECT AND DATE -->
                                                            <div class="message">Helloooo! Как сиии?</div>
                                                            <div class="time text-muted text-right mt-2">20 Mar 16 15:14</div>
                                                        </div>

                                                    </div>
                                                    <!-- / MESSAGE RECEIVER -->

                                                    <!-- MESSAGE ME SEND-->
                                                    <div class="row flex-nowrap message-row user p-4">
                                                        <!-- JS SET -  AVATAR IMAGE SENDER-->
                                                        <img class="avatar mr-4" src="../assets/images/avatars/" >

                                                        <div class="bubble">
                                                            <!-- JS SET CONTECT AND DATE -->
                                                            <div class="message">Hayy, па добре</div>
                                                            <div class="time text-muted text-right mt-2">20 Apr 16 15:14</div>
                                                        </div>

                                                    </div>
                                                    <!-- / MESSAGE ME SEND-->


                                                </div>
                                            </div>

                                            <!-- CHAT BOTTOM SEND NEW MESSAGE -->
                                            <div class="chat-footer row align-items-center justify-content-center w-100 p-2 pl-4">

                                                <!-- REPLY FORM -->
                                                <form class="reply-form row no-gutters align-items-center w-100">

                                                    <div class="form-group col mr-4">
                                                        <textarea class="form-control" id="exampleTextarea" placeholder="Type and hit enter to send message"></textarea>
                                                    </div>

                                                    <button type="button" class="btn btn-fab btn-secondary" aria-label="Send message">
                                                        <i class="icon icon-send"></i>
                                                    </button>

                                                </form>
                                                <!-- / REPLY FORM -->
                                            </div>

                                        </div>
                                        <!-- / CHAT -->

                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- / CONTENT -->
                    </div>

                    <script type="text/javascript" src="../assets/js/apps/chat/chat.js"></script>

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

            <!--<div class="quick-panel-sidebar custom-scrollbar" fuse-cloak data-fuse-bar="quick-panel-sidebar" data-fuse-bar-position="right">

          </div>-->

        </div>
    </main>
</body>

</html>

</c:otherwise>
</c:choose>
