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

    <c:set var="firstName"          scope="session" value="${obj_user.getFirstName()}"                />
    <c:set var="lastName"           scope="session" value="${obj_user.getLastName() }"                />
    <c:set var="username"           scope="session" value="${obj_user.getUsername() }"                />

    <c:set var="sex"                scope="session" value="${obj_user.getSex() ? "Female" : "Male" }" />
    <c:set var="dateBirthday"       scope="session" value="${obj_user.getBd() }"                      />

    <c:set var="address"            scope="session" value="${obj_user.getAddress() }"                 />
    <c:set var="city"               scope="session" value="${obj_user.getCity() }"                    />
    <c:set var="country"            scope="session" value="${obj_user.getCountry() }"                 />

    <c:set var="about"              scope="session" value="${obj_user.getAbout()}"                    />
    <c:set var="email"              scope="session" value="${obj_user.getEmail() }"                   />
    <c:set var="phoneNumber"        scope="session" value="${obj_user.getPhoneNumber() }"             />

    <c:set var="typeWork"           scope="session" value="${obj_user.getTypeWork() }"                />
    <c:set var="dateStartInCompany" scope="session" value="${obj_user.getDate_startInCompany()}"      />
    <c:set var="about"              scope="session" value="${obj_user.getAbout() }"                   />

    <c:set var="profilePicture"     scope="session" value="${obj_user.getProfilePicture() }"          />



<!DOCTYPE html>
<html lang="en-us">

<head>
    <title>FFTP | Profile</title>
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
    <!-- Social JS -->
    <script type="text/javascript" src="../assets/js/components/social/social_script.js"></script>
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
                                <ul id="collapse-acount" class='collapse show' role="tabpanel" aria-labelledby="heading-dashboards" data-children=".nav-item">
                                    <li class="nav-item">
                                        <a class="nav-link ripple active" href="pages-profile.jsp" data-url="pages-profile.jsp">
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
                </nav>

                <!-- CONTENT CENTER -->
                <div class="content custom-scrollbar">

                    <div id="profile" class="page-layout simple tabbed">

                        <!-- HEADER -->
                        <div class="page-header light-fg d-flex flex-column justify-content-center justify-content-lg-end p-6">

                            <div class="flex-column row flex-lg-row align-items-center align-items-lg-end no-gutters justify-content-between">

                                <div class="user-info flex-column row flex-lg-row no-gutters align-items-center">
                                    <!-- JAVA SEND Profile picture and fullname -->
                                    <img class="profile-image avatar huge mr-6" src="../assets/images/avatars/<c:out value="${profilePicture}"/> ">
                                    <div class="name h2 my-6"> <c:out value="${firstName}"/> <c:out value="${lastName}"/> </div>
                                </div>


                                <div class="actions row align-items-center no-gutters">
                                    <a  href="pages-settings.jsp">
                                        <button type="button" class="btn btn-secondary ml-2">EDIT</button>
                                    </a>
                                </div>


                            </div>
                        </div>
                        <!-- / HEADER -->

                        <!-- CONTENT -->
                        <div class="page-content">

                            <!-- TABS -->
                            <ul class="nav nav-tabs" id="myTab" role="tablist">

                                <li class="nav-item">
                                    <a class="nav-link btn active" id="timeline-tab" data-toggle="tab" href="#timeline-tab-pane" role="tab" aria-controls="timeline-tab-pane" aria-expanded="true">Timeline</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link btn" id="about-tab" data-toggle="tab" href="#about-tab-pane" role="tab" aria-controls="about-tab-pane">About</a>
                                </li>
                                <!--
                                <li class="nav-item">
                                    <a class="nav-link btn" id="photos-videos-tab" data-toggle="tab" href="#photos-videos-tab-pane" role="tab" aria-controls="photos-tab-pane">Photos & Videos</a>
                                </li>-->
                            </ul>

                            <div class="tab-content">


                                <!-- TAB TIMELINE USER -->
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
                                                  <div class="divider my-8" id="time-line-insert" name="userTimeLine" ></div>

                                                  <!-- SEE MORE -->
                                                  <button type="button" onclick="seeMore()" class="post-comment-button btn btn-sm btn-secondary"  aria-label="see_more">
                                                    <span>
                                                      .. See more ..
                                                    <span>
                                                  </button>


                                      </div>
                                      <!-- / POST's -->

                                    </div>
                                </div>


                                <!-- TAB INFO -->
                                <div class="tab-pane fade" id="about-tab-pane" role="tabpanel" aria-labelledby="about-tab">

                                    <div class="row">

                                        <div class="about col-12 col-md-7 col-xl-9">

                                            <!-- GENERAL INFO -->
                                            <div class="profile-box info-box general card mb-4">

                                                <header class="h6 bg-secondary text-auto p-4">
                                                    <div class="title">General Information</div>
                                                </header>

                                                <div class="content p-4">

                                                    <div class="info-line mb-6">
                                                        <div class="title font-weight-bold mb-1">Sex</div>
                                                        <div class="info"><c:out value="${sex}"/></div>
                                                    </div>

                                                    <div class="info-line mb-6">
                                                        <div class="title font-weight-bold mb-1">Birthday</div>
                                                        <div class="info"><c:out value="${dateBirthday}"/></div>
                                                    </div>

                                                    <div class="info-line mb-6">
                                                        <div class="title font-weight-bold mb-1">Locations</div>

                                                        <div class="info location">
                                                            <span><c:out value="${city}"/>, <c:out value="${country}"/></span>
                                                            <i class="icon-map-marker s-4"></i>
                                                        </div>

                                                    </div>

                                                    <div class="info-line">
                                                        <div class="title font-weight-bold mb-1">About Me</div>
                                                        <div class="info"><c:out value="${about}"/></div>
                                                    </div>

                                                </div>
                                            </div>

                                            <!-- WORK INFO -->
                                            <div class="profile-box info-box work card mb-4">

                                                <header class="h6 bg-secondary text-auto p-4">
                                                    <div class="title">Work</div>
                                                </header>

                                                <div class="content p-4">

                                                    <div class="info-line mb-6">
                                                        <div class="title font-weight-bold mb-1">Type work</div>
                                                        <div class="info"><c:out value="${typeWork}"/></div>
                                                    </div>


                                                    <div class="info-line mb-6">
                                                        <div class="title font-weight-bold mb-1">Start in Company</div>
                                                        <table class="info jobs">

                                                            <tr class="job">
                                                                <td class="date"><c:out value="${dateStartInCompany}"/></td>
                                                            </tr>

                                                        </table>
                                                    </div>

                                                </div>
                                            </div>

                                            <!-- CONTACTS -->
                                            <div class="profile-box info-box contact card mb-4">

                                                <header class="h6 bg-secondary text-auto p-4">
                                                    <div class="title">Contact</div>
                                                </header>

                                                <div class="content p-4">

                                                    <div class="info-line mb-6">
                                                        <div class="title font-weight-bold mb-1">Address</div>
                                                        <div class="info"><c:out value="${address}"/>, <c:out value="${city}"/></div>
                                                    </div>

                                                    <div class="info-line mb-6">
                                                        <div class="title font-weight-bold mb-1">Phone number</div>

                                                        <div class="info">
                                                            <span><c:out value="${phoneNumber}"/></span>
                                                        </div>

                                                    </div>

                                                    <div class="info-line mb-6">
                                                        <div class="title font-weight-bold mb-1">Email</div>

                                                        <div class="info" ng-repeat="email in vm.about.contact.emails">
                                                            <span><c:out value="${email}"/></span>
                                                        </div>

                                                    </div>

                                                </div>
                                            </div>

                                        </div>

                                        <!--
                                        <div class="about-sidebar col-12 col-md-5 col-xl-3">

                                            <div class="profile-box friends card mb-4">

                                                <header class="row no-gutters align-items-center justify-content-between bg-secondary text-auto p-4">
                                                    <div class="title h6">Friends</div>
                                                    <div class="more text-muted">
                                                        <span>See</span>
                                                        <span>454</span>
                                                        <span>More</span>
                                                    </div>
                                                </header>

                                                <div class="content row no-gutters p-4">

                                                    <div class="friend col-3 p-1">
                                                        <img class="w-100" src="../assets/images/avatars/garry.jpg">
                                                    </div>

                                                    <div class="friend col-3 p-1">
                                                        <img class="w-100" src="../assets/images/avatars/carl.jpg">
                                                    </div>

                                                    <div class="friend col-3 p-1">
                                                        <img class="w-100" src="../assets/images/avatars/jane.jpg">
                                                    </div>

                                                    <div class="friend col-3 p-1">
                                                        <img class="w-100" src="../assets/images/avatars/garry.jpg">
                                                    </div>

                                                    <div class="friend col-3 p-1">
                                                        <img class="w-100" src="../assets/images/avatars/vincent.jpg">
                                                    </div>

                                                    <div class="friend col-3 p-1">
                                                        <img class="w-100" src="../assets/images/avatars/alice.jpg">
                                                    </div>

                                                    <div class="friend col-3 p-1">
                                                        <img class="w-100" src="../assets/images/avatars/andrew.jpg">
                                                    </div>

                                                </div>

                                            </div>

                                            <div class="profile-box groups card mb-4">

                                                <header class="row no-gutters align-items-center justify-content-between bg-secondary text-auto p-4">
                                                    <div class="title h6">Joined Groups</div>
                                                    <div class="more text-muted">
                                                        <span>See</span>
                                                        <span>6</span>
                                                        <span>More</span>
                                                    </div>
                                                </header>

                                                <div class="content p-4">

                                                    <div class="group row no-gutters align-items-center justify-content-between mb-4">

                                                        <div class="col">

                                                            <div class="row no-gutters align-items-center">

                                                                <img class="logo col-auto mr-4" src="../assets/images/logos/android.png" alt="Android" />

                                                                <div class="col">
                                                                    <div class="name">Android</div>
                                                                    <div class="category">Technology</div>
                                                                    <div class="members mt-4">1.856.546 people</div>
                                                                </div>

                                                            </div>
                                                        </div>

                                                        <div class="col-auto">
                                                            <button type="button" class="btn btn-icon" aria-label="more">
                                                                <i class="icon icon-dots-vertical"></i>
                                                            </button>
                                                        </div>

                                                    </div>

                                                    <div class="group row no-gutters align-items-center justify-content-between mb-4">

                                                        <div class="col">

                                                            <div class="row no-gutters align-items-center">

                                                                <img class="logo col-auto mr-4" src="../assets/images/logos/google.png" alt="Google" />

                                                                <div class="col">
                                                                    <div class="name">Google</div>
                                                                    <div class="category">Web</div>
                                                                    <div class="members mt-4">1.226.121 people</div>
                                                                </div>

                                                            </div>
                                                        </div>

                                                        <div class="col-auto">
                                                            <button type="button" class="btn btn-icon" aria-label="more">
                                                                <i class="icon icon-dots-vertical"></i>
                                                            </button>
                                                        </div>

                                                    </div>

                                                    <div class="group row no-gutters align-items-center justify-content-between mb-4">

                                                        <div class="col">

                                                            <div class="row no-gutters align-items-center">

                                                                <img class="logo col-auto mr-4" src="../assets/images/logos/fallout.png" alt="Fallout" />

                                                                <div class="col">
                                                                    <div class="name">Fallout</div>
                                                                    <div class="category">Games</div>
                                                                    <div class="members mt-4">526.142 people</div>
                                                                </div>

                                                            </div>
                                                        </div>

                                                        <div class="col-auto">
                                                            <button type="button" class="btn btn-icon" aria-label="more">
                                                                <i class="icon icon-dots-vertical"></i>
                                                            </button>
                                                        </div>

                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                      -->
                                    </div>
                                </div>

                            </div>

                        </div>
                        <!-- / CONTENT -->
                    </div>

                </div>
            </div>


            <!--<div class="quick-panel-sidebar custom-scrollbar" fuse-cloak data-fuse-bar="quick-panel-sidebar" data-fuse-bar-position="right">
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

        </div>
    </main>
</body>

</html>


</c:otherwise>
</c:choose>
