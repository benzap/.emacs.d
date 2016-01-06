(message "Loading yasnippet Configuration...")
(require 'package-utils)

;;Dependencies
(package-require 'yasnippet)

(setq yas-snippet-dirs '("~/.emacs.d/snippets"))

(yas-global-mode 1)

(provide 'yasnippet-config)
