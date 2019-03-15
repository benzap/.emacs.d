;; diff-hl Configuring...

(use-package diff-hl
  :ensure t
  :diminish diff-hl-mode
  :hook (prog-mode . diff-hl-mode)
  :config
  (message "Loading diff-hl Configuration..."))


(provide 'diff-hl-config)
