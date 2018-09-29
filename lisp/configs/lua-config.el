;; Lua-mode Configuration


(use-package lua-mode
  :ensure t
  :mode ("\\.lua\\'" . lua-mode)
  :interpreter ("lua" . lua-mode)
  :config
  (message "Loading lua-mode Configuration...")
  (setq lua-indent-level 4))


(provide 'lua-config)
