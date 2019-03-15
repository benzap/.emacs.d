
(require 'package-utils)


(use-package rainbow-delimiters
  :ensure t
  :hook ((prog-mode text-mode) . rainbow-delimiters-mode)
  :config
  (message "Loading rainbow delimiters Configuration..."))


(use-package rainbow-blocks
  :disabled
  :ensure t
  :hook ((prog-mode text-mode) . rainbow-blocks-mode)
  :config
  (message "Loading rainbow blocks Configuration..."))


(provide 'rainbow-config)
