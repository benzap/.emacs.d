;;Main initialization of emacs

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-splash-screen t)

(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path site-lisp-dir)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

;;grab our set of utility functions
(require 'package-utils)
(require 'utils)

;;setup the appearance
(require 'appearance)

;;make sure we have included all of the necessary packages
(package-require 'ace-jump-mode)
(package-require 'auto-complete)
(package-require 'cider)
(package-require 'clojure-mode)
(package-require 'coffee-mode)
(package-require 'dash)
(package-require 'diff-hl)
(package-require 'escreen)
(package-require 'expand-region)
(package-require 'flx-ido)
(package-require 'git-auto-commit-mode)
(package-require 'graphviz-dot-mode)
(package-require 'ido-hacks)
(package-require 'idomenu)
(package-require 'iy-go-to-char)
(package-require 'key-chord)
(package-require 'lua-mode)
(package-require 'magit)
(package-require 'monky)
(package-require 'multiple-cursors)
;;(package-require 'plantuml-mode)
(package-require 'org-bullets)
(package-require 'project-explorer)
(package-require 'projectile)
(package-require 'rainbow-delimiters)
(package-require 'rainbow-mode)
(package-require 'smartparens)
;;(package-require 'sql-indent)
(require 'smartparens-config)
(defalias 'tab-width 'default-tab-width)
;;(package-require 'tsql)
(package-require 'undo-tree)
(package-require 'web-mode)
(package-require 'yasnippet)

(package-require 'mediawiki)
(package-require 'powershell-mode)



(if (system-type-is-win32)
    (setenv "PATH"
	    (concat
	     ;; Change this with your path to MSYS bin directory
	     "C:\\MinGW\\msys\\1.0\\bin;"
	     (getenv "PATH"))))

(require 'default-setup)
(require 'key-bindings)









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
