<br><br><br>
<div class="bs-docs-section">
        <div class="row">
	<?php $this->renderPartial('flashmessage'); ?>
        </div>
        <div class="row-fluid">
          
         <div class="pull-right">
            <a href="<?= URL::base_uri(); ?>report/excel/download"><i class="glyphicon glyphicon-share-alt"></i><?= $this->lang['download']; ?></a>
            &nbsp;
            <a href="<?= URL::base_uri(); ?>report/excel/remove" onClick="return confirm('<?= $this->lang['areyousure']; ?>');"><i class="glyphicon glyphicon-fire"></i><?= $this->lang['clear']; ?></a>                 
         </div>
           
          <div class="span4">
             <h2><?= $this->lang['managedata']; ?></h2>
             <table class="table table-hover">
              <?php if ($this->datas == false): ?>
              <p><?= $this->lang['nodatayet']; ?></p>
              <?php else: ?>
              <thead>
                <tr>
                  <?php foreach ($this->datas[0] as $property => $data): ?>
                  <th><?= ucfirst($property); ?></th>
                  <?php endforeach; ?>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($this->datas as $key => $list): ?>
                <tr>
                  <?php foreach ($list as $property => $data): ?>
                  <td><?= $data ?></td>
                  <?php endforeach; ?>
                  <td>
                      <a href="<?= URL::base_uri(); ?>admin/data/<?= $list->id; ?>"><i class="glyphicon glyphicon-file"></i><?= $this->lang['view']; ?></a>
                      &nbsp;
                      <a href="<?= URL::base_uri(); ?>admin/data/<?= $list->id; ?>/delete" onclick="return confirm(<?= $this->lang['areyousure']; ?>)"><i class="glyphicon glyphicon-remove"></i><?= $this->lang['delete']; ?></a>
                      &nbsp;
                      <a href="<?= URL::base_uri(); ?>report/generate/<?= $list->id; ?>/<?= $this->langcode; ?>"><i class="glyphicon glyphicon-circle-arrow-down"></i><?= $this->lang['generatereport']; ?></a>
                  </td>
                </tr>
                <?php endforeach; ?>
              </tbody>
              <?php endif; ?>
            </table>
          </div>
        </div>
      </div>
