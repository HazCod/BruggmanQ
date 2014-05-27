<br>
<div class="bs-docs-section">
        <div class="row">
	<?php $this->renderPartial('flashmessage'); ?>
        </div>
        <div class="row-fluid">
          <div class="span4">
              <h2><?= $this->lang['report']; ?></h2>
              <p>
                  <?= $this->lang['reportgenerating']; ?>
              </p>
          </div>
            <div class="well">
                <p>
                    <?= $this->cmd; ?>
                </p>
                <pre>
                    <?= $this->output; ?>
                </pre>
            </div>
        </div>
      </div>
