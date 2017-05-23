(message "Loading cargo Configuration...")
(require 'package-utils)

;;Dependencies
(package-require 's)
(package-require 'rust-mode)
(package-require 'cargo)
(package-require 'flycheck-rust)
(package-require 'racer)
(package-require 'company)

;;Cargo setup functionality
(add-hook 'rust-mode-hook 'cargo-minor-mode)

;;Flycheck-rust functionality
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

;;Racer functionality
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

;;Company functionality
(add-hook 'racer-mode-hook #'company-mode)

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)
;; TODO - make this work with all versions
;; `rustc --print sysroot` + /lib/rustlib/src/rust/src

(setq racer-rust-src-path
      (concat (s-trim (shell-command-to-string "rustc --print sysroot")) "\\lib\\rustlib\\src\\rust\\src"))


(provide 'cargo-config)
