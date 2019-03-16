;; eldoc Configuration

(use-package eldoc
  :after (cider)
  :commands (turn-on-eldoc-mode)
  :hook ((emacs-lisp-mode . turn-on-eldoc-mode)
         (lisp-interaction-mode . turn-on-eldoc-mode)
         (ielm-mode . turn-on-eldoc-mode))
         ;;(cider-mode . cider-turn-on-eldoc-mode))
  :config
  (message "Loading eldoc Configuring..."))


(provide 'eldoc-config)
