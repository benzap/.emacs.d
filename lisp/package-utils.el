;;Includes functions for performing package installs when necessary

(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
                         ;;("marmalade" . "https://marmalade-repo.org/packages/")
			 ))


(package-initialize)


(unless package-archive-contents
  (package-refresh-contents))


(defun old-package-require (package-name)
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


(defun package-require (package-name)
  "Retrieves the package before require'ing it if it is not
   installed."
  (unless (package-installed-p package-name)
    (package-install package-name))
  (require package-name nil t))


(provide 'package-utils)
