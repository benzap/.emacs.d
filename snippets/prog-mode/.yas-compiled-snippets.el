;;; Compiled snippets and support files for `prog-mode'
;;; contents of the .yas-setup.el support file:
;;;
(defun yas-with-comment (str)
  (format "%s%s%s" comment-start str comment-end))
;;; Snippet definitions:
;;;
(yas-define-snippets 'prog-mode
		     '(("x" "`(yas-with-comment \"XXX: \")`" "xxx" nil nil nil "c:/Users/benzap/.emacs.d/snippets/prog-mode/xxx" nil nil)
		       ("t" "`(yas-with-comment \"TODO: \")`" "todo" nil nil nil "c:/Users/benzap/.emacs.d/snippets/prog-mode/todo" nil nil)
		       ("fi" "`(yas-with-comment \"FIXME: \")`" "fixme"
			(not
			 (eq major-mode 'sh-mode))
			nil nil "c:/Users/benzap/.emacs.d/snippets/prog-mode/fixme" nil nil)))


;;; Do not edit! File generated at Sun Nov  5 04:51:55 2017
