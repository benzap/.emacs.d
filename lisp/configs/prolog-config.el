(message "Loading prolog Configuration...")
(require 'package-utils)


(autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
(add-to-list 'auto-mode-alist '("\\.pl\\'" . prolog-mode))


(provide 'prolog-config)
