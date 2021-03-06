<br><br><br>
<div class="bs-docs-section">
        <div class="row">
	<?php $this->renderPartial('flashmessage'); ?>
        </div>
        <div class="row-fluid">
          <div class="span4">
              <h2><?= $this->lang['addpage']; ?></h2>
              <form method="post" action="<?= URL::base_uri(); ?>admin/pages/<?= $this->list; ?>/add">
                <div class="form-group">
                    <textarea class="form-control" name="descr" id="descr" rows="6" placeholder="<?= $this->lang['pagedescr']; ?>"><?php if ($this->formdata){ echo $this->formdata->descr; } ?></textarea>
                </div><!-- /input-group -->
                
                <div style="display:none;"> <!-- hidden textfield, generated automatically -->
                    <input type="text" id="nr" name="nr" value="<? if ($this->pages == false){ echo '1'; } else { echo intval(sizeof($this->pages) +1); } ?>" />
                </div><!-- /input-group -->
                
                <div class="input-group">
                    <input type="text" class="form-control" id="pagename" name="pagename" placeholder="<?= $this->lang['pagetitle']; ?>" value="<?= $this->pagename; ?>">
                  <span class="input-group-btn">
                      <button class="btn btn-primary" type="submit"><?= $this->lang['next']; ?></button>
                  </span>
                </div><!-- /input-group -->
              </form>
          </div>
        </div>
      </div>