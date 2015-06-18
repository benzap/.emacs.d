(message "Loading smartparens Configuration")
(require 'package-utils)

;;Dependencies
(package-require 'smartparens)
(require 'smartparens-config)


(add-hook 'emacs-lisp-mode-hook 'turn-on-smartparens-mode)
(add-hook 'clojure-mode-hook 'turn-on-smartparens-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-smartparens-mode)
(add-hook 'ielm-mode-hook 'turn-on-smartparens-mode)
(add-hook 'cider-mode-hook 'turn-on-smartparens-mode)

(provide 'smartparens-mode-config)
