;;Main initialization of emacs
(package-initialize)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-splash-screen t)

(set-face-attribute 'default nil :family "Inconsolata" :height 120)
;;(set-face-attribute 'default nil :family "Anonymous Pro" :height 120)

;;HTPC Bigger Text Size
(when (string= (getenv "COMPUTERNAME") "DESKTOP-30BPPD4")
  (set-face-attribute 'default nil :family "Inconsolata" :height 140))

;; Set up load path
(setq lisp-dir (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path lisp-dir)

;;grab our set of utility functions
(require 'package-utils)
(require 'utils)

;;setup the appearance
(require 'appearance)

;; Loading Configurations with Included Packages
(add-to-list 'load-path (expand-file-name "configs" lisp-dir))
;;
;;(require 'plantuml-config)
(require 'ido-config)
;;(require 'escreen-config)
(require 'org-config)
(require 'company-config)
(require 'ac-config)
(require 'erc-config)
(require 'eldoc-config)
(require 'rainbow-config)
(require 'key-chord-config)
(require 'diff-hl-config)
(require 'projectile-config)
;;(require 'smartparens-mode-config)
(require 'parinfer-mode-config)
(require 'magit-config)
(require 'monky-config)
(require 'lua-config)
(require 'python-config)
(require 'yaml-config)
(require 'cpp-config)
(require 'web-mode-config)
(require 'zone-config)
(require 'git-auto-commit-config)
(require 'yasnippet-config)
(require 'visual-basic-config)
(require 'flycheck-mode-config)
(require 'cargo-config)
(require 'origami-config)
(require 'clojure-config)
(require 'prolog-config)
(require 'aspell-config)
(require 'ethlance-config)

;; Random set of packages being loaded
(package-require 'ace-jump-mode)
(package-require 'clojure-mode)
(package-require 'dash)
(package-require 'expand-region)
(package-require 'iy-go-to-char)
(package-require 'multiple-cursors)
(package-require 'project-explorer)
(package-require 'undo-tree)
(package-require 'god-mode)
;;(package-require 'cider)

;; Called after all packages
(require 'powerline-config)


(if (system-type-is-win32)
    (setenv "PATH"
	    (concat
	     ;; Change this with your path to MSYS bin directory
	     "C:\\MinGW\\msys\\1.0\\bin;"
	     (getenv "PATH"))))

(require 'default-setup)
(require 'key-bindings)

;; Load custom.el file
(setq custom-file (expand-file-name "custom.el" lisp-dir))
(load custom-file t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "b47a3e837ae97400c43661368be754599ef3b7c33a39fd55da03a6ad489aafee" default)))
 '(erc-after-connect nil)
 '(erc-autojoin-mode t)
 '(erc-button-mode t)
 '(erc-fill-mode t)
 '(erc-irccontrols-mode t)
 '(erc-list-mode t)
 '(erc-lurker-threshold-time 3600)
 '(erc-match-mode t)
 '(erc-menu-mode t)
 '(erc-move-to-prompt-mode t)
 '(erc-netsplit-mode t)
 '(erc-networks-mode t)
 '(erc-nick "bacon1989")
 '(erc-noncommands-mode t)
 '(erc-notice-prefix "-- ")
 '(erc-pcomplete-mode t)
 '(erc-prompt ">>")
 '(erc-readonly-mode t)
 '(erc-ring-mode t)
 '(erc-stamp-mode t)
 '(erc-system-name "Who wants to know?")
 '(erc-track-minor-mode t)
 '(erc-track-mode t)
 '(erc-user-full-name "Benjamin Zaporzan")
 '(org-agenda-files (quote ("c:/Project.Repositories/iFIDS/Docs/API.org" "~/Projects/iFIDSDroidRemoteClient/readme.org" "~/Projects/iFIDSAdminUtility/readme.org" "c:/Project.Repositories/iFIDSBrowser2.0/readme.org" "c:/Project.Repositories/iFIDS/Docs/Specification/Spec_BaggageRouting.org" "~/Projects/iFIDSAndroid/readme.org" "~/org/apersonal.org" "~/org/diet.org" "~/org/exercise.org" "~/org/journal.org" "~/org/tasks.org" "~/org/finance.org" "~/org/notes.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(erc-current-nick-face ((t (:foreground "medium slate blue" :weight bold))))
 '(erc-input-face ((t (:foreground "slate blue"))))
 '(erc-my-nick-face ((t (:background "ivory4" :foreground "dark slate blue" :underline nil :weight bold))))
 '(erc-notice-face ((t (:foreground "dim gray" :slant italic :weight thin :height 0.9))))
 '(erc-prompt-face ((t (:foreground "dark orange" :weight ultra-bold))))
 '(erc-timestamp-face ((t (:foreground "DarkOrange4" :height 0.9)))))
(put 'downcase-region 'disabled nil)
