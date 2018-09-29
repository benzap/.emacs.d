;; yaml mode configuration


(use-package yaml-mode
  :ensure t
  :mode ("\\.yaml\\'" "\\.yml\\'")
  :config
  (message "Loading yaml-mode Configuration..."))


(provide 'yaml-config)
