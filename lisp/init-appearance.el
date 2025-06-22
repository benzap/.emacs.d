;;; init-appearance.el --- My Appearance Configuration
;;; Commentary:
;;; Author: Benjamin Zaporzan
;;; Code:

;; Theme Package, if window system
(when (display-graphic-p)
  (progn
    (use-package monokai-theme
      :ensure t
      :init
      (if (eq system-type 'windows-nt)
	  (add-hook 'window-setup-hook '(lambda () (load-theme 'monokai t)))
	(add-hook 'after-init-hook '(lambda () (load-theme 'monokai t))))
      :config (load-theme 'monokai t))))

(use-package powerline
  :ensure t
  :init (powerline-default-theme)
  :config (set-face-attribute 'mode-line nil
            :foreground "Black"
            :background "olive drab"
            :box nil))

(defun is-computer-name
    (name)
  "Return non-nil if NAME is equal to the COMPUTERNAME environment variable."
  (string= (getenv "COMPUTERNAME") name))

(defun is-mac-computer () (string= system-type "darwin"))

(when (display-graphic-p)
  (set-face-attribute 'default nil
		      :family user-default-mono-font
		      :height (cond
			       ((is-computer-name "ZAPTECH-HTPC")     160)
			       ((is-mac-computer)                     165)
			       ((is-computer-name "ZAPTECH-SERVER-1") 165)
			       (t                                     150))))


(provide 'init-appearance)
;;; init-appearance.el ends here
