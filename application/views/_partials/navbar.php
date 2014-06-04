<?php
    function getLangName($arr, $code){
        $result = '';
        for ($i=0; $i < $arr and $result == ''; $i++){
            if ($arr[$i]->flag == $code){
                $result = $arr[$i]->name;
            }
        }
        return $result;
    }
?>
<div class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="<?= URL::base_uri();?>home"><img id="logo" src="<?= URL::base_uri(); ?>img/eye.png" />CHU Brugmann</a>
          <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div class="navbar-collapse collapse" id="navbar-main">
          <ul class="nav navbar-nav">
          <? foreach ($this->menuitems as $menuitem): ?>
            <? if (!is_array($menuitem['link'])): ?>
            <li class="<?= ($menuitem['link'] == URL::getCurrentPath()) ? 'active' : ''; ?>">
              <a href="<?= URL::base_uri(); ?><?= $menuitem['link']; ?>"><?= $menuitem['description']; ?></a>
            </li>
            <? else: ?>
            <li class="dropdown">
                <a href="" class="dropdown-toggle" data-toggle="dropdown"><?= $menuitem['description']; ?><b class="caret"></b></a>
                <ul class="dropdown-menu">
                <? foreach ($menuitem['link'] as $item): ?>
                    <li class="<?= ($item['link'] == URL::getCurrentPath()) ? 'active' : ''; ?>">
                      <a href="<?= URL::base_uri(); ?><?= $item['link']; ?>"><?= $item['description']; ?></a>
                    </li>
                <? endforeach; ?>
                </ul>
            </li>
            <? endif; ?>
          <? endforeach; ?>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <?php if (isset($_SESSION['admin'])): ?>
              <li><a href="<?= URL::base_uri(); ?>admin/index"><b>Administrator</b></a></li>
            <?php endif; ?>
            <li class="dropdown">
              <a href="" class="dropdown-toggle" data-toggle="dropdown"><img alt="<?= $_SESSION['lang']; ?>" src="<?= URL::base_uri(); ?>img/flags/<?= $_SESSION['lang']; ?>.png" />&nbsp;<?= getLangName($this->langs, $_SESSION['lang']); ?><b class="caret"></b></a>
              <ul class="dropdown-menu">
                <?php foreach ($this->langs as $key => $lang): ?>
                <li><a href="<?= URL::base_uri() .'home/index?lang=' . $lang->flag; ?>"><img alt="<?= $lang->name; ?>" src="<?= URL::base_uri(); ?>img/flags/<?= $lang->flag; ?>.png" />&nbsp;<?= $lang->name; ?></a></li>
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
