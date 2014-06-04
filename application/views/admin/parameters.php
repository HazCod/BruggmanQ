<br>
<div class="bs-docs-section">
        <div class="row">
	<?php $this->renderPartial('flashmessage'); ?>
        </div>
        <div class="row-fluid">
          <div class="span4">
             <h2><?= $this->lang['parameters']; ?></h2>
             <div class="pull-right">
                <button ype="button" class="btn btn-primary">
                    <a href="<?= URL::base_uri() . 'admin/parameters/add' ?>"><span class="glyphicon glyphicon-plus"></span> <?= $this->lang['add']; ?></a>
                </button>
             </div>
             <table class="table table-hover">
              <?php if ($this->parameters == false): ?>
              <p><?= $this->lang['noparameters']; ?></p>
              <?php else: ?>
              <thead>
                <tr>
                    <th>Variable</th>
                    <th>RegEx</th>
                    <th>Norm</th>
                    <th>Std. dev</th>
                    <th>PSG</th>
                    <th></th>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($this->parameters as $nr => $line): ?>
                <?php if (trim($line) != ''): ?>
                <tr>
                  <?php $parts = explode("\t", $line); ?>
                  <?php foreach ($parts as $data): ?>
                  <td>
                      <?= trim($data); ?>
                  </td>
                  <?php endforeach; ?>
                  <td>
                      <a href="<?= URL::base_uri(); ?>admin/parameters/remove/<?= $nr; ?>"><i class="glyphicon glyphicon-remove"></i><?= $this->lang['delete']; ?></a>
                  </td>
                </tr>
                <?php endif; ?>
                <?php endforeach; ?>
              </tbody>
              <?php endif; ?>
            </table>
          </div>
        </div>
      </div>
