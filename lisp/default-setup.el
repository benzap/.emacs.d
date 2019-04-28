;;includes the setup of all emacs packages that are not in separate files
(require 'use-package)

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

;;(global-undo-tree-mode)

;;remove annoying backups, just use git
(setq backup-inhibited t)

;;disable auto save                                    
(setq auto-save-default nil)

(put 'narrow-to-region 'disabled nil)


(use-package subword
  :hook ((text-mode prog-mode) . subword-mode))


;;turn off electric indent
(electric-indent-mode 0)

;;auto fill mode for all text buffers
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;When on the mac, change the key settings to match other systems
(when (eq system-type 'darwin) ;; mac specific settings
  (setq mac-option-modifier 'alt)
  (setq mac-command-modifier 'meta)
  (setq mac-function-modifier 'control)
  (setq mac-control-modifier 'control)
  (global-set-key [kp-delete] 'delete-char))
  
(defalias 'tab-width 'default-tab-width)

;;turn off highlighting the copy regions
(transient-mark-mode 1)

;;custom registers 
;;some custom registers that can be navigated to with <f8> 
(set-register ?e '(file . "~/.emacs.d/init.el"))
(set-register ?d '(file . "~/priv/notes/diet.org"))
(set-register ?t '(file . "~/priv/notes/tasks.org"))
(set-register ?x '(file . "~/priv/notes/exercise.org"))
(set-register ?j '(file . "~/priv/notes/journal.org"))
(set-register ?a '(file . "~/priv/notes/apersonal.org"))
(set-register ?n '(file . "~/priv/notes/notes.org"))
(set-register ?w '(file . "~/priv/work/district0x/notes/work_journal.org"))

;;remove '^M' from DOS encoded files
(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))


(add-hook 'prog-mode-hook 'remove-dos-eol)
(add-hook 'text-mode-hook 'remove-dos-eol)
(add-hook 'sql-mode-hook 'remove-dos-eol)

;; Empty Scratch Buffer
(setq initial-scratch-message
      ";;;; Scratch Buffer ;;;;
;;
;; Key Combinations
;;

C-' ;; ace-jump-mode
,.  ;; expand-region

;; Bracket Navigation

<M  ;; backward-list
>?  ;; forward-list


      M-i      ;;
   M-j   M-l   ;; Navigation
      M-k      ;;


;; Multiple Cursors

;; Highlight Something and:
C-.  ;; Mark next like this
C-,  ;; Mark previous like this
C-!  ;; Mark all like this

;; Open Interactive Buffer
C-x C-b ;; ibuffer

;; Compilation Commands
C-; C-c ;; compile
C-; c   ;; compile

;; Comment or Uncomment
C-c C-c

;; Auto-fill-mode
C-c q

;; God Local Mode
f1

;; Revert Buffer
C-x C-r")

(provide 'default-setup)
