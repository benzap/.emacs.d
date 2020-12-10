;;
;; Benzap's Emacs Configuration
;;
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Initial Package Manager Setup
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(when (not package-archive-contents)
  (message "Refreshing Packages...")
  (package-refresh-contents))

;; Retrieve and setup use-package
(when (not (package-installed-p 'use-package))
  (message "Installing Use Package Library...")
  (package-install 'use-package))
(require 'use-package)

;; Automatically Update Packages
(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions  t
	auto-package-update-prompt-before-update t
	auto-package-update-hide-results         t
        auto-package-update-interval             14)
  (auto-package-update-maybe))


;; Defaults for every editor
(require 'init-defaults)

;; Eldoc Setup
(use-package eldoc-mode
  :diminish ElDoc
  :hook
  (emacs-lisp-mode
   lisp-interaction-mode
   ielm-mode))

;; Helm & Company Setup (Auto-Complete Libraries)
(use-package helm
  :ensure t
  :diminish Helm
  :init
  (require 'helm-config)
  (helm-mode 1)
  (define-key global-map [remap find-file] 'helm-find-files)
  (define-key global-map [remap occur] 'helm-occur)
  (define-key global-map [remap list-buffers] 'helm-buffers-list)
  (define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
  (define-key global-map [remap execute-extended-command] 'helm-M-x)
  (define-key global-map [remap apropos-command] 'helm-apropos))

(use-package company
  :ensure t
  :defer t
  :init
  (setq company-backends '((company-files
			    company-keywords
			    company-capf
			    company-dabbrev-code
			    company-etags
			    company-dabbrev)))
  :config
  (global-company-mode 1))

(use-package helm-company
  :ensure t
  :after (helm company)
  :init
  (define-key company-mode-map (kbd "C-;") 'helm-company)
  (define-key company-active-map (kbd "C-;") 'helm-company))

;;
;; Appearance
;;

;; Theme
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
