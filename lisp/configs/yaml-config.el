(message "Loading yaml-mode Configuration...")
(require 'package-utils)

;;Dependencies
(package-require 'yaml-mode)


(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))

(provide 'yaml-config)
