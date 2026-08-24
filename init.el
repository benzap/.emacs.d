;; sanemacs.el Emacs Defaults
(load "~/.emacs.d/sanemacs.el" nil t)
(add-to-list 'load-path "~/.emacs.d/lisp")

;; Initial Scratchpad Should be in textpad mode
(setq initial-major-mode 'fundamental-mode)
(setq initial-scratch-message "")

(require 'package)

;; My Libraries.
(require 'os)

;; Repository Listing
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(use-package diminish :ensure t)

(use-package zig-mode
  :bind (("<f5>" . compile)
	 ("<f6>" . recompile)
	 ("C-<f5>" . compile)
	 ("C-<f6>" . recompile)))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
    '(zig-mode . (
      "zls"
      ;; There are two ways to set config options:
      ;;   - edit your `zls.json` that applies to any editor that uses ZLS
      ;;   - set in-editor config options with the `initializationOptions` field below.
      ;;
      ;; Further information on how to configure ZLS:
      ;; https://zigtools.org/zls/configure/
      :initializationOptions
        (;; Whether to enable build-on-save diagnostics
         ;;
         ;; Further information about build-on save:
         ;; https://zigtools.org/zls/guides/build-on-save/
         ;;enable_build_on_save t

         ;; omit the following line if `zig` is in your PATH
	 ;; :zig_exe_path "/path/to/zig_executable"
         )))))

(add-hook 'zig-mode-hook 'eglot-ensure)

;; Recent Files
(use-package recentf
  :config
  (recentf-mode 1)
  (setq recentf-max-menu-items 25)
  :bind (("C-x C-r" . recentf-open-files)))

;; Company, Auto-Complete
(use-package company
  :ensure t
  :diminish company-mode
  :init
  ;; Enable global company mode immediately after Emacs starts
  (add-hook 'after-init-hook 'global-company-mode)

  :config
  ;; Basic performance and UX tweaks
  (setq company-idle-delay 0.3)                ;; Delay before auto-completion starts (seconds)
  (setq company-minimum-prefix-length 2)       ;; Minimum characters to trigger completion
  (setq company-tooltip-limit 10)              ;; Max items in the popup
  (setq company-dabbrev-code-completion-styles '(basic flex)) ;; Enable fuzzy matching for dabbrev

  ;; Recommended backend order: prioritize CAPF (LSP integration) and files
  (setq company-backends
        '((company-capf company-keywords)
          company-dabbrev-code
          company-dabbrev)))

;; Interactively Do Everything (ido-mode)
(ido-mode t)

;; Interactive Buffer-Mode
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;
;; Appearance Configuration
;;

;; Set our default font
(defvar user-default-sans-font
  (when (display-graphic-p)
    (cond
     ((x-list-fonts "Source Sans Pro") "Source Sans Pro")
     ((x-list-fonts "Lucida Grande") "Lucida Grande")
     ((x-list-fonts "Verdana") "Verdana")
     ((x-family-fonts "Sans Serif") "Sans Serif")
     (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro.")))))

(defvar user-default-mono-font
  (when (display-graphic-p)
    (cond
     ((x-list-fonts "Inconsolata") "Inconsolata")
     ((x-family-fonts "Monospace") "Monospace")
     (nil (warn "Cannot find a Inconsolata Font.  Install Inconsolata.")))))

(when (display-graphic-p)
  (custom-theme-set-faces
   'user
   '(variable-pitch ((t (:family user-default-sans-font :height 180 :weight thin))))
   '(fixed-pitch ((t ( :family user-default-mono-font :height 160))))))

(when (display-graphic-p)
  (set-face-attribute 'default nil
		      :family user-default-mono-font
		      :height (cond
			       ((is-computer-name "ZAPTECH-HTPC")     160)
			       ((is-mac-computer)                     165)
			       ((is-computer-name "ZAPTECH-SERVER-1") 165)
			       (t                                     150))))


(use-package powerline
  :ensure t
  :init (powerline-default-theme)
  :config (set-face-attribute 'mode-line nil
            :foreground "Black"
            :background "olive drab"
            :box nil))

;; Better Individual Word Traversal.
(use-package subword
  :diminish subword-mode
  :hook ((text-mode prog-mode) . subword-mode))

(use-package key-chord
  :ensure t
  :init (key-chord-mode 1)
  :config
  (key-chord-define-global "<M" 'backward-list)
  (key-chord-define-global ">?" 'forward-list))

;; Mac specific bindings
;; rebind the modifier key to mimic general keyboards
(when (eq system-type 'darwin)
  (setq mac-option-modifier 'alt)
  (setq mac-command-modifier 'meta)
  (setq mac-function-modifier 'control)
  (setq mac-control-modifier 'control)
  (global-set-key [kp-delete] 'delete-char))

;; icons all the time theme
(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

;;(all-the-icons-install-fonts) ; Make sure the fonts are installed.

(use-package projectile
  :ensure t
  :bind ("C-c p" . 'projectile-command-map))

(declare neotree-project-dir)
;; Treeview
(use-package neotree
  :ensure t
  :after (projectile)
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq neo-window-width 30)
  (global-set-key (kbd "<f8>") 'neotree-toggle)
  (setq projectile-switch-project-action 'neotree-projectile-action)
  (global-set-key (kbd "C-x p") 'neotree-project-dir))

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (projectile-project-root))
        (file-name (buffer-file-name)))
    (neotree-toggle)
    (if project-dir
        (if (neo-global--window-exists-p)
            (progn
              (neotree-dir project-dir)
              (neotree-find file-name)))
      (message "Could not find git project root."))))

;;
;; Revert Buffer Keybind
;;
(global-set-key (kbd "C-x r") 'revert-buffer)

;; Flycheck
(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))


;; Clojure Config
(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode))

;;; init.el ends here
