(message "Loading ido Configuration...")
(require 'package-utils)

;;Dependencies
(package-require 'ido)
(package-require 'flx-ido)
(package-require 'ido-hacks)
(package-require 'idomenu)

;;add support for better file browsing
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(provide 'ido-config)
