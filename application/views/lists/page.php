<br>
<div class="bs-docs-section">
        <div class="row">
	<?php $this->renderPartial('flashmessage'); ?>
        </div>
        <div class="row-fluid">
          <div class="span4">
            <h1><?= $this->lang['page']; ?>&nbsp;<?= $this->pagenr; ?>:&nbsp;<?= $this->page->title; ?></h1>
            <p>
                <?= $this->page->descr; ?>
            </p>
            <div class="progress progress-striped active">
                <div class="progress-bar" role="progressbar" aria-valuenow="<?= intval($this->pagenr * 100 / $this->pagestotal); ?>" aria-valuemin="0" aria-valuemax="100" style="width: <?= intval($this->pagenr * 100 / $this->pagestotal); ?>%">
                 <!--   <span><?= $this->lang['page']; ?> <?= $this->pagenr; ?>/<?= $this->pagestotal; ?></span> -->
                </div>
            </div>
            <div class="well">
                <?php if ($this->questions): ?>
                <form class="form-horizontal" role="form" method="POST" action="<?= URL::base_uri(); ?>lists/page/<?= $this->pagenr; ?>/">
                <?php foreach ($this->questions as $key => $question): ?>
                  <div class="form-group">
                      <?php if ($question['type'] == "MESSAGE"): ?>
                      <div class="col-sm-8">
                        <p><?= $question['question']; ?></p>
                      </div>
                      <?php elseif ($question['type'] == "TITLE"): ?>
                      <h2><?= $question['question']; ?></h2>
                      <?php elseif ($question['type'] == "COMBOBOX" and ($question['answers'])): ?>
                      <label for="inputEmail3" class="col-sm-4 control-label"><?= $question['question']; ?></label>
                      <div class="col-sm-8">
                        <select class="form-control" name="<?= $question['id']; ?>">
                            <?php foreach ($question['answers'] as $item => $answer): ?>
                            <option value='<?= $answer->id; ?>'><?= $answer->answer; ?></option>
                            <?php endforeach; ?>
                        </select>
                      </div>
                      <?php elseif ($question['type'] == "RADIOBOX"): ?>
                      <label for="d" class="col-sm-4 control-label"><?= $question['question']; ?></label>
                      <div class="col-sm-8">
                            <?php foreach ($question['answers'] as $item => $answer): ?>
                            <label class="radio-inline">
                              <input class="radio" type="radio" name='<?= $question['id']; ?>' value="<?= $answer->id; ?>"><?= $answer->answer; ?>
                            </label><br>
                            <?php endforeach; ?>
                      </div>
                      <?php elseif ($question['type'] == "CHECKBOX"): ?>
                      <label for="d" class="col-sm-4 control-label"><?= $question['question']; ?></label>
                      <div class="col-sm-8">
                            <?php foreach ($question['answers'] as $item => $answer): ?>
                            <div class="checkbox">
                                <label>
                                  <input type="checkbox" name="<?= $question['id']; ?>[]" value="<?= $answer->id; ?>"> <?= $answer->answer; ?>
                                </label>
                            </div>
                            <?php endforeach; ?>
                      </div>
                      <?php elseif ($question['type'] == "TEXTINPUT"): ?>
                      <label for="d" class="col-sm-4 control-label"><?= $question['question']; ?></label>
                      <div class="col-sm-8">
                            <textarea class="form-control" name="<?= $question['id']; ?>" id="descr" rows="3"></textarea>
                      </div>
                      <?php elseif ($question['type'] == "LINEINPUT"): ?>
                      <label for="d" class="col-sm-4 control-label"><?= $question['question']; ?></label>
                      <div class="col-sm-8">
                          <input type="text" class="form-control" name="<?= $question['id']; ?>" >
                      </div>
                      <?php elseif ($question['type'] == "DATEINPUT"): ?>
                      <label for="d" class="col-sm-4 control-label"><?= $question['question']; ?></label>
                      <div class="col-sm-8">
                          <div class="input-group date">
                            <input type="text" name="<?= $question['id']; ?>" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                          </div>
                      </div>
                      <?php elseif ($question['type'] == "NUMBERINPUT"): ?>
                      <label for="d" class="col-sm-4 control-label"><?= $question['question']; ?></label>
                      <div class="col-sm-8">
                        <input type="text" value="0" name="<?= $question['id']; ?>" class="col-md-8 form-control">
                        <?php 
                            $extras = explode(';', $question['extra']);
                            //min;max;step;prefix
                            if (!$extras or sizeof($extras) < 2){
                                $extras = array();
                                $extras[0] = 0;
                            }
                            if (sizeof($extras) < 2){
                                $extras[1] = 100;
                            }
                            if (sizeof($extras) < 3){
                                $extras[2] = 1;
                            }
                        ?>
                        <script type="text/javascript">
                            $("input[name='<?= $question['id']; ?>']").TouchSpin({
                                    min: <?= $extras[0] ?>,
                                    max: <?= $extras[1] ?>,
                                    stepinterval: <?= $extras[2] ?>,
                                    <?php if (sizeof($extras) > 3): ?> //prefix is not required.
                                    postfix: '<?= $extras[3] ?>'
                                    <?php endif; ?>
                            });
                        </script>
                      </div>
                      <?php elseif ($question['type'] == 'TIMEINPUT'): ?>
                      <label for="d" class="col-sm-4 control-label"><?= $question['question']; ?></label>
                      <div class="col-sm-8">
                        <div class="input-group input-append bootstrap-timepicker">
                            <input id="<?= $question['id']; ?>" name="<?= $this->question['id']; ?>" type="text" class="form-control input-small">
                            <i class="input-group-addon glyphicon glyphicon-time"></i>
                        </div>
                      </div>
                        <script type="text/javascript">
                            $('#<?= $question['id']; ?>').timepicker({
                                minuteStep: 15,
                                template: 'dropdown',
                                appendWidgetTo: 'body',
                                showSeconds: false,
                                showMeridian: false,
                                defaultTime: 'current',
                            });
                        </script>
                      <?php endif; ?>
                  </div>
                <?php endforeach; ?>
                  <div class="form-group">
                    <div class="btn pull-right">
                        <button type="submit" class="btn btn-default"><?= $this->lang['next']; ?></button>
                    </div>
                  </div>    
                </form>
                <?php else: ?>
                <form class="form-horizontal" role="form" method="POST" action="<?= URL::base_uri(); ?>lists/page/<?= $this->pagenr; ?>/">
                    <p>
                        <?= $this->lang['noquestions']; ?>
                    </p>
                    <input type="text" style="display:none;" name="skip" value="1" />
                    <div class="form-group">
                        <div class="btn pull-right">
                            <button type="submit" class="btn btn-default"><?= $this->lang['next']; ?></button>
                        </div>
                    </div>  
                </form>
                <?php endif; ?>
            </div>
          </div>

        </div>
      </div>