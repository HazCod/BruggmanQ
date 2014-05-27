<script type="text/javascript">
function downloadURI() 
{
    var link = document.createElement("a");
    link.download = '<?= $this->name; ?>';
    link.href = '<?= $this->result; ?>';
    link.click();
}
</script>
<br>
<div class="bs-docs-section">
        <div class="row">
	     <?php $this->renderPartial('flashmessage'); ?>
        </div>
        <div class="row-fluid">
          <div class="span4">
              <h2><?= $this->lang['report']; ?></h2>
              <p>
                  <?= $this->lang['reportgenerating']; ?>
              </p>
          </div>
            <div class="well">
                <button type="button" class="btn btn-primary" onClick="downloadURI()">Download Report</button>
                <pre>
                    <strong><?= $this->cmd; ?></strong>
                    <br>
                    <?= $this->output; ?>
                </pre>
            </div>
        </div>
      </div>
