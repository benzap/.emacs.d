;; Themes and Styling

;; Theme Package
(use-package monokai-theme
  :ensure t
  :init
  (if (eq system-type 'windows-nt)
      (add-hook 'window-setup-hook '(lambda () (load-theme 'monokai t)))
    (add-hook 'after-init-hook '(lambda () (load-theme 'monokai t))))
  :config (load-theme 'monokai t))

;; Font
(add-to-list 'default-frame-alist
             '(font . "Inconsolata-14"))


(provide 'init-appearance)
