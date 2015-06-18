(message "Loading visual-basic Configuration")
(require 'package-utils)

;;Dependencies
;;...

;;if the visual-basic-mode.el file exists, add the mode for it
(let ((vb-file "~/.emacs.d/lisp/visual-basic-mode.el"))
  (when (file-exists-p vb-file)
    (progn
      (load-file vb-file)
      (add-to-list 'auto-mode-alist '("\\.vb$" . visual-basic-mode))
      (add-to-list 'auto-mode-alist '("\\.cls$" . visual-basic-mode)))))

(provide 'visual-basic-config)
