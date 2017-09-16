(message "Loading python-mode Configuration...")
(require 'package-utils)

;;Dependencies
(package-require 'python-mode)
(package-require 'jedi)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)


(provide 'python-config)
