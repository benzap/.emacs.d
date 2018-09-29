(message "Loading powerline Configuration...")

;;Dependencies
(package-require 'powerline)

;; Initialize main theme
(powerline-default-theme)

;; Change Colors
(set-face-attribute 'mode-line nil
                    :foreground "Black"
                    :background "olive drab"
                    :box nil)


;; Remove Common Minor-modes from powerline
;; These packages need to have been evaluated
(diminish 'undo-tree-mode)
(diminish 'auto-complete-mode)
(diminish 'yas-minor-mode)
(diminish 'smartparens-mode)
(diminish 'eldoc-mode)
(diminish 'auto-revert-mode)

(provide 'powerline-config)
