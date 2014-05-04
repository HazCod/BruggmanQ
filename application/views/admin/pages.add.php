<br><br><br>
<div class="bs-docs-section">
        <div class="row">
	<?php $this->renderPartial('flashmessage'); ?>
        </div>
        <div class="row-fluid">
          <div class="span4">
              <h2><?= $this->lang['addpage']; ?></h2>
              <form method="post" action="<?= URL::base_uri(); ?>admin/pages/add">
                <div class="input-group">
                    <input type="text" class="form-control" id="listname" name="listname" placeholder="<?= $this->lang['pagetitle']; ?>" value="<?= $this->listname; ?>">
                  <span class="input-group-btn">
                      <button class="btn btn-default" type="submit"><?= $this->lang['add']; ?></button>
                  </span>
                </div><!-- /input-group -->
              </form>
          </div>
        </div>
      </div>
