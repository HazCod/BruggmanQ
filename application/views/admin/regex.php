<br>
<div class="bs-docs-section">
        <div class="row">
	<?php $this->renderPartial('flashmessage'); ?>
        </div>
        <div class="row-fluid">
          <div class="span4">
              <h2><?= $this->lang['regextool']; ?></h2>
              <form method="post" action="<?= URL::base_uri(); ?>admin/tools/regex">
                <div class="form-group">
                    <label for="regex"><?= $this->lang['input']; ?></label>
                    <input type="text" class="form-control" id="regex" name="regex" placeholder="<?= $this->lang['input']; ?>" value="<?php if ($this->regex){ echo $this->regex; } ?>">
                </div><!-- /input-group -->
                <div class="form-group">
                    <label for="occurence"><?= $this->lang['occurence']; ?></label>
                    <input type="text" class="form-control" id="occurence" name="occurence" placeholder="1" value="<?php if ($this->occurence){ echo $this->occurence; } ?>">
                </div><!-- /input-group -->
                <div class="form-group">
                    <label for="norm"><?= $this->lang['norm']; ?></label>
                    <input type="text" class="form-control" id="norm" name="norm" placeholder="0" value="<?php if ($this->stddev){ echo $this->stddev; } ?>">
                </div><!-- /input-group -->
                <div class="form-group">
                    <label for="stddev"><?= $this->lang['stddev']; ?></label>
                    <input type="text" class="form-control" id="stddev" name="stddev" placeholder="0" value="<?php if ($this->norm){ echo $this->norm; } ?>">
                </div><!-- /input-group -->
                <div class="form-group">
                    <label for="excel"><?= $this->lang['addtoexcel']; ?></label>
                    <select class="form-control" name="excel">
                        <option value="1"><?= $this->lang['yes']; ?></option>
                        <option value="0"><?= $this->lang['no']; ?></option>
                    </select>
                </div><!-- /input-group -->
                
                <div class="well">
                    <label for="result"><?= $this->lang['result']; ?></label>
                    <textarea class="form-control" readonly="yes" name="result" id="result" rows="3"><?php if ($this->result){ echo $this->result; } ?></textarea>
                </div><!-- /input-group -->
                
                <button class="btn btn-primary" type="submit"><?= $this->lang['calculate']; ?></button>
              </form>
          </div>
        </div>
      </div>
