<br><br><br>
<div class="bs-docs-section">
        <div class="row">
	<?php $this->renderPartial('flashmessage'); ?>
        </div>
        <div class="row-fluid">
          <div class="span4">
              <h2><?= $this->lang['addlang']; ?></h2>
              <form method="post" action="<?= URL::base_uri(); ?>admin/langs/add">
                <div class="form-group">
                    <label for="name"><?= $this->lang['name']; ?></label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="<?= $this->lang['name']; ?>" value="<?php if ($this->formdata){ echo $this->formdata->name; } ?>">
                </div><!-- /input-group -->
                
                <div class="input-group">
                    <label for="name"><?= $this->lang['flagcode']; ?></label>
                    <input type="text" class="form-control" id="flag" name="flag" placeholder="<?= $this->lang['flagcodedescr']; ?>" value="<?php if ($this->formdata){ echo $this->formdata->flag; } ?>">
                </div><!-- /input-group -->
                
                <button class="btn btn-primary" type="submit"><?= $this->lang['add']; ?></button>
              </form>
          </div>
        </div>
      </div>
