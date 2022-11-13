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
(use-package counsel ;; Installs ivy and swiper
  :ensure t
  :init
  (ivy-mode)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  ;; enable this if you want `swiper' to use it
  ;; (setq search-default-mode #'char-fold-to-regexp)
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "<f6>") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))

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
  :config
  (recentf-mode 1)
  (setq recentf-max-menu-items 25)
  (setq recentf-max-saved-items 25)
  (global-set-key (kbd "C-x C-r") 'recentf-open-files))


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
  :init
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
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

(key-chord-define-global "<M" 'backward-list)
(key-chord-define-global ">?" 'forward-list)
(global-set-key (kbd "C-x C-b") 'ibuffer)

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
(provide 'init)
;;; init.el ends here
