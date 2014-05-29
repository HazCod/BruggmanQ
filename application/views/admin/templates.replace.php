<br>
<div class="bs-docs-section">
    <div class="row">
    <?php $this->renderPartial('flashmessage'); ?>
    </div>
    <div class="row-fluid">
      <div class="span4">
          <h2><?= $this->lang['uploadtemplate']; ?></h2>
          <form action="<?= URL::base_uri(); ?>admin/templates/<?= $this->templ; ?>/<?= $this->tlang; ?>/replace/<?= $this->nights; ?>" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <p>
                    <strong><?= $this->lang['language'];?>:</strong>&nbsp;<?= $this->tlang; ?>
                    <br>
                    <strong>Template:</strong>&nbsp;<?= $this->templ; ?>
                    <br>
                    <strong>Nights:</strong>&nbsp;<?= $this->nights; ?>
                </p>
            </div>
            <div class="form-group">
                <label for="file"><?= $this->lang['newtemplate']; ?>&nbsp;(.docx)</label>
                <input class="form-control" type="file" name="file" id="file"><br>
            </div>
            <div class="form-group">       
                <input class="btn" type="submit" name="submit" value="Upload" />
            </div>
          </form>
      </div>
    </div>
</div>
