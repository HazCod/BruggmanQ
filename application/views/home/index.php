<br><br><br>
<div class="bs-docs-section">
        <div class="row">
	<?php $this->renderPartial('flashmessage'); ?>
        </div>
        <div class="row-fluid">
          <div class="span4 offset4">
            <div class="well">
              <form class="bs-example form-horizontal" method="post" action="<?= URL::base_uri(); ?>home/login">
                <fieldset>
                  <legend><?= $this->lang['start']; ?></legend>
                  <div class="form-group <?= $this->form->getFieldStatus('firstname'); ?>">
                    <label for="firstname" class="col-lg-2 control-label"><?= $this->lang['firstname']; ?></label>
                    <div class="col-lg-10">
                      <input type="text" class="form-control" name="firstname" id="firstname" placeholder="<?= $this->lang['firstname']; ?>" value="<? if (isset($this->formdata)) echo $this->formdata->firstname; ?>">
		      <? if ($this->formdata): ?>
		      <span class="help-inline"><?= $this->form->getFieldMessage('firstname'); ?></span>
		      <? endif; ?>
                    </div>
                  </div>
                  <div class="form-group <?= $this->form->getFieldStatus('lastname'); ?>">
                    <label for="lastname" class="col-lg-2 control-label"><?= $this->lang['lastname']; ?></label>
                    <div class="col-lg-10">
                      <input type="text" name="lastname" class="form-control" id="lastname" placeholder="<?= $this->lang['lastname']; ?>" value="<? if (isset($this->formdata)) echo $this->formdata->lastname; ?>">
		      <? if ($this->formdata): ?>
		      <span class="help-inline"><?= $this->form->getFieldMessage('lastname'); ?></span>
		      <? endif; ?>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">
                      <button type="submit" class="btn btn-primary"><?= $this->lang['submit']; ?></button> 
                      <button type="reset" class="btn btn-default"><?= $this->lang['cancel']; ?></button>
                    </div>
                  </div>
                </fieldset>
              </form>
            </div>
          </div>

        </div>
      </div>
