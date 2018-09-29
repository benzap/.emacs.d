;; Projectile Configuration


(use-package project-explorer
  :ensure t
  :commands (project-explorer-open)
  :bind (("M-p" . project-explorer-open))
  :config
  (message "Loading projectile Configuration..."))
  

(use-package projectile
  :ensure t
  :delight '(:eval (concat " " (projectile-project-name)))
  :hook (prog-mode . projectile-mode))


(provide 'projectile-config)
