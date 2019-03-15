


(use-package yasnippet
  :ensure t
  :init
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  :config
  (message "Loading yasnippet Configuration...")
  (yas-global-mode 1))


(provide 'yasnippet-config)
