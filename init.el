;;; init.el --- Emacs Configuration
;;; Commentary:
;;; Author: Benjamin Zaporzan
;;; Code:
(add-to-list 'load-path "~/.emacs.d/lisp/")
(setq init-debug? t)

;; Initial Package Manager Setup
(package-initialize)
(require 'init-package)

;; Defaults for every editor
(require 'init-defaults)

;;
;; Barebones Package Configuration (+ key bindings)
;;
(use-package diminish :ensure t)
(use-package delight :ensure t)
(use-package dash :ensure t)
(use-package helm-swoop :ensure t)
(use-package helm-flx :ensure t)
(use-package smex :ensure t)
(use-package helm-smex :ensure t)
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package key-chord
  :ensure t
  :init (key-chord-mode 1))
(use-package subword
  :diminish subword-mode
  :hook ((text-mode prog-mode) . subword-mode))

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

(use-package helm-company
  :ensure t
  :after (helm company)
  :init
  (define-key company-mode-map (kbd "C-;") 'helm-company)
  (define-key company-active-map (kbd "C-;") 'helm-company))

;;
;; Lisp/Clojure/Scheme Parinfer Mode Configuration
;;

(use-package parinfer
  :ensure t
  :bind
  (("C-x p" . parinfer-toggle-mode))
  :init
  (setq parinfer-extensions
        '(defaults       ; should be included.
           pretty-parens  ; different paren styles for different modes.
           ;; evil        ; If you use Evil.
           ;; paredit     ; Introduce some paredit commands.
           ;; lispy
           smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
           smart-yank))   ; Yank behavior depend on mode.
  :hook ((clojure-mode
          emacs-lisp-mode
          common-lisp-mode
          scheme-mode
          lisp-mode) . parinfer-mode)
  :config
  (message "Loading parinfer Configuration"))


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


(message "Welcome!")
(when init-debug?
  (find-file "~/.emacs.d/init.el"))


;;;;;;;;;;;;;;;;;;;;;;
;; Custom Variables ;;
;;;;;;;;;;;;;;;;;;;;;;
