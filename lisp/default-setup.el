;;includes the setup of all emacs packages that are not in separate files

(defvar push-mark-before-goto-char nil) 
(defadvice goto-char (before push-mark-first activate)
  (when push-mark-before-goto-char
    (push-mark)))

;;show matching parenthesis
(show-paren-mode 1)

;;replace yes or no with y-or-n
(defalias 'yes-or-no-p 'y-or-n-p)

;;change tab widths
(setq tab-width 4)

;;add support for better file browsing
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(global-undo-tree-mode)

;;remove annoying backups, just use git
(setq backup-inhibited t)
;;disable auto save                                    
(setq auto-save-default nil)

;;screensaver functionality

;;zone out the display when it goes idle for a given length of time
(setq zone-idle-time 300)
(setq zone-timer (run-with-idle-timer zone-idle-time t 'zone))
(setq zone-programs [
		     zone-pgm-drip
		     zone-pgm-drip-fretfully
		     ])

(put 'narrow-to-region 'disabled nil)

;;yasnippet
(yas-global-mode 1)

(global-auto-complete-mode)
(when (require 'auto-complete-config nil t)
      (add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20130724.1750/dict")
      (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
  (ac-config-default)
  (ac-set-trigger-key "TAB")
  (ac-set-trigger-key "<tab>")

  ;;(setq ac-sources (append '(ac-source-yasnippet) ac-sources))

  ;;change colours for auto-complete-mode
  (set-face-background 'ac-candidate-face "LightGray")
  (set-face-underline 'ac-candidate-face "LimeGreen")
  (set-face-background 'ac-selection-face "DarkGreen"))

;;Org Setup
(when (require 'org-install nil t)
  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (setq org-log-done t)
  (setq org-agenda-files (list "~/org/apersonal.org"
			       "~/org/diet.org" 
			       "~/org/exercise.org"
			       "~/org/journal.org"
			       "~/org/tasks.org"
			       "~/org/finance.org"
			       "~/org/notes.org"))
  (setq org-directory "~/org")
  (setq org-default-notes-file (concat org-directory "/refile.org"))
  (define-key global-map "\C-cc" 'org-capture)

  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

  ;;adding autocommit hook this will automatically commit and push the
  ;; org file after it's been saved
  (package-require 'git-auto-commit-mode)

  ;;perform correct pushing after commit command
  (defadvice gac-commit (after gac-push-alt ())
    "Performs a simple shell-based push using git"
    (shell-command "git push"))
  (ad-activate 'gac-commit)
  
  (defun git-auto-commit-hook ()
    ;;check if we're currently in an org-agenda file
    (let ((filelist org-agenda-files))
      (if (member (concat org-directory "/" (buffer-name)) org-agenda-files)
	  (git-auto-commit-mode 1))))

  (add-hook 'find-file-hook 'git-auto-commit-hook)

  ;;Custom Agenda Commands
  (setq org-agenda-custom-commands
	'(("w" . "Work Related Searches")
	  ("wa" "All Work" tags-todo "WORK")
	  ("wi" "iFIDS Work" tags-todo "WORK|IFIDS")
	  ("g" "Groceries and Shopping" tags-todo "FOOD|SHOP")
	  ("b" "Books" tags "BOOK")))
  
  (setq org-capture-templates
	'(("t" "Todo Task" entry (file+headline "~/org/tasks.org" "Tasks")
	   "* TODO %? %^g")
	  ("p" "Project Task" entry (file+headline "~/org/tasks.org" "Projects")
	   "* TODO %? %^g")
	  ("w" "Work Task" entry (file+headline "~/org/tasks.org" "Work")
	   "* TODO %? %^g")
	  ("j" "Journal" entry (file+datetree "~/org/journal.org")
	   "* %?\nEntered on %U\n  %i\n  %a")
	  ("f" "Food Entry" entry (file+headline "~/org/diet.org" "Refile")
	   "* %U - %?:FOOD:")
	  ("r" "Refile" entry (file+headline "~/org/tasks.org" "Refile")
	   "* %U - %? %^g:NOTE:"))))


;;plantuml-server setup
(add-to-list 'load-path "~/.emacs.d/plantuml-server")
(add-to-list 'auto-mode-alist '("\\.plant$" . plantuml-mode))

;;monky setup
(setq monky-process-type 'cmdserver)

;;lua setup
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
(setq lua-indent-level 4)
(add-hook 'lua-mode-hook (lambda () (setq tab-width 4)))

;;fix issues with c++11 variables not being understood
(require 'font-lock)
(defun --copy-face (new-face face)
  "Define NEW-FACE from existing FACE."
  (copy-face face new-face)
  (eval `(defvar ,new-face nil))
  (set new-face new-face))
(--copy-face 'font-lock-label-face  ; labels, case, public, private, proteced, namespace-tags
         'font-lock-keyword-face)
(--copy-face 'font-lock-doc-markup-face ; comment markups such as Javadoc-tags
         'font-lock-doc-face)
(--copy-face 'font-lock-doc-string-face ; comment markups
         'font-lock-comment-face)
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(add-hook 'c++-mode-hook
      '(lambda()
        (font-lock-add-keywords
         nil '(;; complete some fundamental keywords
           ("\\<\\(void\\|unsigned\\|signed\\|char\\|short\\|bool\\|int\\|long\\|float\\|double\\)\\>" . font-lock-keyword-face)
           ;; add the new C++11 keywords
           ("\\<\\(alignof\\|alignas\\|constexpr\\|decltype\\|noexcept\\|nullptr\\|static_assert\\|thread_local\\|override\\|final\\)\\>" . font-lock-keyword-face)
           ("\\<\\(char[0-9]+_t\\)\\>" . font-lock-keyword-face)
           ;; PREPROCESSOR_CONSTANT
           ("\\<[A-Z]+[A-Z_]+\\>" . font-lock-constant-face)
           ;; hexadecimal numbers
           ("\\<0[xX][0-9A-Fa-f]+\\>" . font-lock-constant-face)
           ;; integer/float/scientific numbers
           ("\\<[\\-+]*[0-9]*\\.?[0-9]+\\([ulUL]+\\|[eE][\\-+]?[0-9]+\\)?\\>" . font-lock-constant-face)
           ;; user-types (customize!)
           ("\\<[A-Za-z_]+[A-Za-z_0-9]*_\\(t\\|type\\|ptr\\)\\>" . font-lock-type-face)
           ("\\<\\(xstring\\|xchar\\)\\>" . font-lock-type-face)
           ))
        ) t)

;;auto fill mode for all text buffers
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;ERC nick coloring

;; Pool of colors to use when coloring IRC nicks
(setq erc-colors-list '("forest green" 
			"blue" 
			"red"
			"light gray" 
			"dark orange"
			"tomato"
			"goldenrod" 
			"maroon"
			"indian red"
			"dark khaki"
			"orchid"
			"SeaGreen3"
			"forest green"
			"peach puff"
			"steel blue" 
			"medium aquamarine"))
;; special colors for some people
(setq erc-nick-color-alist '(("John" . "blue")
			     ("Bob" . "red")
			     ))

(defun erc-get-color-for-nick (nick)
  "Gets a color for NICK. If NICK is in erc-nick-color-alist, use that color, else hash the nick and use a random color from the pool"
  (or (cdr (assoc nick erc-nick-color-alist))
      (nth
       (mod (string-to-number
	     (substring (md5 (downcase nick)) 0 6) 16)
	    (length erc-colors-list))
       erc-colors-list)))

(defun erc-put-color-on-nick ()
  "Modifies the color of nicks according to erc-get-color-for-nick"
  (save-excursion
    (goto-char (point-min))
    (if (looking-at "<\\([^>]*\\)>")
	(let ((nick (match-string 1)))
	  (put-text-property (match-beginning 1) (match-end 1) 'face
			     (cons 'foreground-color
				   (erc-get-color-for-nick nick)))))))

(add-hook 'erc-insert-modify-hook 'erc-put-color-on-nick)

(setq erc-lurker-threshold-time 3600)

;;Escreen setup functionality
(escreen-install)
(escreen-number-mode 1)
(setq escreen-prefix-char "\C-z")
(global-set-key escreen-prefix-char 'escreen-prefix)

;;Function to prompt before killing the given screen
(defun escreen-prompt-kill-p ()
  "Prompts the user whether they want to kill the current screen,
kills the screen if true"
  (interactive)
  (if (y-or-n-p "Kill Current Escreen?") 
      (escreen-kill-screen)))

;;cc-mode indentation fix
;;fixing indentation for long names
(defun my-indent-setup ()
      (c-set-offset 'arglist-intro '+))
(add-hook 'cc-mode-hook 'my-indent-setup)

;;the c/c++ programming style to use
(setq c-default-style "gnu"
      c-basic-offset 4)

(defun my-diff-hl-find-file-hook ()
  (diff-hl-mode))
(add-hook 'find-file-hook 'my-diff-hl-find-file-hook)

;;When on the mac, change the key settings to match other systems
(when (eq system-type 'darwin) ;; mac specific settings
  (setq mac-option-modifier 'alt)
  (setq mac-command-modifier 'meta)
  (setq mac-function-modifier 'control)
  (setq mac-control-modifier 'control)
  (global-set-key [kp-delete] 'delete-char))
  
;;smartparens settings
(add-hook 'emacs-lisp-mode-hook 'turn-on-smartparens-mode)
(add-hook 'clojure-mode-hook 'turn-on-smartparens-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-smartparens-mode)
(add-hook 'ielm-mode-hook 'turn-on-smartparens-mode)
(add-hook 'cider-mode-hook 'turn-on-smartparens-mode)

;;setting up eldoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;;rainbow global hook
(defun my-rainbow-find-file-hook ()
  ;;(rainbow-blocks-mode)
  (rainbow-delimiters-mode)
  (subword-mode))
(add-hook 'find-file-hook 'my-rainbow-find-file-hook)

;;turn off highlighting the copy regions
(transient-mark-mode 1)

;;custom registers 
;;some custom registers that can be navigated to with <f8> 
(set-register ?e '(file . "~/.emacs.d/init.el"))
(set-register ?d '(file . "~/org/diet.org"))
(set-register ?t '(file . "~/org/tasks.org"))
(set-register ?x '(file . "~/org/exercise.org"))
(set-register ?j '(file . "~/org/journal.org"))
(set-register ?a '(file . "~/org/apersonal.org"))
(set-register ?n '(file . "~/org/notes.org"))

;;web-mode configuration
(add-to-list 'auto-mode-alist '("\\.asp$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.aspx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))

;;web-mode hook changes
(defun web-mode-hook ()
  "Hooks for web-mode (.asp, .php, .mustache, etc)"
  (auto-complete-mode 1)
  (setq tab-width 4)
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4))

(add-hook 'web-mode-hook 'web-mode-hook)

;;if the visual-basic-mode.el file exists, add the mode for it
(let ((vb-file "~/.emacs.d/visual-basic-mode.el"))
  (when (file-exists-p vb-file)
    (progn
      (load-file vb-file)
      (add-to-list 'auto-mode-alist '("\\.vb$" . visual-basic-mode))
      (add-to-list 'auto-mode-alist '("\\.cls$" . visual-basic-mode)))))

;;projectile setup
(projectile-global-mode)

;;key-chord setup
(key-chord-mode t)

;;sql setup
(eval-after-load "sql"
  '(progn
     '(load-library "tsql")
     '(load-library "sql-indent")
     '(setq sql-product 'ms)))

;;remove '^M' from DOS encoded files
(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(add-hook 'text-mode-hook 'remove-dos-eol)
(add-hook 'sql-mode-hook 'remove-dos-eol)



(provide 'default-setup)
