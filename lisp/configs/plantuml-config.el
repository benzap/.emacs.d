(message "Loading PlantUML Configuration...")

(require 'package-utils)

;;Package dependencies
(package-require 'graphviz-dot-mode)
(package-require 'plantuml-mode)


;;plantuml-server setup
(add-to-list 'load-path "~/.emacs.d/plantuml-server")
(add-to-list 'auto-mode-alist '("\\.plant$" . plantuml-mode))

;;org-bable setup
;;(org-babel-do-load-languages ‘org-babel-load-languages ‘((plantuml . t)))
(setq org-plantuml-jar-path (expand-file-name "~/plantuml.jar"))
;;(setq org-babel-load-languages '((emacs-lisp . t) (plantuml . t)))


(with-eval-after-load 'org
 (org-babel-do-load-languages 'org-babel-load-languages 
  '((python . t)
    (emacs-lisp . t)
    (plantuml . t))))

;;(org-toggle-inline-images)

(provide 'plantuml-config)
