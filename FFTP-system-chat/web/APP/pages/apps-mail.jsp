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
    <title>FFTP | Mail</title>
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
                              <a class="nav-link ripple active" href="apps-mail.jsp" data-url="apps-mail.jsp">

                                  <i class="icon s-4 icon-email"></i>
                                  <span>E-Mail</span>
                              </a>
                          </li>

                          <!-- CHAT -->
                          <li class="nav-item">
                              <a class="nav-link ripple " href="apps-chat.jsp" data-url="apps-chat.jsp">

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

                              <button type="button" onclick="window.location.replace('../../Lock');" class="search-button btn btn-icon">
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

                <div class="content custom-scrollbar">

                    <div id="mail" class="page-layout carded left-sidebar">

                        <div class="top-bg bg-secondary"></div>

                        <aside class="page-sidebar" data-fuse-bar="mail-sidebar" data-fuse-bar-media-step="md">

                            <!-- HEADER -->
                            <div class="header d-flex flex-column justify-content-between p-6 light-fg">

                                <div class="logo d-flex align-items-center pt-7">
                                    <i class="icon-email mr-4"></i>
                                    <span class="logo-text h4">Mailbox</span>
                                </div>

                                <div class="account">
                                    <!-- JAVA SET .getEmail -->
                                    <div class="title">work@project-uktc.eu</div>
                                </div>

                            </div>
                            <!-- / HEADER -->

                            <!-- COMPOSE, INBOX, SPAM ... button -->
                            <div class="content custom-scrollbar">
                                <!-- този бутон чрез JS требява да появява диалог в който да си напишеш имеил и да го изпратиш-->
                                <div class="p-6">
                                    <button type="button" class="btn btn-secondary btn-block" data-toggle="modal" data-target="#modal-compose" data-whatever="@getbootstrap" >COMPOSE</button>
                               </div>




                                <ul class="nav flex-column">

                                    <li class="nav-item">
                                        <a class="nav-link ripple" href="#">
                                            <i class="icon s-4 icon-inbox"></i>
                                            <span>Inbox</span>
                                        </a>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link ripple" href="#">
                                            <i class="icon s-4 icon-send"></i>
                                            <span>Sent</span>
                                        </a>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link ripple" href="#">
                                            <i class="icon s-4 icon-email-open"></i>
                                            <span>Drafts</span>
                                        </a>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link ripple" href="#">
                                            <i class="icon s-4 icon-delete"></i>
                                            <span>Trash</span>
                                        </a>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link ripple" href="#">
                                            <i class="icon s-4 icon-alert-octagon"></i>
                                            <span>Spam</span>
                                        </a>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link ripple" href="#">
                                            <i class="icon s-4 icon-star"></i>
                                            <span>Starred</span>
                                        </a>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link ripple" href="#">
                                            <i class="icon s-4 icon-label"></i>
                                            <span>Important</span>
                                        </a>
                                    </li>

                                </ul>
                            </div>

                        </aside>

                        <div class="page-content-wrapper">

                            <!-- HEADER -->
                            <div class="page-header d-flex flex-column justify-content-center light-fg">

                                <div class="search-bar row align-items-center no-gutters bg-white text-auto">

                                    <button type="button" class="sidebar-toggle-button btn btn-icon d-block d-lg-none" data-fuse-bar-toggle="mail-sidebar">
                                        <i class="icon icon-menu"></i>
                                    </button>

                                    <i class="icon-magnify s-6 mx-4"></i>

                                    <input class="search-bar-input col" type="text" placeholder="Search for an e-mail or contact">

                                </div>
                            </div>
                            <!-- / HEADER -->

                            <div class="page-content-card">
                                <!-- CONTENT -->
                                <!-- CONTENT TOOLBAR -->
                                <div class="toolbar row no-gutters align-items-center px-4 px-sm-6">

                                    <div class="col">

                                        <div class="row no-gutters align-items-center">

                                            <div class="col-auto">

                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" />
                                                    <span class="custom-control-indicator"></span>
                                                </label>

                                            </div>

                                            <!-- Buttons -->
                                            <div class="action-buttons col">

                                                <div class="row no-gutters align-items-center flex-nowrap d-none d-xl-flex">

                                                    <div class="divider-vertical"></div>

                                                    <button type="button" class="btn btn-icon" aria-label="archive">
                                                        <i class="icon icon-archive"></i>
                                                    </button>

                                                    <button type="button" class="btn btn-icon" aria-label="spam">
                                                        <i class="icon icon-alert-octagon"></i>
                                                    </button>

                                                    <button type="button" class="btn btn-icon" aria-label="delete">
                                                        <i class="icon icon-delete"></i>
                                                    </button>

                                                    <div class="divider-vertical"></div>

                                                    <button type="button" class="btn btn-icon" aria-label="move to">
                                                        <i class="icon icon-folder"></i>
                                                    </button>

                                                    <button type="button" class="btn btn-icon" aria-label="labels">
                                                        <i class="icon icon-label"></i>
                                                    </button>

                                                    <button type="button" class="btn btn-icon" aria-label="move to">
                                                        <i class="icon icon-folder"></i>
                                                    </button>

                                                    <div class="divider-vertical"></div>

                                                    <button type="button" class="btn btn-icon" aria-label="more">
                                                        <i class="icon icon-dots-vertical"></i>
                                                    </button>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- PAGES 1 of 100 navigate .. -->
                                    <div class="col-auto">

                                        <div class="row no-gutters align-items-center">

                                            <span class="page-info px-2 d-none d-sm-block">1 - 100 of 980</span>

                                            <button type="button" class="btn btn-icon">
                                                <i class="icon icon-chevron-left"></i>
                                            </button>

                                            <button type="button" class="btn btn-icon">
                                                <i class="icon icon-chevron-right"></i>
                                            </button>

                                        </div>
                                    </div>

                                </div>

                                <!-- / CONTENT TOOLBAR -->
                                <div class="page-content custom-scrollbar">
                                    <!-- JS change page - emails INBOX, read EMAIL (content visualizate) -->
                                    <!--- INBOX EMAILS -->
                                    <div class="thread-list w-100">

                                        <div class="thread ripple row no-gutters flex-wrap flex-sm-nowrap align-items-center py-2 px-3 py-sm-4 px-sm-6 unread">

                                            <label class="col-auto custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-indicator"></span>
                                            </label>

                                            <div class="info col px-4">

                                                <div class="name row no-gutters align-items-center">
                                                    <!-- JS JAVA SET profilePicture ako е от компанията иначе гледа от имеила -->
                                                    <img class="avatar mr-2" alt="Alice Freeman" src="../assets/images/avatars/alice.jpg" />
                                                    <span class="">Alice Freeman</span>
                                                    <i class="icon-paperclip has-attachment s-4"></i>
                                                </div>

                                                <div class="subject">
                                                    Commits that need to be pushed lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                                </div>

                                                <div class="message">
                                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce lorem diam, …
                                                </div>
                                            </div>

                                            <div class="col-12 col-sm-auto d-flex flex-sm-column justify-content-center align-items-center">
                                                <!-- DATE -->
                                                <div class="time mb-2">28 Jun</div>

                                            </div>
                                        </div>

                                        <div class="thread ripple row no-gutters flex-wrap flex-sm-nowrap align-items-center py-2 px-3 py-sm-4 px-sm-6 unread">

                                            <label class="col-auto custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-indicator"></span>
                                            </label>

                                            <div class="info col px-4">

                                                <div class="name row no-gutters align-items-center">

                                                    <img class="avatar mr-2" alt="Lawrence Collins" src="../assets/images/avatars/vincent.jpg" />
                                                    <span class="">Lawrence Collins</span>
                                                    <i class="icon-paperclip has-attachment s-4"></i>

                                                </div>

                                                <div class="subject">
                                                    Commits that need to be pushed lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                                </div>

                                                <div class="message">
                                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce lorem diam, …
                                                </div>
                                            </div>

                                            <div class="col-12 col-sm-auto d-flex flex-sm-column justify-content-center align-items-center">

                                                <div class="time mb-2">28 Jun</div>
                                            </div>
                                        </div>

                                        <div class="thread ripple row no-gutters flex-wrap flex-sm-nowrap align-items-center py-2 px-3 py-sm-4 px-sm-6 ">

                                            <label class="col-auto custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-indicator"></span>
                                            </label>

                                            <div class="info col px-4">

                                                <div class="name row no-gutters align-items-center">
                                                    <img class="avatar mr-2" alt="Judith Burton" src="../assets/images/avatars/joyce.jpg" />
                                                    <span class="">Judith Burton</span>
                                                    <i class="icon-paperclip has-attachment s-4"></i>
                                                </div>

                                                <div class="subject">
                                                    Commits that need to be pushed lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                                </div>

                                                <div class="message">
                                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce lorem diam, …
                                                </div>
                                            </div>

                                            <div class="col-12 col-sm-auto d-flex flex-sm-column justify-content-center align-items-center">
                                                <div class="time mb-2">28 Jun</div>
                                            </div>
                                        </div>

                                        <div class="thread ripple row no-gutters flex-wrap flex-sm-nowrap align-items-center py-2 px-3 py-sm-4 px-sm-6 ">

                                            <label class="col-auto custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-indicator"></span>
                                            </label>

                                            <div class="info col px-4">

                                                <div class="name row no-gutters align-items-center">
                                                    <img class="avatar mr-2" alt="Judith Burton" src="../assets/images/avatars/joyce.jpg" />
                                                    <span class="">Judith Burton</span>
                                                    <i class="icon-paperclip has-attachment s-4"></i>
                                                </div>

                                                <div class="subject">
                                                    Commits that need to be pushed lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                                </div>

                                                <div class="message">
                                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce lorem diam, …
                                                </div>
                                            </div>

                                            <div class="col-12 col-sm-auto d-flex flex-sm-column justify-content-center align-items-center">
                                                <div class="time mb-2">28 Jun</div>
                                            </div>
                                        </div>

                                    </div>
                                    <!--- / INBOX EMAILS -->
                                </div>

                                <!-- / CONTENT -->
                            </div>
                        </div>
                    </div>

                </div>
            </div>


            <!-- MODAL COMPOSE SHOW -->
            <div class="modal fade" id="modal-compose" tabindex="-1" role="dialog" aria-labelledby="modal-compose" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">New email</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <!-- FROM -->
                                <div class="form-inline ">
                                    <label for="recipient-name" class="form-control-label">From:</label>
                                    <input type="text" class="form-control mx-sm-3" id="recipient-name" value="work@project-uktc.eu" disabled/>
                                </div>

                                <!-- TO -->
                                <div class="form-group">
                                    <label for="recipient-name" class="form-control-label">To:</label>
                                    <div class="form-inline mx-sm-3 align-items-center">

                                        <div class="col-auto">
                                          <label class="sr-only" for="name-receiverEmail">Name</label>
                                          <input type="text" class="form-control mb-2 mb-sm-0" id="name-receiverEmail" placeholder="work" >
                                        </div>
                                        <div class="col-auto">
                                          <label class="sr-only" for="host-receiverEmail">Host</label>
                                          <div class="input-group mb-2 mb-sm-0">
                                            <div class="input-group-addon">@</div>
                                            <input type="text" class="form-control" id="host-receiverEmail" placeholder="project-uktc.eu" >
                                          </div>
                                        </div>

                                    </div>
                                </div>

                                <!-- Subject -->
                                <div class="form-group">
                                    <label for="recipient-name" class="form-control-label">Subject:</label>
                                    <input type="text" class="form-control" id="recipient-name" />
                                </div>

                                <!-- BUTTONS -
                                <div text-angular-toolbar="" name="textAngularToolbar9728386968338112" class="ng-scope ng-isolate-scope ta-toolbar">
                                  <div class="ta-group">

                                    <button type="button" class="md-button ng-scope" name="bold" ta-button="ta-button" ng-disabled="isDisabled()" tabindex="-1" ng-click="executeAction()" ng-class="displayActiveToolClass(active)" title="Bold" unselectable="on" disabled="disabled">
                                      <i class="icon-format-bold"></i>
                                    </button>

                                    <button type="button" class="md-button ng-scope" name="italics" ta-button="ta-button" ng-disabled="isDisabled()" tabindex="-1" ng-click="executeAction()" ng-class="displayActiveToolClass(active)" title="Italic" unselectable="on" disabled="disabled">
                                      <i class="icon-format-italic"></i>
                                    </button>

                                    <button type="button" class="md-button ng-scope" name="underline" ta-button="ta-button" ng-disabled="isDisabled()" tabindex="-1" ng-click="executeAction()" ng-class="displayActiveToolClass(active)" title="Underline" unselectable="on" disabled="disabled">
                                      <i class="icon-format-underline"></i>
                                    </button>

                                  </div>
                                </div>-->

                                <!-- Content -->
                                <div class="form-group">
                                    <label for="message-text" class="form-control-label">Message:</label>
                                    <textarea class="form-control" id="message-text"></textarea>
                                </div>

                            </form>
                        </div>
                        <!--  BUTTONS - CLOSE, SEND -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Send email</button>
                        </div>
                    </div>
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

            <!-- tova trqbwa da e chat -
            <div class="quick-panel-sidebar custom-scrollbar" fuse-cloak data-fuse-bar="quick-panel-sidebar" data-fuse-bar-position="right">
                <div class="list-group" class="date">

                    <div class="list-group-item subheader">TODAY</div>

                    <div class="list-group-item two-line">

                        <div class="text-muted">

                            <div class="h1"> Saturday</div>

                            <div class="h2 row no-gutters align-items-start">
                                <span> 1</span>
                                <span class="h6">th</span>
                                <span> Jan</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="list-group">

                    <div class="list-group-item subheader">Events</div>

                    <div class="list-group-item two-line">

                        <div class="list-item-content">
                            <h3>Group Meeting</h3>
                            <p>In 32 Minutes, Room 1B</p>
                        </div>
                    </div>

                    <div class="list-group-item two-line">

                        <div class="list-item-content">
                            <h3>Public Beta Release</h3>
                            <p>11:00 PM</p>
                        </div>
                    </div>

                    <div class="list-group-item two-line">

                        <div class="list-item-content">
                            <h3>Dinner with David</h3>
                            <p>17:30 PM</p>
                        </div>
                    </div>

                    <div class="list-group-item two-line">

                        <div class="list-item-content">
                            <h3>Q&amp;A Session</h3>
                            <p>20:30 PM</p>
                        </div>
                    </div>

                </div>

                <div class="divider"></div>

                <div class="list-group">

                    <div class="list-group-item subheader">Notes</div>

                    <div class="list-group-item two-line">

                        <div class="list-item-content">
                            <h3>Best songs to listen while working</h3>
                            <p>Last edit: May 8th, 2015</p>
                        </div>
                    </div>

                    <div class="list-group-item two-line">

                        <div class="list-item-content">
                            <h3>Useful subreddits</h3>
                            <p>Last edit: January 12th, 2015</p>
                        </div>
                    </div>

                </div>

                <div class="divider"></div>

                <div class="list-group">

                    <div class="list-group-item subheader">Quick Settings</div>

                    <div class="list-group-item">

                        <div class="list-item-content">
                            <h3>Notifications</h3>
                        </div>

                        <div class="secondary-container">
                            <label class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" />
                                <span class="custom-control-indicator"></span>
                            </label>
                        </div>

                    </div>

                    <div class="list-group-item">

                        <div class="list-item-content">
                            <h3>Cloud Sync</h3>
                        </div>

                        <div class="secondary-container">
                            <label class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" />
                                <span class="custom-control-indicator"></span>
                            </label>
                        </div>

                    </div>

                    <div class="list-group-item">

                        <div class="list-item-content">
                            <h3>Retro Thrusters</h3>
                        </div>

                        <div class="secondary-container">

                            <label class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" />
                                <span class="custom-control-indicator"></span>
                            </label>
                        </div>
                    </div>
                </div>
            </div>-->


        </div>
    </main>
</body>

</html>


</c:otherwise>
</c:choose>
