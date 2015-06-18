(message "Loading Magit Configuration...")

(require 'package-utils)

;;Dependencies
(package-require 'magit)

;;turn off magit warning
(setq magit-last-seen-setup-instructions "1.4.0")

(provide 'magit-config)
