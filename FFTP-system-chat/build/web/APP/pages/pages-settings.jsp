
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="obj_user" scope="session" value="${ sessionScope.user }"/>
<c:choose>
  <c:when test="${ obj_user == null }">
    <c:redirect url = "login.jsp"/>
  </c:when>
  <c:otherwise>

    <c:set var="firstName" scope="session" value="${obj_user.getFirstName()}" />
    <c:set var="lastName"  scope="session" value="${obj_user.getLastName() }" />
    <c:set var="about"     scope="session" value="${obj_user.getAbout()    }" />
    <c:set var="bd"        scope="session" value="${obj_user.getBd()       }" />

    <c:set var="typeWork"  scope="session" value="${obj_user.getTypeWork() }" />
    <c:set var="country"   scope="session" value="${obj_user.getCountry()  }" />
    <c:set var="city"      scope="session" value="${obj_user.getCity()     }" />
    <c:set var="address"   scope="session" value="${obj_user.getAddress()  }" />
    <c:set var="username"  scope="session" value="${obj_user.getUsername() }" />
    <c:set var="email"     scope="session" value="${obj_user.getEmail()    }" />

    <c:set var="phoneNumber"           scope="session" value="${obj_user.getPhoneNumber()         }" />
    <c:set var="date-start-in-company" scope="session" value="${obj_user.getDate_startInCompany() }" />
    <c:set var="profilePicture"        scope="session" value="${obj_user.getProfilePicture()      }" />

    <c:set var="privileg"              scope="session" value="${typeWork.equals('programer') ? 'disabled': 'enabled'     }" />

<!DOCTYPE html>
<html lang="en-us">

<head>
    <title>FFTP | Settings</title>
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
    <!-- Fuse Html -->
    <script type="text/javascript" src="../assets/vendor/fuse-html/fuse-html.min.js"></script>
    <!-- Settings JS -->
    <script type="text/javascript" src="../assets/vendor/settings-page/settings-page-script.js"></script>
    <!-- StatusChanger JS -->
    <script type="text/javascript" src="../assets/vendor/userActive/script-statusChanger.js"></script>
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
                                      <a class="nav-link ripple" href="pages-profile.jsp" data-url="pages-profile.jsp">
                                          <span>Profile</span>
                                      </a>
                                  </li>
                                  <li class="nav-item">
                                      <a class="nav-link ripple active" href="pages-settings.jsp" data-url="pages-settings.jsp">
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
                </nav>
                <div class="content custom-scrollbar">

                  <div class="doc forms-doc page-layout simple full-width">

                        <!-- HEADER -->
                        <div class="page-header bg-secondary text-auto p-6 row no-gutters align-items-center justify-content-between">
                            <h2 class="doc-title" id="content">Settings</h2>
                        </div>
                        <!-- / HEADER -->

                        <!-- CONTENT -->
                        <div class="page-content p-6">
                            <div class="content container">
                                <div class="row">

                                    <!-- GENERAL CONFIG -->
                                    <div class="col-12 col-md-6">
                                        <div class="example">
                                            <div class="description">
                                                <div class="description-text">
                                                    <h5>General config</h5>
                                                </div>

                                            </div>

                                            <div class="source-preview-wrapper">
                                                <div class="preview">
                                                    <div class="preview-elements">
                                                        <form onsubmit="return false; submit($(this))">

                                                            <img class="profile-image avatar huge mr-6"  src="../assets/images/avatars/<c:out value="${profilePicture}"/> " />

                                                            <div class="form-group">
                                                                <input type="file" accept=".png, .jpg" class="custom-file-input" id="profilePicture" onchange="uploadPicture($(this));"  oninput="this.onchange();">
                                                                <label class="custom-file-label" for="picture">new profilePicture</label>
                                                            </div>

                                                            <div class="form-group">
                                                                <input type="text" class="form-control is-valid" id="firstName" name="firstName" value="<c:out value="${firstName}"/>" onchange="eventChanges($(this));"  oninput="this.onchange();" <c:out value="${privileg}"/> />
                                                                <label for="input_firstName">First name</label>
                                                            </div>

                                                            <div class="form-group">
                                                                <input type="text" class="form-control is-valid" id="lastName" value="<c:out value="${lastName}"/>" onchange="eventChanges($(this));"  oninput="this.onchange();" <c:out value="${privileg}"/> />
                                                                <label for="input_lastName">Last name</label>
                                                            </div>

                                                            <div class="form-group">
                                                              <input type="text" class="form-control is-valid" id="sex"  value="<c:out value="${obj_user.getSex() == true ? 'Female': 'Male'}"/>" onchange="eventChanges($(this));"  oninput="this.onchange();" <c:out value="${privileg}"/> />
                                                              <label for="input_sex">Sex</label>
                                                            </div>

                                                            <div class="form-group">
                                                              <input class="form-control is-valid" type="date" id="bd" value="<c:out value="${bd}"/>" onchange="eventChanges($(this));" oninput="this.onchange();" <c:out value="${privileg}"/>/>
                                                              <label for="birthday_date">Birthday date</label>
                                                            </div>

                                                            <div class="form-group">
                                                                <textarea class="form-control" id="aboutMe" rows="3" onchange="eventChanges($(this));"  oninput="this.onchange();"><c:out value="${about}"/></textarea>
                                                                <label for="exampleFormControlTextarea1">About me</label>
                                                            </div>

                                                            <button  class="btn btn-primary" disabled>SAVE</button>
                                                        </form>

                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <!-- / GENERAL CONFIG -->

                                    <!-- CONTACT CONFIG -->
                                    <div class="col-12 col-md-6">
                                        <div class="example">
                                            <div class="description">
                                                <div class="description-text">
                                                    <h5>Contacts config</h5>
                                                </div>
                                            </div>

                                            <div class="source-preview-wrapper">
                                                <div class="preview">
                                                    <div class="preview-elements">
                                                      <form>

                                                        <div class="form-group">
                                                            <input type="text" class="form-control is-valid" id="typeWork" value="<c:out value="${typeWork}"/>" style="bow-shadow: 0 1px 0 0 #2196F3" onchange="eventChanges($(this));"  oninput="this.onchange();" <c:out value="${privileg}"/> >
                                                            <label for="input_typeWork">Type work</label>
                                                        </div>

                                                        <div class="form-group">
                                                          <input class="form-control is-valid" type="date" value="<c:out value="${date-start-in-company}"/>" id="date_startInCompany" onchange="eventChanges($(this));"  oninput="this.onchange();" <c:out value="${privileg}"/> />
                                                          <label for="date-start-in-company">Date start in company</label>
                                                        </div>

                                                        <div class="form-group">
                                                            <input class="form-control" type="tel" value="<c:out value="${phoneNumber}"/>" id="phoneNumber" onchange="eventChanges($(this));"  oninput="this.onchange();" />
                                                            <label for="tel-input">Telephone</label>
                                                        </div>

                                                        <div class="form-group">
                                                            <input type="text" class="form-control " id="country" value="<c:out value="${country}"/>"  onchange="eventChanges($(this));"  oninput="this.onchange();">
                                                            <label for="input-country">Country</label>
                                                        </div>


                                                        <div class="form-group">
                                                          <input class="form-control" type="text" value="<c:out value="${city}"/>" id="city" onchange="eventChanges($(this));"  oninput="this.onchange();" />
                                                          <label for="city">City</label>
                                                        </div>

                                                        <div class="form-group">
                                                          <input class="form-control" type="text" value="<c:out value="${address}"/>" id="address" onchange="eventChanges($(this));"  oninput="this.onchange();" />
                                                          <label for="address">Address</label>
                                                        </div>

                                                        <button type="submit" class="btn btn-primary"  disabled>SAVE</button>
                                                    </form>
                                                  </div>
                                              </div>

                                            </div>
                                        </div>
                                    </div>
                                    <!-- / CONTACT CONFIG -->

                                    <div class="col-12">
                                        <h2 id="form-layouts">
                                          <i class="icon icon-email"></i>
                                          Email
                                        </h2>
                                    </div>

                                    <div class="col-12">
                                        <div class="example">
                                            <div class="description">
                                                <div class="description-text">
                                                    <h5>Email config </h5>
                                                </div>
                                            </div>

                                            <div class="source-preview-wrapper">
                                                <div class="preview">
                                                    <div class="preview-elements">

                                                      <form >
                                                        <div class="form-row align-items-center">

                                                          <div class="col-auto">
                                                            <label class="sr-only" for="inlineFormInput">Name</label>
                                                            <input type="text" class="form-control mb-2 mb-sm-0" id="input_email_name" placeholder="<c:out value="${email.split('@')[0]}"/>" >
                                                          </div>

                                                          <div class="col-auto">
                                                            <label class="sr-only" for="inlineFormInputGroup">host</label>
                                                            <div class="input-group mb-2 mb-sm-0">
                                                              <div class="input-group-addon">@</div>
                                                              <input type="text" class="form-control" placeholder="<c:out value="${email.split('@')[1]}"/>" id="input_email_host" >
                                                            </div>
                                                          </div>

                                                          <div class="form-group">
                                                              <label for="input_password" class="sr-only">Password</label>
                                                              <input type="text" readonly class="form-control-plaintext" value="Email password" >
                                                          </div>

                                                          <div class="form-group mx-sm-3">
                                                              <label for="input_newPassword" class="sr-only">Password</label>
                                                              <input type="password" class="form-control" id="input_email_newPassword" placeholder="new password" >
                                                          </div>

                                                          <div class="col-auto">
                                                            <button type="submit" class="btn btn-primary">SAVE</button>
                                                          </div>

                                                        </div>
                                                      </form>


                                                    </div>
                                                </div>
                                           </div>

                                        </div>
                                    </div>



                                    <div class="col-12">
                                        <h2 id="form-layouts">
                                          <i class="icon icon-server-security"></i>
                                          Security
                                        </h2>
                                    </div>

                                    <div class="col-12">
                                        <div class="example">
                                            <div class="description">
                                                <div class="description-text">
                                                    <h5>Authentication config</h5>
                                                </div>
                                            </div>

                                            <div class="source-preview-wrapper">
                                                <div class="preview">
                                                    <div class="preview-elements">
                                                      <form>
                                                        <!-- USERNAME FORM  -->
                                                        <div class="form-group row">
                                                            <div class="form-group">
                                                                <label for="input_username" class="sr-only">Username</label>
                                                                <input type="text" readonly class="form-control-plaintext" value="Username">
                                                            </div>

                                                            <div class="form-group mx-sm-3">
                                                                <label for="input_newUsername" class="sr-only">Username</label>
                                                                <input type="text" class="form-control" id="input_newUsername" value="<c:out value="${username}"/>"  >
                                                            </div>
                                                        </div>

                                                        <!--  PASSWORD FORM  -->
                                                        <div class="form-group row">

                                                            <div class="form-group">
                                                                <label for="input_password" class="sr-only">Password</label>
                                                                <input type="text" readonly class="form-control-plaintext" value="Password">
                                                            </div>

                                                            <div class="form-group mx-sm-3">
                                                                <label for="input_newPassword" class="sr-only">Password</label>
                                                                <input type="password" class="form-control" id="input_newPassword" placeholder="New password"  >
                                                            </div>

                                                            <div class="form-group mx-sm-3" >
                                                                <label for="input_newPassword2" class="sr-only">Password</label>
                                                                <input type="password" class="form-control" id="input_newPassword2" placeholder="Confirm password" >
                                                                <div class="invalid-feedback">
                                                                      Must be at least 15 characters as well as small and large letter, special symbol, and numbers!
                                                                </div>
                                                            </div>

                                                        </div>

                                                        <!-- SAVE BUTTON -->
                                                        <div class="form-group row">
                                                          <div class="col-sm-10">
                                                            <button type="submit" class="btn btn-primary" >SAVE</button>
                                                          </div>
                                                        </div>
                                                        <!-- / SAVE BUTTON -->
                                                      </form>
                                                    </div>
                                                </div>
                                           </div>

                                        </div>
                                    </div>


                              </div>
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

        </div>
    </main>
</body>

</html>


</c:otherwise>
</c:choose>
