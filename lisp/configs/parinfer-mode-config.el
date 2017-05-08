(message "Loading parinfer Configuration")
(require 'package-utils)

;;Dependencies
(package-require 'parinfer)
(require 'parinfer)

(add-hook 'emacs-lisp-mode-hook 'parinfer-mode)
(add-hook 'clojure-mode-hook 'parinfer-mode)
(add-hook 'lisp-interaction-mode-hook 'parinfer-mode)
(add-hook 'ielm-mode-hook 'parinfer-mode)
(add-hook 'cider-mode-hook 'parinfer-mode)

(provide 'parinfer-mode-config)
