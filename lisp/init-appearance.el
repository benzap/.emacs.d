;;; init-appearance.el --- My Appearance Configuration
;;; Commentary:
;;; Author: Benjamin Zaporzan
;;; Code:

;; Theme Package
(use-package monokai-theme
  :ensure t
  :init
  (if (eq system-type 'windows-nt)
      (add-hook 'window-setup-hook '(lambda () (load-theme 'monokai t)))
    (add-hook 'after-init-hook '(lambda () (load-theme 'monokai t))))
  :config (load-theme 'monokai t))

;; Font
(add-to-list 'default-frame-alist
             '(font . "Inconsolata-14"))


(use-package powerline
  :ensure t
  :init (powerline-default-theme)
  :config (set-face-attribute 'mode-line nil
            :foreground "Black"
            :background "olive drab"
            :box nil))

;; HTPC Bigger Text Size
(when (string= (getenv "COMPUTERNAME") "ZAPTECH-HTPC")
  (set-face-attribute 'default nil :family "Inconsolata" :height 140))

;; Macbook Pro with hi-res display
(when (string= (system-name) "benzap-work-macbook.local")
  (set-face-attribute 'default nil :family "Inconsolata" :height 165))

;; Zaptech Server 1, with X11 Forwarding
(when (string= (system-name) "ZAPTECH-SERVER-1")
  (set-face-attribute 'default nil :family "Inconsolata" :height 165))


(provide 'init-appearance)
;;; init-appearance.el ends here
