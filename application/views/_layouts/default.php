<!DOCTYPE html>
<html lang="<?= $_SESSION['lang']; ?>">
    <head>
        <?php $this->renderPartial('headermeta'); ?>
        <script src="<?= URL::base_uri(); ?>js/jquery.js"></script>
        <script src="<?= URL::base_uri(); ?>js/bootstrap.min.js"></script>
        <script src="<?= URL::base_uri(); ?>js/bootswatch.js"></script>
        <script src="<?= URL::base_uri(); ?>js/bootstrap-datepicker.js"></script>
        <script src="<?= URL::base_uri(); ?>js/jquery.spinner.min.js"></script>
        <script src="<?= URL::base_uri(); ?>js/bootstrap-timepicker.min.js"></script>
    </head>
    <body>
        <?php $this->renderPartial('navbar'); ?>
        <div class="container">
            <h2 class="display:none;"><?php echo $this->getPagetitle(); ?></h2>
            <?php $this->getContent(); ?>
            <hr>
            <?php $this->renderPartial('footer'); ?>
        </div> <!-- /container -->
        <script type="text/javascript">
            $('.input-group.date').datepicker({});
        </script>
    </body>
</html>
