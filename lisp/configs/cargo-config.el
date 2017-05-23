(message "Loading cargo Configuration...")
(require 'package-utils)

;;Dependencies
(package-require 'rust-mode)
(package-require 'cargo)
(package-require 'flycheck-rust)
(package-require 'racer)

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

(setq racer-rust-src-path "C:\\Users\\benzap\\.rustup\\toolchains\\stable-x86_64-pc-windows-msvc\\lib\\rustlib\\src\\rust\\src")


(provide 'cargo-config)
