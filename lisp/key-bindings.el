;;Includes all of the necessary key bindings

;;for setting tabs
(global-set-key (kbd "C-; t") 
		'(lambda () 
		   (interactive)
		   (set-variable 'tab-width 4)))
(global-set-key (kbd "C-; C-t") 
		'(lambda () 
		   (interactive)
		   (set-variable 'tab-width 4)))

(global-set-key (kbd "C-'") 'ace-jump-mode)

(key-chord-define-global ",." 'er/expand-region)
(key-chord-define-global "<M" 'backward-list)
(key-chord-define-global ">?" 'forward-list)
(key-chord-define-global "jj" 'ace-jump-mode)
(key-chord-define-global "yy" 'yank-pop)

;;iy-go-to-char better navigation
(global-set-key (kbd "M-m") 'iy-go-to-char)
(global-set-key (kbd "C-c C-r") 'rename-sgml-tag)

;;setting cursor movement for alt key plus ijkl
(global-set-key (kbd "M-j") 'backward-char)
(global-set-key (kbd "M-l") 'forward-char)
(global-set-key (kbd "M-i") 'previous-line)
(global-set-key (kbd "M-k") 'next-line)

;;unused
(defun ido-imenu-push-mark ()
  (interactive)
  (let ((push-mark-before-goto-char t))
    (idomenu)))

(global-set-key (kbd "C-x C-i") 'idomenu)


;;multiple cursors key bindings
(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-!") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;setup ibuffers
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(when (require 'plantuml-server nil t)
  (global-set-key (kbd "C-c s") 'plantuml-eval-to-browser)
  (global-set-key (kbd "C-c d") 'plantuml-eval-to-other-window))

;;used like M-x instead
(global-set-key (kbd "C-; C-;") 'execute-extended-command)
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

;;escreen navigation
;;function keys can be used to navigate between screens
(global-set-key (kbd "<f9>") 'escreen-create-screen)
(global-set-key (kbd "<f10>") 'escreen-goto-prev-screen)
(global-set-key (kbd "<f11>") 'escreen-goto-next-screen)
;;(global-set-key (kbd "<f12>") 'escreen-kill-screen)
(global-set-key (kbd "<f12>") 'escreen-prompt-kill-p)

;;Project Explorer Key
(global-set-key (kbd "M-p") 'project-explorer-open)

;;sane revert buffer key
(global-set-key (kbd "C-x C-r") 'revert-buffer)

;;set a point with f7
(global-set-key (kbd "<f7>") 'point-to-register)
;;jump to that point with f8
(global-set-key (kbd "<f8>") 'jump-to-register)

;;function for compiling code
(global-set-key (kbd "<f5>") 'recompile)

(global-set-key (kbd "<f1>") 'god-local-mode)


(provide 'key-bindings)
