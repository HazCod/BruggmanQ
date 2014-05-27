<br><br><br>
<div class="bs-docs-section">
        <div class="row">
	<?php $this->renderPartial('flashmessage'); ?>
        </div>
        <div class="row-fluid">
          <div class="span4">
             <h2><?= $this->lang['datalist']; ?></h2>
             <table class="table table-hover">
              <?php if ($this->datas == false): ?>
              <p><?= $this->lang['nodatayet']; ?></p>
              <?php else: ?>
              <thead>
                <tr>
                  <?php foreach ($this->datas[0] as $property => $data): ?>
                  <th><?= ucfirst($property); ?></th>
                  <?php endforeach; ?>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($this->datas as $key => $list): ?>
                <tr>
                  <?php foreach ($list as $property => $data): ?>
                  <td><?= $data ?></td>
                  <?php endforeach; ?>
                </tr>
                <?php endforeach; ?>
              </tbody>
              <?php endif; ?>
            </table>
          </div>
        </div>
      </div>
