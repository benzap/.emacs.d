;; Javascript Configuration


(use-package js2-mode
  :ensure t
  :mode "\\.js$"
  :config
  (setq js-indent-level 2)
  (append flycheck-disabled-checkers
    '(javascript-jshint))
  (flycheck-add-mode 'javascript-eslint 'js2-mode))


(use-package flycheck
  :ensure t
  :after js2-mode)


(provide 'javascript-config)
