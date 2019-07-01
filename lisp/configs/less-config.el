;; less-css-mode configuration

(use-package less-css-mode
  :ensure t
  :mode "\\.less\\'"
  :interpreter ("less" . less-css-mode)
  :config
  (setq-default css-indent-offset 2)
  (setq default-tab-width 2)
  (setq indent-tabs-mode nil)
  (message "Loading less-css-mode Configuration..."))


(provide 'less-config)
