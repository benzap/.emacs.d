(message "Loading rainbow Configuration...")
(require 'package-utils)

;;Dependencies
(package-require 'rainbow-delimiters)
(package-require 'rainbow-blocks)

;;rainbow global hook
(defun my-rainbow-find-file-hook ()
  ;;(rainbow-blocks-mode)
  (rainbow-delimiters-mode)
  (subword-mode))
(add-hook 'find-file-hook 'my-rainbow-find-file-hook)

(provide 'rainbow-config)
