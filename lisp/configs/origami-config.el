(message "Loading origami Configuration...")
(require 'package-utils)

;;Dependencies
(package-require 'origami)

;; Global Initialize
(global-origami-mode)

;; Origami Keybindings
(define-key origami-mode-map (kbd "<C-tab>") 'origami-recursively-toggle-node)
(define-key origami-mode-map (kbd "C-c C-o") 'origami-toggle-all-nodes)
(define-key origami-mode-map (kbd "C-c C-p") 'origami-show-only-node)

(provide 'origami-config)
