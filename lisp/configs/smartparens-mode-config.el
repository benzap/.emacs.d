;; Smartparens Configuration

(use-package smartparens
  :disabled
  :ensure t
  :hook ((emacs-lisp-mode
          clojure-mode
          lisp-interaction-mode
          ielm-mode
          cider-mode) . turn-on-smartparens-mode)
  :config
  (message "Loading smartparens Configuration")  
  (require 'smartparens-config))


(provide 'smartparens-mode-config)
