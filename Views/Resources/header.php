<?php

  if ($viewType == 10) {
      $view = "./Views/Resources/body.php";
  } else {
      $view = "../Resources/body.php";
  }
        
?>


<nav class="navbar bg-body-tertiary fixed-top background-color-betplay">
  <div class="container-fluid">
    <a class="navbar-brand text-white" href="#" id="titleHeader"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="offcanvas offcanvas-end background-color-betplay text-white" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasNavbarLabel"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
          <li class="nav-item">
            <a class="nav-link text-white active" aria-current="page" href="../../index.php">Home</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Clubes 
            </a>
            <ul class="dropdown-menu background-color-betplay">
              <li><a class="dropdown-item text-white identifier" href="<?= $view ?>?code=1" id="allClubs"></a></li>
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Campeonatos
            </a>
            <ul class="dropdown-menu background-color-betplay">
              <li><a class="dropdown-item text-white identifier" href="<?= $view ?>?code=2" id="championships"></a></li>
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Calendario
            </a>
            <ul class="dropdown-menu background-color-betplay">
              <li><a class="dropdown-item text-white identifier" href="<?= $view ?>?code=3" id="schedules"></a></li>
            </ul>
          </li>
          <li class="nav-item">
            <a class="nav-link text-white identifier" href="<?= $view ?>?code=4" id="stadistics"></a>
          </li>
        </ul>
        <form class="d-flex mt-3" role="search">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-light" type="submit">Search</button>
        </form>
      </div>
    </div>
  </div>
</nav>