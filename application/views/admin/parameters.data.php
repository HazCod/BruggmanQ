<br>
<div class="bs-docs-section">
    <div class="row">
    <?php $this->renderPartial('flashmessage'); ?>
    </div>
    <div class="row-fluid">
      <div class="span4">
          <h2><?= $this->lang['downloadData']; ?></h2>
          <form action="<?= URL::base_uri(); ?>admin/parameters/getdata" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="file"><?= $this->lang['datafile']; ?></label>
                <input class="form-control" type="file" name="file" id="file"><br>
                <input class="btn" type="submit" name="submit" value="Upload" />
            </div>
          </form>
      </div>
    </div>
</div>
