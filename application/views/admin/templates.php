<script type="text/javascript">
    function getNights( prefix ) {
        var url = prefix + document.getElementById("nights");
        window.location.href = url;
    }
</script>
<br><br><br>
<div class="bs-docs-section">
        <div class="row">
	<?php $this->renderPartial('flashmessage'); ?>
        </div>
        <div class="row-fluid">
          <div class="span4">
             <h2>Templates</h2>
             <select id='nights'>
              <option value='1'>1</option>
              <option value='2'>2</option>
              <option value='3'>3</option>
              <option value='4'>4</option>
             </select>Night(s)
             <div class="pull-right">
                <button type="button" class="btn btn-default">
                    <a href="<?= URL::base_uri() . 'admin/templates/add' ?>"><span class="glyphicon glyphicon-plus"></span> <?= $this->lang['add']; ?></a>
                </button>
             </div>
             <table class="table table-hover">
              <?php if ($this->templates == false): ?>
              <p><?= $this->lang['notemplates']; ?></p>
              <?php else: ?>
              <thead>
                <tr>
                    <th>Template</th>
                    <th><?= $this->lang['language']; ?></th>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($this->templates as $key => $list): ?>
                <tr>
                  <?php foreach ($list as $property => $data): ?>
                  <td>
                  <?php
                    if (is_array($data)){
                        foreach ($data as $part){
                            $imgu = URL::base_uri() . 'img/flags/';
                            $url = URL::base_uri() . 'admin/templates';
                            echo "&nbsp;&nbsp;&nbsp;&nbsp;<img src='$imgu$part.png' alt='$part' />&nbsp;&nbsp;";
                            echo "<a href=\"javascript:getNights('$url/$list[0]/$part/download/')\">Download</a>/";
                            echo "<a href=\"javascript:getNights('$url/$list[0]/$part/replace/')\">Replace</a>";
                        }
                    } else {
                        echo $data;
                    }
                  ?>
                  </td>
                  <?php endforeach; ?>
                </tr>
                <?php endforeach; ?>
              </tbody>
              <?php endif; ?>
            </table>
          </div>
        </div>
      </div>
