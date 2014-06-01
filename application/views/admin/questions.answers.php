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
              <h2><?= $this->lang['manageanswers']; ?></h2>
              <h3><?= $this->lang['type']; ?>: <?= getTypeStr($this->types, $this->question->type); ?></h3>
              <p><?= $this->lang[getTypeStr($this->types, $this->question->type) . 'desc']; ?></p>
              <p class="lead"><?= $this->lang['question']; ?>: "<?= $this->question->question; ?>"</p>
             <div class="pull-right">
                <button type="button" class="btn btn-primary">
                    <a href="<?= URL::base_uri(); ?>admin/answers/<?= $this->question->id; ?>/add"><span class="glyphicon glyphicon-plus"></span> <?= $this->lang['addanswer']; ?></a>
                </button>
             </div>
              
              <table class="table table-hover">
              <?php if ($this->answers == false): ?>
              <p><?= $this->lang['noanswersyet']; ?></p>
              <?php else: ?>
              <thead>
                <tr>
                  <?php foreach ($this->answers[0] as $property => $data): ?>
                  <th><?= ucfirst($property); ?></th>
                  <?php endforeach; ?>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($this->answers as $key => $answer): ?>
                <tr>
                  <?php foreach ($answer as $property => $data): ?>
                  <td>                 
                    <?= $data ?>
                  </td>
                  <?php endforeach; ?>
                  <td>
                      <a href="<?= URL::base_uri(); ?>admin/answers/<?= $this->question->id; ?>/up/<?= $answer->id; ?>"><i class="glyphicon glyphicon-arrow-up"></i><?= $this->lang['moveup']; ?></a>  
                      &nbsp;
                      <a href="<?= URL::base_uri(); ?>admin/answers/<?= $this->question->id; ?>/down/<?= $answer->id; ?>"><i class="glyphicon glyphicon-arrow-down"></i><?= $this->lang['movedown']; ?></a>  
                      &nbsp;
                      <a href="<?= URL::base_uri(); ?>admin/answers/<?= $this->question->id; ?>/delete/<?= $answer->id; ?>"><i class="glyphicon glyphicon-remove"></i><?= $this->lang['delete']; ?></a>
                  </td>
                </tr>
                <?php endforeach; ?>
              </tbody>
              <?php endif; ?>
            </table>
          </div>
        </div>
      </div>