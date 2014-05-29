<br>
<div class="bs-docs-section">
    <div class="row">
    <?php $this->renderPartial('flashmessage'); ?>
    </div>
    <div class="row-fluid">
      <div class="span4">
          <h2><?= $this->lang['generatereport']; ?></h2>
          <form action="<?= URL::base_uri(); ?>report/generate/<?= $this->userid; ?>/<?= $this->langcode; ?>" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="template">Template</label>
                <select class="form-control" name="template">
                    <?php
                    $scanned_directory = array_diff(scandir('/var/www/scripts/templates'), array('..', '.'));
                    foreach ($scanned_directory as $dir): ?>
                    <option value='<?= $dir; ?>'><?= $dir; ?></option>
                    <?php endforeach; ?>
                </select>
            </div>  
            <div class="form-group">
                <label for="file"><?= $this->lang['datafile']; ?></label>
                <input class="form-control" type="file" name="files[]" id="file" multiple="multiple"><br>
                <input class="btn" type="submit" name="submit" value="Upload" />
            </div>
          </form>
      </div>
    </div>
</div>
