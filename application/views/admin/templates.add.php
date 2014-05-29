<br>
<div class="bs-docs-section">
    <div class="row">
    <?php $this->renderPartial('flashmessage'); ?>
    </div>
    <div class="row-fluid">
      <div class="span4">
          <h2><?= $this->lang['uploadtemplate']; ?></h2>
          <form action="<?= URL::base_uri(); ?>admin/templates/x/x/add" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name"><?= $this->lang['name']; ?></label>
                <input class="form-control" type="text" id="name" name="name" placeholder="<?= $this->lang['name']; ?>" />
            </div>
            <?php foreach ($this->langs as $key => $lang): ?>
            <div class="form-group">
                <label for="file_<?= $lang->flag; ?>"><?= $this->lang['templatelang']; ?>&nbsp;<strong><?= $lang->name; ?></strong>&nbsp;(.docx)</label>
                <input class="form-control" type="file" name="file_<?= $lang->flag; ?>" id="file_<?= $lang->flag; ?>"><br>
            </div>
            <?php endforeach; ?>
            <div class="form-group">       
                <input class="btn" type="submit" name="submit" value="Upload" />
            </div>
          </form>
      </div>
    </div>
</div>
