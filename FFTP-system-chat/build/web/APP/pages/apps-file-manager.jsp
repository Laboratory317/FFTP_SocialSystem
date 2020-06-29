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
    <title>FFTP | File Manager</title>
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
    <!-- StatusChanger JS -->
    <script type="text/javascript" src="../assets/vendor/userActive/script-statusChanger.js"></script>
    <!-- File manager main control - coloring...  -->
    <script type="text/javascript" src="../assets/js/apps/file-manager/file-manager.js"></script>
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
                              <a class="nav-link ripple" href="apps-chat.jsp" data-url="apps-chat.jsp">

                                  <i class="icon s-4 icon-hangouts"></i>
                                  <span>Chat</span>
                              </a>
                          </li>

                          <!-- FILE MANAGER -->
                          <li class="nav-item">
                              <a class="nav-link ripple active" href="apps-file-manager.jsp" data-url="apps-file-manager.jsp">
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

                              <button type="button" class="quick-panel-button btn btn-icon" data-fuse-bar-toggle="quick-panel-sidebar">
                                  <i class="icon icon-format-list-bulleted"></i>
                              </button>
                          </div>

                        </div>
                    </div>
                </nav>
                <div class="content custom-scrollbar">

                    <div id="file-manager" class="page-layout simple right-sidebar">

                        <!-- tree nav file -->
                        <aside class="page-sidebar custom-scrollbar" data-fuse-bar="file-manager-info-sidebar" data-fuse-bar-position="left" data-fuse-bar-media-step="lg"
                          style="background: #252B3A; color: white;" >

                            <!-- HEADER -->
                            <div class="header bg-secondary text-auto d-flex flex-column justify-content-between p-6">

                                <!-- TOOLBAR -->
                                <div class="toolbar row no-gutters align-items-center justify-content-end">

                                    <button type="button" class="btn btn-icon">
                                        <i class="icon icon-folder-plus"></i>
                                    </button>

                                    <button type="button" class="btn btn-icon">
                                        <i class="icon icon-folder-remove"></i>
                                    </button>

                                    <button type="button" class="btn btn-icon">
                                        <i class="icon icon-download"></i>
                                    </button>

                                    <button type="button" class="btn btn-icon">
                                        <i class="icon icon-git"></i>
                                    </button>

                                </div>
                                <!-- / TOOLBAR -->

                                <!-- INFO -->
                                <div>
                                    <div class="title mb-2">Directory /</div>
                                    <div class="subtitle text-muted">
                                        <span>Latest version</span>
                                        :  1 April, 2018
                                    </div>
                                </div>
                                <!-- / INFO-->

                            </div>
                            <!-- / HEADER -->

                            <!-- CONTENT -->
                            <div class="content" >

                                <div class="file-details">
                                <style>
                                  .nav-link {
                                    color: white;
                                  }
                                  #file-manager .page-sidebar {
                                    width: 25rem;
                                  }
                                </style>

                                    <!--<div class="preview file-icon row no-gutters align-items-center justify-content-center">
                                        <i class="icon-folder s-12"></i>
                                    </div>-->

                                    <div class="title px-6 py-4">/</div>

                                    <ul class="nav flex-column custom-scrollbar" id="sidenav" data-children=".nav-item">

                                      <!-- FOLDER  SRC -->
                                      <li class="nav-item" role="tab">
                                          <a class="nav-link ripple with-arrow collapsed"   style=":hover{ color:white }; color: #eee" data-toggle="collapse" data-target="#folder-src" href="#" aria-expanded="false" aria-controls="collapse-dashboards">
                                              <i class="icon s-4 icon-folder" style="color: #FF9800"></i>
                                              <span>src/</span>
                                          </a>
                                          <ul id="folder-src" class='collapse'  role="tabpanel" aria-labelledby="heading-dashboards" data-children=".nav-item">

                                            <!-- FOLDER -->
                                            <li class="nav-item">
                                                <a class="nav-link ripple with-arrow collapsed"  style=":hover{ color:white }; color: #eee" data-toggle="collapse" data-target="#folder-dao-package" href="#" aria-expanded="false" aria-controls="collapse-dashboards">
                                                    <i class="icon  s-4 icon-tile-four"  style="color: #FF9800"></i>
                                                    <span>dao.package</span>
                                                </a>
                                                <ul id="folder-dao-package" class='collapse' role="tabpanel" aria-labelledby="heading-dashboards" data-children=".nav-item">
                                                    <!-- FILE -->
                                                    <li class="nav-item">
                                                        <a class="nav-link ripple" href="#" style=":hover{ color:white }; color: #eee">
                                                            <i class="icon s-4 icon-code-tags" style="color: white"></i>
                                                            <span>dataAcess.java </span>
                                                        </a>
                                                    </li>

                                                </ul>
                                            </li>

                                            <!-- FOLDER -->
                                            <li class="nav-item">
                                                <a class="nav-link ripple" href="#" style=":hover{ color:white }; color: #eee">
                                                    <i class="icon s-4 icon-tile-four" style="color: gray" ></i>
                                                    <span>servlet.package</span>
                                                </a>
                                            </li>

                                          </ul>
                                      </li>

                                      <!-- FILE  -->
                                      <li class="nav-item">
                                          <a class="nav-link ripple" href="#" style=":hover{ color:white }; color: #eee">
                                              <i class="icon file s-4 icon-file-xml" style="color: white"></i>
                                              <span>porn.xml</span>
                                          </a>
                                      </li>

                                      <!-- FILE  -->
                                      <li class="nav-item">
                                          <a class="nav-link ripple" href="#" style=":hover{ color:white }; color: #eee">
                                              <i class="icon file s-4 icon-file" style="color: white"></i>
                                              <span>Read_Me.md</span>
                                          </a>
                                      </li>

                                    </ul>
                                </div>
                            </div>
                            <!-- / CONTENT -->
                        </aside>

                        <!-- Right - page with file -->
                        <div class="page-content-wrapper custom-scrollbar">
                          <div class="doc forms-doc page-layout simple full-width">


                                <!-- CONTENT -->
                                <div class="page-content p-6">
                                    <div class="content container">
                                        <div class="row">

                                          <!-- INFORMATION -->
                                          <div class="col-12">
                                            <div class="example">
                                              <div class="description">
                                                <div class="description-text">
                                                  <h5> <i class="icon icon-folder"></i> Information </h5>
                                                </div>
                                              </div>

                                                <div class="source-preview-wrapper">
                                                        <div class="preview">
                                                            <div class="preview-elements">
                                                              <div class="description-text">

                                                                <h6>Project name: Tomov-project </h6>

                                                                <ul class="list-group">
                                                                  <li class="list-group-item subheader align-with-text">-- Authors --</li>

                                                                  <li class="list-group-item">
                                                                    <div class="avatar">
                                                                      <img src="assets/images/avatars/">
                                                                    </div>

                                                                    <div class="list-item-content">
                                                                      <a href="pages-profile.jsp?Georgi_Chakarov" style="text-decoration: none;">Georgi Chakarov</a>
                                                                    </div>

                                                                  </li>

                                                                  <li class="list-group-item">
                                                                    <div class="avatar">
                                                                      <img src="assets/images/avatars/">
                                                                    </div>
                                                                    <div class="list-item-content">
                                                                      <a href="pages-profile.jsp?Velizar_Kunov" style="text-decoration: none;">Velizar Kunov</a>
                                                                    </div>
                                                                  </li>

                                                                </ul>
                                                              </div>
                                                            </div>
                                                        </div>
                                                </div>

                                            </div>
                                          </div>


                                            <!-- FORM GROUPS  icon-hexagon-multiple -->
                                            <div class="col-12">
                                                <div class="example">
                                                    <!-- directory -->
                                                    <div class="description">
                                                        <div class="description-text">
                                                            <h5> <i class="icon icon-file"></i> File:
                                                              <span style="color: gray">  src/ dao.package/ dataAcess.java </span>
                                                            </h5>
                                                        </div>
                                                        <div class="toggle-source-preview">
                                                            <i class="icon icon-code-tags"></i>
                                                            <i class="icon icon-close-circle-outline"></i>
                                                        </div>
                                                    </div>

                                                    <div class="source-preview-wrapper">
                                                        <!-- Argument -->
                                                        <div class="preview">
                                                            <div class="preview-elements">
                                                                <form>

                                                                    <div class="form-group">
                                                                        <input type="text" class="form-control" id="formGroupExampleInput" value="Тест код за попълване на формата от .ver файл, и за тестове - оцветяване на специфични думи." disabled>
                                                                        <label class="form-control-label" for="formGroupExampleInput">Argument:</label>
                                                                    </div>

                                                                </form>
                                                            </div>
                                                        </div>

                                                        <!-- Code -->
                                                        <div class="source custom-scrollbar" >
                                                            <div class="highlight">
                                                              <button id="button-copy">Copy</button>
                                                              <pre style="background-color:#fff;-moz-tab-size:4;-o-tab-size:4;tab-size:4">
                                                                <!-- JS for generate coloring text -->
                                                                <code   contenteditable="true" class="language-java" data-lang="java">
                                                                  <div id="editor" contenteditable="true">
                                                                  read from .ver file :

                                                                  package dao;
                                                                  public class dao{
                                                                    public static boolean getTrue(){
                                                                      return true;
                                                                    }
                                                                  }
                                                                  </div>
                                                               </code>
                                                            </pre>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <!-- / FORM GROUPS -->

                                            <!-- COMENTARS -->
                                            <div class="col-12">
                                              <div class="example">
                                                <div class="description">
                                                  <div class="description-text">
                                                    <h5> <i class="icon icon-forum"></i> Comentars </h5>
                                                  </div>
                                                </div>

                                                  <div class="source-preview-wrapper">
                                                          <div class="preview" style="background: #FAFAFA">
                                                              <div class="preview-elements" >

                                                                <div class="description-text" >
                                                                  <div class="comment row no-gutters mb-6">

                                                                      <img src="../assets/images/avatars/joyce.jpg" class="col-auto avatar mr-2" />

                                                                      <div class="col">

                                                                          <div class="row no-gutters align-items-center">
                                                                              <span class="username font-weight-bold mr-1">Alice </span>
                                                                              <span class="time text-muted">Aprlil 4, 2018</span>
                                                                          </div>

                                                                          <div class="message">
                                                                              Трябва да се направи оцветяването на специфичните думи с JS. За момента бъгва... и не иска да ги оцветява. Също така трябва да се оправи самото финдване на елемент(дума), понеже сега ако има скоба до него няма да го различи.
                                                                          </div>

                                                                          <div class="actions row no-gutters align-items-center justify-content-start">
                                                                              <a href="#" class="reply-button">Reply</a>
                                                                          </div>
                                                                      </div>
                                                                  </div>

                                                                  <div class="reply row no-gutters" >

                                                                      <img src="../assets/images/avatars/" class="col-auto avatar mr-2" />

                                                                      <form class="col">
                                                                          <textarea class="p-2 mb-2 w-100" placeholder="Add a comment..."></textarea>
                                                                          <button type="button" class="post-comment-button btn btn-sm btn-secondary" aria-label="Post Comment">Post Comment</button>
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
                          </div>
                        </div>

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
