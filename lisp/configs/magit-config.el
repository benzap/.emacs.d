;; Magit Configuration


(use-package magit
  :ensure t
  :commands (magit)
  :config
  (message "Loading Magit Configuration...")
  (setq magit-last-seen-setup-instructions "1.4.0"))  


(provide 'magit-config)
