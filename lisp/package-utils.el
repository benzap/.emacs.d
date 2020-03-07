;;Includes functions for performing package installs when necessary

(setq package-check-signature nil)

(setq package-archives
      '(("melpa" . "https://melpa.milkbox.net/packages/") 
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("marmalade" . "https://marmalade-repo.org/packages/")))
        ;;("melpa-stable" . "https://stable.melpa.org/packages/")


(package-initialize)


(unless package-archive-contents
  (package-refresh-contents))


(defun package-require (package-name)
  "Retrieves the package before require'ing it if it is not
   installed."
  (unless (package-installed-p package-name)
    (package-install package-name))
  (require package-name nil t))


(provide 'package-utils)
