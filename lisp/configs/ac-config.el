;; Auto-complete Configuration

(use-package auto-complete
  :ensure t
  :diminish auto-complete-mode
  :init
  (global-auto-complete-mode)
  :config
  (message "Loading auto-complete Configuration..."))


(use-package auto-complete-config
  :config
  (ac-config-default)
  (ac-set-trigger-key "TAB")
  (ac-set-trigger-key "<tab>")

  (set-face-background 'ac-candidate-face "LightGray")
  (set-face-underline 'ac-candidate-face "LimeGreen")
  (set-face-background 'ac-selection-face "DarkGreen"))


(provide 'ac-config)
