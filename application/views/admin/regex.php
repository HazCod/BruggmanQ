<br>
<div class="bs-docs-section">
        <div class="row">
	<?php $this->renderPartial('flashmessage'); ?>
        </div>
        <div class="row-fluid">
          <div class="span4">
              <h2><?= $this->lang['regextool']; ?></h2>
              <form method="post" action="<?= URL::base_uri(); ?>admin/parameters/add">
                <div class="form-group">
                    <label for="regex"><?= $this->lang['input']; ?></label>
                    <textarea class="form-control" id="regex" name="regex" placeholder="<?= $this->lang['input']; ?>"></textarea>
                </div><!-- /input-group -->
                <div class="form-group">
                    <label for="name"><?= $this->lang['name']; ?></label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="1" value="<?php if ($this->name){ echo $this->name; } ?>">
                </div><!-- /input-group -->                
                <div class="form-group">
                    <label for="occurence"><?= $this->lang['occurence']; ?></label>
                    <input type="text" class="form-control" id="occurence" name="occurence" placeholder="1" value="<?php if ($this->occurence){ echo $this->occurence; } ?>">
                </div><!-- /input-group -->
                <div class="form-group">
                    <label for="length"><?= $this->lang['regexlength']; ?></label>
                    <input type="text" class="form-control" id="length" name="length" placeholder="<?= $this->lang['regexleaveempty']; ?>" >
                </div>
                <div class="form-group">
                    <label for="norm"><?= $this->lang['norm']; ?></label>
                    <input type="text" class="form-control" id="norm" name="norm" placeholder="0" value="0">
                </div><!-- /input-group -->
                <div class="form-group">
                    <label for="stddev"><?= $this->lang['stddev']; ?></label>
                    <input type="text" class="form-control" id="stddev" name="stddev" placeholder="0" value="0">
                </div><!-- /input-group -->
                <div class="form-group">
                    <label for="excel"><?= $this->lang['addtoexcel']; ?></label>
                    <select class="form-control" name="excel">
                        <option value="1"><?= $this->lang['yes']; ?></option>
                        <option value="0"><?= $this->lang['no']; ?></option>
                    </select>
                </div><!-- /input-group -->
                
                <button class="btn btn-primary" type="submit"><?= $this->lang['add']; ?></button>
              </form>
          </div>
        </div>
      </div>
