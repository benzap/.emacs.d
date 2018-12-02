;; Parinfer Configuration

(package-require 'parinfer)
;;(package-require 'paredit)
(package-require 'lispy)

(use-package parinfer
  :ensure t
  :bind
  (("C-x p" . parinfer-toggle-mode))
  :init
  (progn
    (setq parinfer-extensions
          '(defaults       ; should be included.
            pretty-parens  ; different paren styles for different modes.
            ;; evil           ; If you use Evil.
            ;; paredit        ; Introduce some paredit commands.
            lispy
            smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
            smart-yank))   ; Yank behavior depend on mode.
    (add-hook 'clojure-mode-hook #'parinfer-mode)
    (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
    (add-hook 'common-lisp-mode-hook #'parinfer-mode)
    (add-hook 'scheme-mode-hook #'parinfer-mode)
    (add-hook 'lisp-mode-hook #'parinfer-mode))
  :config
  (message "Loading parinfer Configuration"))


(provide 'parinfer-mode-config)
