(message "Loading flycheck Configuration...")
(require 'package-utils)

;;Dependencies
(package-require 'flycheck)

;;setup python for flycheck
(setq flycheck-pylintrc 
      (expand-file-name "lisp/configs/flycheck-pylintrc" user-emacs-directory))

(defun flycheck-config-python-init ()
  (flycheck-mode 1))


(add-hook 'python-mode-hook 'flycheck-config-python-init)

(provide 'flycheck-mode-config)
