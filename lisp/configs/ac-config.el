(message "Loading auto-complete Configuration...")
(require 'package-utils)

;;Dependencies
(package-require 'auto-complete)

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

(provide 'ac-config)
