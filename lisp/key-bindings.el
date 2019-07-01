;;Includes all of the necessary key bindings

(use-package ace-jump-mode
  :ensure t
  :bind (("C-'" . ace-jump-mode)))

(use-package expand-region
  :ensure t
  :commands (er/expand-region)
  :chords ((",." . er/expand-region)))

(key-chord-define-global "<M" 'backward-list)
(key-chord-define-global ">?" 'forward-list)

;;iy-go-to-char better navigation
(use-package iy-go-to-char
  :ensure t
  :bind (("M-m" . iy-go-to-char)))

(global-set-key (kbd "C-c C-r") 'rename-sgml-tag)

;;setting cursor movement for alt key plus ijkl
(global-set-key (kbd "M-j") 'backward-char)
(global-set-key (kbd "M-l") 'forward-char)
(global-set-key (kbd "M-i") 'previous-line)
(global-set-key (kbd "M-k") 'next-line)


;;multiple cursors key bindings
(use-package multiple-cursors
  :ensure t
  :commands (mc/mark-next-like-this
             mc/mark-previous-like-this
             mc/mark-all-like-this
             mc/edit-lines)
  :bind (("C-." . mc/mark-next-like-this)
         ("C-," . mc/mark-previous-like-this)
         ("C-!" . mc/mark-all-like-this)))


;; setup ibuffers
(use-package ibuffer
  :bind (("C-x C-b" . ibuffer)))

;;used like M-x instead
(global-set-key (kbd "C-; ;") 'execute-extended-command)


;;can also be used to evaluate sexp
(global-set-key (kbd "C-; C-e") 'eval-last-sexp)
(global-set-key (kbd "C-; e") 'eval-last-sexp)

;;compile code
(global-set-key (kbd "C-; C-c") 'compile)
(global-set-key (kbd "C-; c") 'compile)

;;comment and uncomment code quickly
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)

;;autofill toggle
(global-set-key (kbd "C-c q") 'auto-fill-mode)

(use-package god-mode
  :commands (god-local-mode)
  :bind (([f1] . god-local-mode)))

;;function for compiling code
(global-set-key (kbd "<f5>") 'recompile)

;;set a point with f7
(global-set-key (kbd "<f7>") 'point-to-register)
;;jump to that point with f8
(global-set-key (kbd "<f8>") 'jump-to-register)

;;sane revert buffer key
(global-set-key (kbd "C-x C-r") 'revert-buffer)


(provide 'key-bindings)
