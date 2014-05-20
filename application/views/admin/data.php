<br><br><br>
<div class="bs-docs-section">
        <div class="row">
	<?php $this->renderPartial('flashmessage'); ?>
        </div>
        <div class="row-fluid">
          <div class="span4">
             <h2><?= $this->lang['managedata']; ?></h2>
             <table class="table table-hover">
              <?php if ($this->data == false): ?>
              <p><?= $this->lang['nodatayet']; ?></p>
              <?php else: ?>
              <thead>
                <tr>
                  <?php foreach ($this->data[0] as $property => $data): ?>
                  <th><?= ucfirst($property); ?></th>
                  <?php endforeach; ?>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($this->data as $key => $list): ?>
                <tr>
                  <?php foreach ($list as $property => $data): ?>
                  <td><?= $data ?></td>
                  <?php endforeach; ?>
                  <td>
                      <a href="<?= URL::base_uri(); ?>admin/data/<?= $list->userid; ?>/"><i class="glyphicon glyphicon-file"></i><?= $this->lang['pages']; ?></a>
                      &nbsp;
                      <a href="<?= URL::base_uri(); ?>admin/data/<?= $list->userid; ?>/delete"><i class="glyphicon glyphicon-remove"></i><?= $this->lang['delete']; ?></a>
                  </td>
                </tr>
                <?php endforeach; ?>
              </tbody>
              <?php endif; ?>
            </table>
          </div>
        </div>
      </div>
