<?php //Return the type str when given the type id
    function getTypeStr($arr, $typenr){
        $result = false;
        for ($i=0; $i < sizeof($arr) and $result == false; $i++){
            if ($arr[$i]->id == $typenr){
                $result = $arr[$i]->type;
            }
        }
        if ($result == false){
            $result = '???(' . $typenr . ')';
        }
        return $result;
    }
?>
<br><br><br>
<div class="bs-docs-section">
        <div class="row">
	<?php $this->renderPartial('flashmessage'); ?>
        </div>
        <div class="row-fluid">
          <div class="span4">
             <h2><?= $this->lang['questions']; ?></h2>
             <a href="<?= URL::base_uri(); ?>admin/pages/<?= $this->list; ?>"><?= $this->lang['gobacktopage']; ?>&nbsp;<?= $this->page; ?>&nbsp;.</a><br>
             <div class="pull-right">
                <button type="button" class="btn btn-default">
                    <a href="<?= URL::base_uri(); ?>admin/questions/<?= $this->page; ?>/add"><span class="glyphicon glyphicon-plus"></span> <?= $this->lang['addquestion']; ?></a>
                </button>
             </div>
             <table class="table table-hover">
              <?php if ($this->questions == false): ?>
              <p><?= $this->lang['noquestionsyet']; ?></p>
              <?php else: ?>
              <thead>
                <tr>
                  <?php foreach ($this->questions[0] as $property => $data): ?>
                  <th><?= ucfirst($property); ?></th>
                  <?php endforeach; ?>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($this->questions as $key => $question): ?>
                <tr>
                  <?php foreach ($question as $property => $data): ?>
                  <td>
                  <?php if ($property == 'type'): ?>
                    <?= getTypeStr($this->types, $data); ?>
                  <?php else: ?>
                    <?= $data ?>
                  <?php endif; ?>
                  </td>
                  <?php endforeach; ?>
                  <td>
                      <a href="<?= URL::base_uri(); ?>admin/questions/<?= $this->page; ?>/up/<?= $question->id; ?>"><i class="glyphicon glyphicon-arrow-up"></i><?= $this->lang['moveup']; ?></a>  
                      &nbsp;
                      <a href="<?= URL::base_uri(); ?>admin/questions/<?= $this->page; ?>/down/<?= $question->id; ?>"><i class="glyphicon glyphicon-arrow-down"></i><?= $this->lang['movedown']; ?></a>  
                      &nbsp;
                      <a href="<?= URL::base_uri(); ?>admin/questions/<?= $this->page; ?>/delete/<?= $question->id; ?>"><i class="glyphicon glyphicon-remove"></i><?= $this->lang['delete']; ?></a>
                      <?php if ($question->type != 1): ?>
                      &nbsp;
                      <a href="<?= URL::base_uri(); ?>admin/answers/<?= $question->id; ?>"><i class="glyphicon glyphicon-list-alt"></i><?= $this->lang['answers']; ?></a>
                      <?php endif; ?>
                  </td>
                </tr>
                <?php endforeach; ?>
              </tbody>
              <?php endif; ?>
            </table>
          </div>
        </div>
      </div>
