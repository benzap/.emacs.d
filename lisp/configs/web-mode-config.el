(message "Loading web-mode Configuration")
(require 'package-utils)

;;Dependencies
(package-require 'web-mode)

;;web-mode configuration
(add-to-list 'auto-mode-alist '("\\.asp$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.aspx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))

;;web-mode hook changes
(defun web-mode-hook ()
  "Hooks for web-mode (.asp, .php, .mustache, etc)"
  (auto-complete-mode 1)
  (setq tab-width 4)
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4))

(add-hook 'web-mode-hook 'web-mode-hook)

(provide 'web-mode-config)
