;; Cargo Configuration

(use-package toml-mode
  :ensure t
  :mode "\\.toml\\'"
  :config
  (message "Toml-mode Configuring..."))


(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'"
  :config
  (message "Rust-mode Configuring..."))


(use-package cargo
  :ensure t
  :after (rust-mode)
  :hook (rust-mode . cargo-minor-mode)
  :config
  (message "Cargo Configuring..."))


(use-package flycheck-rust
  :ensure t
  :after (flycheck rust-mode)
  :hook (flycheck-mode . flycheck-rust-setup)
  :config
  (message "Flycheck Configuring..."))


(use-package racer
  :ensure t
  :after (rust-mode)
  :hook ((rust-mode . racer-mode)
         (racer-mode . eldoc-mode))
  :config
  (message "Racer Configuring..."))


(provide 'cargo-config)
