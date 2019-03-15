;; Python Configuration


(use-package python-mode
  :ensure t
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :config
  (message "Loading python-mode Configuration..."))


(use-package jedi
  :ensure t
  :commands (jedi:setup)
  :hook (python-mode . jedi:setup)
  :config
  (message "Loading Jedi Configuration...")
  (setq jedi:complete-on-dot t))


(provide 'python-config)
