(message "Loading diff-hl Configuration...")
(require 'package-utils)

;;Dependencies
(package-require 'diff-hl)

(defun my-diff-hl-find-file-hook ()
  (diff-hl-mode))
(add-hook 'find-file-hook 'my-diff-hl-find-file-hook)

(provide 'diff-hl-config)
