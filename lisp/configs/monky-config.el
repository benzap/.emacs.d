(message "Loading Monky Configuration...")

(require 'package-utils)

;;Dependencies
(package-require 'monky)

(setq monky-process-type 'cmdserver)

(provide 'monky-config)
