<footer>
    <?php if ($this->request->params['action'] === 'home') : ?>
        <div class="payment-methods">
            <div class="container text-center">
                <?= $this->Html->image('Payment-Methods.png'); ?>
            </div>
        </div>
    <?php endif; ?>
    <div class="copyright-container">
        <div class="container">
            <div class="row">
                <div class="col-sm-4 bottom-menu">
                    <ul class="list-inline">
                        <li><a href="<?= $this->Url->build('/pages/privacy'); ?>"><?= __('Privacy Policy') ?></a>
                        </li>
                        <li><a href="<?= $this->Url->build('/pages/terms'); ?>"><?= __('Terms of Use') ?></a>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-4 social-links">
                    <ul class="list-inline">
                        <?php if (get_option('facebook_url')) : ?>
                            <li><a href="<?= h(get_option('facebook_url')) ?>"><i class="fa fa-facebook"></i></a></li>
                        <?php endif; ?>
                        <?php if (get_option('twitter_url')) : ?>
                            <li><a href="<?= h(get_option('twitter_url')) ?>"><i class="fa fa-twitter"></i></a></li>
                        <?php endif; ?>
                        <?php if (get_option('google_plus_url')) : ?>
                            <li><a href="<?= h(get_option('google_plus_url')) ?>"><i class="fa fa-google-plus"></i></a></li>
                        <?php endif; ?>
                    </ul>
                </div>
                <div class="col-sm-4 copyright">
                    <div><?= __('Copyright &copy;') ?> <?= h(get_option('site_name')) ?> <?= date("Y") ?></div>

                </div>
            </div>
        </div>
    </div>
</footer>

<?= $this->Html->script('/vendor/jquery.min.js'); ?>
<?= $this->Html->script('/vendor/bootstrap/js/bootstrap.min.js'); ?>
<?= $this->Html->script('/vendor/owl/owl.carousel.min.js'); ?>
<?= $this->Html->script('/vendor/wow.min.js'); ?>
<?= $this->Html->script('/vendor/clipboard.min.js'); ?>

<?= $this->element('js_vars'); ?>
<!-- Custom Theme JavaScript -->
<?= $this->Html->script('front.js?ver='.APP_VERSION); ?>
<?= $this->Html->script('app.js?ver=' . APP_VERSION); ?>
<script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit&hl=<?= locale_get_primary_language(null) ?>" async defer></script>

<?= $this->fetch('scriptBottom') ?>
<?= get_option('footer_code'); ?>
