;; Flycheck Configuration


(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :hook (python-mode . flycheck-mode)
  :config
  (message "Loading flycheck Configuration...")
  (use-package flycheck-mypy
    :ensure t
    :config
    (setq flycheck-pylintrc
      (expand-file-name
       "lisp/configs/flycheck-pylintrc"
       user-emacs-directory))))


(provide 'flycheck-mode-config)
