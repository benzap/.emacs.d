;; Origami Configuration


(use-package origami
  :ensure t
  :commands (origami-recursively-toggle-node
             origami-toggle-all-nodes
             origami-show-only-node)
  :bind (:map origami-mode-map
         ([C-tab] . origami-recursively-toggle-node)
         ("C-c C-o" . origami-toggle-all-nodes)
         ("C-c C-p" . origami-show-only-node))
  :config
  (message "Loading origami Configuration...")
  (global-origami-mode))


(provide 'origami-config)
