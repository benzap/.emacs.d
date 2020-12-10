;; Absolute Defaults for every emacs text editor.

(menu-bar-mode 0)                       ; Remove Menu Bar
(toggle-scroll-bar 0)                   ; Remove Scroll Bar
(tool-bar-mode 0)                       ; Remove Tool Bar
(blink-cursor-mode 0)                   ; Disable Cursor Blink
(show-paren-mode 1)                     ; Show Matching Parenthesis on hover
(defalias 'yes-or-no-p 'y-or-n-p)       ; Replace yes/no prompt with y/n prompt
(setq inhibit-startup-message t)        ; Remove Splash Screen
(setq initial-scratch-message nil)      ; Remove initial *scratch* buffer text

(provide 'init-defaults)
