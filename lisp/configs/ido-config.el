

;;(defun ido-imenu-push-mark ()
;; (interactive)
;; (let ((push-mark-before-goto-char t))
;;   (idomenu))


(use-package ido
  :ensure t
  :commands (ido-mode ido-find-file ido-switch-buffer)
  :bind (("C-x C-f" . ido-find-file)
         ("C-x b" . ido-switch-buffer))
  :config
  (message "Loading ido Configuration...")
  (setq ido-everywhere 1)
  (ido-mode 1))


(use-package flx-ido
  :ensure t
  :after (ido)
  :config (setq ido-enable-flex-matching t))


(use-package ido-hacks
  :ensure t
  :after (ido))


(use-package idomenu
  :ensure t
  :bind ("C-x C-i" . idomenu)
  :after (ido))


(provide 'ido-config)
