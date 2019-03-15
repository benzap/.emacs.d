;; Contains functions for parsing the files contained in
;; github.com/benzap/the-stoic-library/resources/books


(defun re-begin-paragraph-whitespace ()
  (interactive)
  (re-search-forward "^\\( \\{3,\\}\\)"))


(defun replace-next-fill-paragraph ()
  (interactive)
  (when (re-begin-paragraph-whitespace)
    (replace-match "\n")))


(defun re-begin-page-definer ()
  (interactive)
  (re-search-forward "^<.*> *$"))


(defun re-title-w-roman (title)
  (interactive "sTitle: ")
  (re-search-forward (format "^%s.*$" title)))


(defun remove-page-definer ()
  (interactive)
  (when (re-begin-page-definer)
    (replace-match "")
    (delete-blank-lines)
    (delete-blank-lines)))


(defun remove-title-w-roman (title)
  (interactive "sTitle: ")
  (when (re-title-w-roman title)
    (replace-match "")
    (delete-blank-lines)))


(defun remove-pagestamp-epistle ()
  (interactive)
  (remove-page-definer)
  (remove-title-w-roman "EPISTLE"))


(defun re-start-letter-spacer ()
  (interactive)
  (re-search-forward "^\\([A-Z]\\) [a-zA-Z]+"))


(defun format-start-of-paragraph-spacer ()
  (interactive)
  (when (re-start-letter-spacer)
    (beginning-of-line)
    (right-char 1)
    (delete-char 1)))
    
