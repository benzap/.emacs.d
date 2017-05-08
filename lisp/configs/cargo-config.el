(message "Loading cargo Configuration...")
(require 'package-utils)

;;Dependencies
(package-require 'rust-mode)
(package-require 'cargo)

;;Cargo setup functionality
(add-hook 'rust-mode-hook 'cargo-minor-mode)

(provide 'cargo-config)
