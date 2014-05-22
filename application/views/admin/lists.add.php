<br><br><br>
<div class="bs-docs-section">
        <div class="row">
	<?php $this->renderPartial('flashmessage'); ?>
        </div>
        <div class="row-fluid">
          <div class="span4">
              <h2><?= $this->lang['addlist']; ?></h2>
              <form method="post" action="<?= URL::base_uri(); ?>admin/lists/add">
                <div class="form-group">
                    <label for="type"><?= $this->lang['language']; ?></label>
                    <select class="form-control" name="lang" id="lang">
                        <?php foreach ($this->langs as $type => $data): ?>
                        <option value="<?= $data->id; ?>"><img alt="<?= $data->name; ?>" src="<?= URL::base_uri() . 'img/flags/' . $data->flag . '.png' ?>" /><?= $data->name; ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="input-group">
                    <input type="text" class="form-control" id="listname" name="listname" placeholder="<?= $this->lang['namenewlist']; ?>" value="<?php if($this->formdata){ echo $this->formdata->listname; } ?>">
                  <span class="input-group-btn">
                      <button class="btn btn-default" type="submit"><?= $this->lang['add']; ?></button>
                  </span>
                </div><!-- /input-group -->
              </form>
          </div>
        </div>
      </div>
