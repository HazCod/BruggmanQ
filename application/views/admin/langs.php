<br><br><br>
<div class="bs-docs-section">
        <div class="row">
	<?php $this->renderPartial('flashmessage'); ?>
        </div>
        <div class="row-fluid">
          <div class="span4">
             <h2><?= $this->lang['langs']; ?></h2>
             <div class="pull-right">
                <button type="button" class="btn btn-default">
                    <a href="<?= URL::base_uri() . 'admin/langs/add' ?>"><span class="glyphicon glyphicon-plus"></span> <?= $this->lang['addlang']; ?></a>
                </button>
             </div>
             <table class="table table-hover">
              <?php if ($this->langs == false): ?>
              <p><?= $this->lang['nolangsyet']; ?></p>
              <?php else: ?>
              <thead>
                <tr>
                  <?php foreach ($this->langs[0] as $property => $data): ?>
                  <th><?= ucfirst($property); ?></th>
                  <?php endforeach; ?>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($this->langs as $key => $lang): ?>
                <tr>
                  <?php foreach ($lang as $property => $data): ?>
                  <td>
                  <?php if ($property == 'flag'): ?>
                  <img src="<?= URL::base_uri() . 'img/flags/' . $data . '.png'; ?>" alt="<?= $lang->name ?>" />
                  <?php else: ?>
                  <?= $data ?>
                  <?php endif; ?>
                  </td>
                  <?php endforeach; ?>
                  <td>
                      <a href="<?= URL::base_uri(); ?>admin/langs/delete/<?= $lang->id; ?>"><i class="glyphicon glyphicon-remove"></i><?= $this->lang['delete']; ?></a>
                  </td>
                </tr>
                <?php endforeach; ?>
              </tbody>
              <?php endif; ?>
            </table>
          </div>
        </div>
      </div>
