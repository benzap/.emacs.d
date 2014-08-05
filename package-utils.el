;;Includes functions for performing package installs when necessary

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(setq package-refresh-first-time nil)
(defun package-require (package-name)
  "tries to require. If it fails, it retrieves the package and
tries to require again"
  (if (not (require package-name nil t))
      (progn
	(if (not package-refresh-first-time)
	    (save-excursion 
	      (package-refresh-contents)
	      (setq package-refresh-contents t)))
	(package-install package-name)
	(require package-name nil t))))

(provide 'package-utils)
