;;; init-defaults.el --- My Editor Defaults
;;; Commentary:
;;; Author: Benjamin Zaporzan
;;; Code:

(set-language-environment "UTF-8")
(menu-bar-mode 0)                       ; Remove Menu Bar
(when (display-graphic-p)
  (toggle-scroll-bar 0))                ; Remove Scroll Bar

(tool-bar-mode 0)                       ; Remove Tool Bar
(blink-cursor-mode 0)                   ; Disable Cursor Blink
(show-paren-mode 1)                     ; Show Matching Parenthesis on hover
(electric-indent-mode 0)                ; Remove automatic indent after newline
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(defalias 'yes-or-no-p 'y-or-n-p)       ; Replace yes/no prompt with y/n prompt
(setq inhibit-startup-message t         ; Remove Splash Screen
      initial-scratch-message nil       ; Remove initial *scratch* buffer text
      tab-width 4                       ; Set Default Tab Width to 4
      backup-inhibited t                ; Get rid of file backups (use git)
      auto-save-default nil)            ; Get rid of auto-save (use git)

(defalias 'tab-width 'default-tab-width)

;;remove '^M' from DOS encoded files
(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(add-hook 'prog-mode-hook 'remove-dos-eol)
(add-hook 'text-mode-hook 'remove-dos-eol)
(add-hook 'sql-mode-hook 'remove-dos-eol)

;; Enable Narrow to Region
(put 'narrow-to-region 'disabled nil)


(provide 'init-defaults)
;;; init-defaults.el ends here
