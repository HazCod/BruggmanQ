<?php //Return the lang str when given the type id
    function getLangStr($arr, $typenr){
        $result = false;
        for ($i=0; $i < sizeof($arr) and $result == false; $i++){
            if ($arr[$i]->id == $typenr){
                $result = $arr[$i]->name;
            }
        }
        if ($result == false){
            $result = '???(' . $typenr . ')';
        }
        return $result;
    }
?>
<br><br><br>
<div class="bs-docs-section">
        <div class="row">
	<?php $this->renderPartial('flashmessage'); ?>
        </div>
        <div class="row-fluid">
          <div class="span4">
             <h2><?= $this->lang['lists']; ?></h2>
             <div class="pull-right">
                <button ype="button" class="btn btn-primary">
                    <a href="<?= URL::base_uri() . 'admin/lists/add' ?>"><span class="glyphicon glyphicon-plus"></span> <?= $this->lang['addlist']; ?></a>
                </button>
             </div>
             <table class="table table-hover">
              <?php if ($this->lists == false): ?>
              <p><?= $this->lang['nolistsyet']; ?></p>
              <?php else: ?>
              <thead>
                <tr>
                  <?php foreach ($this->lists[0] as $property => $data): ?>
                  <th><?= ucfirst($property); ?></th>
                  <?php endforeach; ?>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($this->lists as $key => $list): ?>
                <tr>
                  <?php foreach ($list as $property => $data): ?>
                  <td>
                  <?php if ($property == 'language'): ?>
                  <?= getLangStr($this->langs, $data); ?>
                  <?php else: ?>
                  <?= $data ?>
                  <?php endif; ?>
                  </td>
                  <?php endforeach; ?>
                  <td>
                      <a href="<?= URL::base_uri(); ?>admin/pages/<?= $list->id; ?>"><i class="glyphicon glyphicon-file"></i><?= $this->lang['pages']; ?></a>
                      &nbsp;
                      <a href="<?= URL::base_uri(); ?>admin/lists/delete/<?= $list->id; ?>"><i class="glyphicon glyphicon-remove"></i><?= $this->lang['delete']; ?></a>
                  </td>
                </tr>
                <?php endforeach; ?>
              </tbody>
              <?php endif; ?>
            </table>
          </div>
        </div>
      </div>
