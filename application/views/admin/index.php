<br><br><br>
<div class="bs-docs-section">
        <div class="row">
	<?php $this->renderPartial('flashmessage'); ?>
        </div>
        <div class="row-fluid">
          <div class="span4">
             <h2><?= $this->lang['lists']; ?></h2>
             <table class="table table-hover">
              <?php if ($this->lists == false): ?>
              <p><?= $this->lang['nolistsyet']; ?></p>
              <?php else: ?>
              <thead>
                <tr>
                  <?php foreach ($this->lists[0] as $property => $data): ?>
                  <th><?= ucfirst($property); ?></th>
                  <?php endforeach; ?>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($this->lists as $key => $user): ?>
                <tr>
                  <?php foreach ($user as $property => $data): ?>
                  <td><?= $data ?></td>
                  <?php endforeach; ?>
                </tr>
                <?php endforeach; ?>
              </tbody>
              <?php endif; ?>
            </table>
          </div>
          <div class="span4">
             <h2><?= $this->lang['users']; ?></h2>
             <table class="table table-hover">
              <?php if ($this->lastusers == false): ?>
              <p><?= $this->lang['nousersyet']; ?></p>
              <?php else: ?>
              <thead>
                <tr>
                  <?php foreach ($this->lastusers[0] as $property => $data): ?>
                  <th><?= ucfirst($property); ?></th>
                  <?php endforeach; ?>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($this->lastusers as $key => $user): ?>
                <tr>
                  <?php foreach ($user as $property => $data): ?>
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
