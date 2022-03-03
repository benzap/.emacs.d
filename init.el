;;; init.el --- Emacs Configuration
;;; Commentary:
;;; Author: Benjamin Zaporzan
;;; Code:
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Initial Package Manager Setup
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(package-initialize)
(require 'init-package)

;; Defaults for every editor
(require 'init-defaults)

;;
;; Barebones Package Configuration (+ key bindings)
;;
(use-package dash :ensure t)
(use-package diminish :ensure t :after helm)
(use-package helm-swoop :ensure t :after helm)
(use-package helm-flx :ensure t :after helm)
(use-package smex :ensure t :after helm)
(use-package helm-smex :ensure t :after helm)
(use-package flycheck
  :ensure t
  :hook (prog-mode . flycheck-mode))

(use-package key-chord
  :ensure t
  :init (key-chord-mode 1))

(use-package subword
  :diminish subword-mode
  :hook ((text-mode prog-mode) . subword-mode))

(use-package eldoc
  :no-require t
  :init
  (add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
  (add-hook 'lisp-interaction-mode-hook 'eldoc-mode)
  (add-hook 'ielm-mode-hook 'eldoc-mode))

;; Helm & Company Setup (Auto-Complete Libraries)
(use-package helm
  :ensure t
  :diminish helm-mode
  :config
  (require 'helm-config)
  (helm-mode 1)
  (helm-flx-mode 1)
  (define-key global-map [remap find-file] 'helm-find-files)
  (define-key global-map [remap occur] 'helm-occur)
  (define-key global-map [remap list-buffers] 'helm-buffers-list)
  (define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
  (define-key global-map [remap execute-extended-command] 'helm-smex)
  (define-key global-map [remap apropos-command] 'helm-apropos))

(require 'my-config-company) ;; Include: company

;;
;; Org-mode Configuration
;;

;; Bullets use real bullet points
(setq org-hide-emphasis-markers t)
  (font-lock-add-keywords
   'org-mode
   '(("^ +\\([-*]\\) "
      (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;; Apply different header styles
(let* ((variable-tuple     `(:font ,user-default-sans-font))
       (base-font-color    "#fdfdfd")
       (headline          `(:inherit default :weight bold :foreground ,base-font-color)))

  (custom-theme-set-faces
   'user
   `(org-level-8 ((t (,@headline ,@variable-tuple))))
   `(org-level-7 ((t (,@headline ,@variable-tuple))))
   `(org-level-6 ((t (,@headline ,@variable-tuple))))
   `(org-level-5 ((t (,@headline ,@variable-tuple))))
   `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
   `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.2))))
   `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.3))))
   `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.4))))
   `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil))))))

(custom-theme-set-faces
 'user
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-code ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-info ((t (:foreground "dark orange"))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-link ((t (:foreground "royal blue" :underline t))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-property-value ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))

;; Make org-mode use variable width font
;;(add-hook 'org-mode-hook 'variable-pitch-mode)
;;(add-hook 'org-mode-hook 'visual-line-mode)


;; Better looking org-mode bullets header bullet points.
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; Configuring Recentf (Track and View Recently Seen Files)
(use-package recentf
  :no-require t
  :after (helm)
  :config
  (recentf-mode 1)
  (setq recentf-max-menu-items 25)
  (setq recentf-max-saved-items 25)
  (global-set-key (kbd "C-x C-r") 'helm-recentf))

(use-package helm-company
  :ensure t
  :after (helm company))


;; Not specifically meant for rust, parinfer written in rust
(use-package parinfer-rust-mode
  :ensure t
  :bind
  (("C-p" . parinfer-rust-switch-mode))
  :hook (clojure-mode emacs-lisp-mode common-lisp-mode scheme-mode lisp-mode)
  :init (setq parinfer-rust-auto-download t))


;; Rust Support
(require 'my-config-rust)               ; Include: cargo-mode,
					; rust-mode, toml-mode, racer

;; Undo Tree
(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode))


;; Web & Javascript & CSS
(use-package web-mode
  :ensure t
  :mode ("\\.asp$"
         "\\.aspx$"
         "\\.mustache$"
         "\\.jsp$"
         "\\.inc$"
         "\\.html$")
  :config
  (message "Loading web-mode Configuration")
  (setq tab-width 4)
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4))

(use-package js2-mode
  :ensure t
  :mode "\\.js$"
  :config
  (setq js-indent-level 2)
  (append flycheck-disabled-checkers
    '(javascript-jshint))
  (flycheck-add-mode 'javascript-eslint 'js2-mode))

(use-package less-css-mode
  :ensure t
  :mode "\\.less\\'"
  :interpreter ("less" . less-css-mode)
  :config
  (setq-default css-indent-offset 2)
  (setq default-tab-width 2)
  (setq indent-tabs-mode nil)
  (message "Loading less-css-mode Configuration..."))

;; Clojure & Cider Development
(use-package clojure-mode
  :ensure t
  :mode "\\.clj$")

(use-package clojurescript-mode
  :mode "\\.cljs$")

(use-package clojurec-mode
  :mode "\\.cljc$")

(use-package cider
  :ensure t
  :commands (cider-jack-in
             cider-jack-in-clj
             cider-jack-in-cljs
             cider-connect
             cider-connect-clj
             cider-connect-cljs)
  :after (:any clojure-mode clojurescript-mode clojurec-mode)
  :bind (:map cider-mode-map
              ("C-c b" . cider-eval-buffer)))

(use-package yasnippet
  :ensure t
  :init
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  :config
  (message "Loading yasnippet Configuration...")
  (yas-global-mode 1))

;;
;; Appearance
;;

(require 'init-appearance) ;; Include: theme-motokai

;;
;; Global Keybindings
;;
(global-set-key (kbd "M-X") #'helm-smex-major-mode-commands)
(key-chord-define-global "<M" 'backward-list)
(key-chord-define-global ">?" 'forward-list)

;; Mac specific bindings
;; rebind the modifier key to mimic general keyboards
(when (eq system-type 'darwin)
  (setq mac-option-modifier 'alt)
  (setq mac-command-modifier 'meta)
  (setq mac-function-modifier 'control)
  (setq mac-control-modifier 'control)
  (global-set-key [kp-delete] 'delete-char))


;;
;; DONE
;;
;; (find-file "~/.emacs.d/init.el")


;;;;;;;;;;;;;;;;;;;;;;
;; Custom Variables ;;
;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(org-mode org-bullets parinfer-rust-mode yasnippet web-mode use-package undo-tree toml-mode racer powerline monokai-theme lispy key-chord js2-mode helm-swoop helm-smex helm-flx helm-company flycheck-rust diminish delight cider cargo auto-package-update)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
