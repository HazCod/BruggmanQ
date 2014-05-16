<br><br><br>
<div class="bs-docs-section">
        <div class="row">
	<?php $this->renderPartial('flashmessage'); ?>
        </div>
        <div class="row-fluid">
          <div class="span4">
              <h2><?= $this->lang['newanswer']; ?></h2>
              <p class="lead"><?= $this->question->question; ?></p>
              <form method="post" action="<?= URL::base_uri(); ?>admin/answers/<?= $this->question; ?>/add">
                <div class="form-group">
                    <textarea class="form-control" name="descr" id="descr" rows="6" placeholder="<?= $this->lang['answerdescr']; ?>"><?php if ($this->formdata){ echo $this->formdata->descr; } ?></textarea>
                </div><!-- /input-group -->
                
                <div style="display:none;"> <!-- hidden textfield, generated automatically -->
                    <input type="text" id="nr" name="nr" value="<?= sizeof($this->answers); ?>" />
                </div><!-- /input-group -->
                    
                <button class="btn btn-default" type="submit"><?= $this->lang['next']; ?></button>
              </form>
          </div>
        </div>
      </div>