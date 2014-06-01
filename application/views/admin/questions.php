<?php
    function getTypeStr($arr, $typenr, $default=false, $property='type'){
        $result = $default;
        for ($i=0; $i < sizeof($arr) and $result == $default; $i++){
            if ($arr[$i]->id == $typenr){
                $result = $arr[$i]->$property;
            }
        }
        if ($result == false and $property == 'type'){
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
             <a href="<?= URL::base_uri(); ?>admin/pages/<?= $this->page; ?>"><?= $this->lang['gobacktopage']; ?>&nbsp;<?= $this->page; ?>&nbsp;.</a><br>
             <div class="pull-right">
                <button type="button" class="btn btn-primary">
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
                  <?php 
                    if ($property == 'type'){
                          echo getTypeStr($this->types, $data); 
                    } else { 
                    if (strlen($data) > 60) {
                       echo substr($data, 0, 60) . '..'; 
                    } else {
                        echo $data;
                    }
                     } ?>
                  </td>
                  <?php endforeach; ?>
                  <td>
                      <a href="<?= URL::base_uri(); ?>admin/questions/<?= $this->page; ?>/up/<?= $question->id; ?>"><i class="glyphicon glyphicon-arrow-up"></i><?= $this->lang['moveup']; ?></a>  
                      &nbsp;
                      <a href="<?= URL::base_uri(); ?>admin/questions/<?= $this->page; ?>/down/<?= $question->id; ?>"><i class="glyphicon glyphicon-arrow-down"></i><?= $this->lang['movedown']; ?></a>  
                      &nbsp;
                      <a href="<?= URL::base_uri(); ?>admin/questions/<?= $this->page; ?>/delete/<?= $question->id; ?>"><i class="glyphicon glyphicon-remove"></i><?= $this->lang['delete']; ?></a>
                      <?php if (getTypeStr($this->types, $question->type, true, 'answers_possible') == true): ?>
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
