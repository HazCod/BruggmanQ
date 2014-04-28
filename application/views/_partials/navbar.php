<?php
    function getLanguages(){
        return array("nl" => "Nederlands",
                     "fr" => "Français",
                     "en" => "English");
    }
?>
    <div class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="<?= URL::base_uri();?>home"><img id="logo" src="<?= URL::base_uri(); ?>img/eye.png" />CHU Bruggman</a>
          <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div class="navbar-collapse collapse" id="navbar-main">
          <ul class="nav navbar-nav">
          <? foreach ($this->menuitems as $menuitem): ?>
            <li class="<?= ($menuitem['link'] == URL::getCurrentPath()) ? 'active' : ''; ?>">
              <a href="<?= URL::base_uri(); ?><?= $menuitem['link']; ?>"><?= $menuitem['description']; ?></a>
            </li>
          <? endforeach; ?>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <?php if (isset($_SESSION['admin'])): ?>
              <li><a href="<?= URL::base_uri(); ?>admin/index"><b>Administrator</b></a></li>
            <?php endif; ?>
            <li class="dropdown">
              <a href="" class="dropdown-toggle" data-toggle="dropdown"><img alt="<?= $_SESSION['lang']; ?>" src="<?= URL::base_uri(); ?>img/flags/<?= $_SESSION['lang']; ?>.png" />&nbsp;<?php $langs = getLanguages(); echo $langs[$_SESSION['lang']]; ?><b class="caret"></b></a>
              <ul class="dropdown-menu">
                <?php foreach ($langs as $code => $lang): ?>
                <li><a href="<?= URL::base_uri() . URL::getCurrentPath() . '?lang=' . $code; ?>"><img alt="<?= $lang ?>" src="<?= URL::base_uri(); ?>img/flags/<?= $code; ?>.png" />&nbsp;<?= $lang ?></a></li>
                <?php endforeach; ?>
              </ul>
            </li>
            <?php if (isset($_SESSION['user']) || isset($_SESSION['admin'])): ?>        
            <li><a href="<?= URL::base_uri(); ?>home/logout">Logout</a></li>
            <?php endif; ?>
          </ul>
        </div>
      </div>
    </div>
