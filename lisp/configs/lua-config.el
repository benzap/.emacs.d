(message "Loading lua-mode Configuration...")
(require 'package-utils)

;;Dependencies
(package-require 'lua-mode)

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
(setq lua-indent-level 4)
(add-hook 'lua-mode-hook (lambda () (setq tab-width 4)))

(provide 'lua-config)
