<br><br><br>
<div class="bs-docs-section">
        <div class="row">
	<?php $this->renderPartial('flashmessage'); ?>
        </div>
        <div class="row-fluid">
          <div class="span4">
            <h1><?= $this->lang['hasended']; ?></h1>
            <div class="progress progress-striped active">
                <div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
                 <!--   <span><?= $this->lang['page']; ?> <?= $this->pagenr; ?>/<?= $this->pagestotal; ?></span> -->
                </div>
            </div>
            <div class="well">
                <p>
                    <?= $this->lang['thankyou   ']; ?>
                </p>
            </div>
          </div>

        </div>
      </div>
