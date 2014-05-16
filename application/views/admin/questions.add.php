<br><br><br>
<div class="bs-docs-section">
        <div class="row">
	<?php $this->renderPartial('flashmessage'); ?>
        </div>
        <div class="row-fluid">
          <div class="span4">
              <h2><?= $this->lang['newquestion']; ?></h2>
              <form method="post" action="<?= URL::base_uri(); ?>admin/questions/<?= $this->page; ?>/add">
                <div class="form-group">
                    <textarea class="form-control" name="descr" id="descr" rows="6" placeholder="<?= $this->lang['questiondescr']; ?>"><?php if ($this->formdata){ echo $this->formdata->question; } ?></textarea>
                </div><!-- /input-group -->
                
                <div class="form-group">
                    <label for="type"><?= $this->lang['questiontype']; ?></label>
                    <select class="form-control" name="type" id="type">
                        <?php foreach ($this->types as $type => $data): ?>
                        <option value="<?= $data->id; ?>"><?= $data->type; ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                
                <div style="display:none;"> <!-- hidden textfield, generated automatically -->
                    <input type="text" id="nr" name="nr" value="<?= intval(sizeof($this->questions) +1); ?>" />
                </div><!-- /input-group -->
                    
                <button class="btn btn-default" type="submit"><?= $this->lang['next']; ?></button>
              </form>
          </div>
        </div>
      </div>