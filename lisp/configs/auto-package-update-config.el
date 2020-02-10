;; Automatically updates packages as desired


(use-package auto-package-update
  :ensure t
  :config
  (message "Auto Package Update Configuring...")
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (setq auto-package-update-prompt-before-update t)
  (auto-package-update-maybe))


(provide 'auto-package-update-config)
