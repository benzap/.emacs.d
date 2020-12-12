;;; my-config-rust.el --- Rust Configuration
;;; Commentary:
;;; Author: Benjamin Zaporzan
;;; Code:

(use-package toml-mode
  :ensure t
  :mode "\\.toml\\'")

(use-package rust-mode
  :ensure t
  :after (company)
  :mode "\\.rs\\'"
  :bind (("TAB" . company-indent-or-complete-common)))

(use-package cargo
  :ensure t
  :after (rust-mode)
  :hook (rust-mode . cargo-minor-mode))

(use-package flycheck-rust
  :ensure t
  :after (flycheck)
  :hook (flycheck-mode . flycheck-rust-setup))

(use-package racer
  :ensure t
  :after (rust-mode)
  :hook ((rust-mode . racer-mode)
         (racer-mode . eldoc-mode)
         (racer-mode . company-mode)))

(provide 'my-config-rust)
;;; my-config-rust.el ends here
