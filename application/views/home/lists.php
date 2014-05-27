<br><br><br>
<div class="bs-docs-section">
        <div class="row">
	<?php $this->renderPartial('flashmessage'); ?>
        </div>
        <div class="row-fluid">
          <div class="span4">
            <h1><?= $this->lang['picklist']; ?></h1>
            <div class="well">
                <ul>
              <?php foreach ($this->lists as $key => $list): ?>
                    <li><strong><a href="<?= URL::base_uri() . 'lists/index/' . $list->id; ?>"><?= $list->name; ?></a></strong></li>
               <?php endforeach; ?>
                </ul>
            </div>
          </div>

        </div>
      </div>
