(message "Loading undo-tree Configuration...")

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode))

(provide 'undo-tree-config)
