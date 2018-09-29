;; PlantUML Configuration


(use-package graphviz-dot-mode
  :ensure t
  :mode ("\\.dot\\'" "\\.gv\\'")
  :config
  (message "Loading Graphviz Configuration..."))


(use-package plantuml-mode
  :ensure t
  :mode "\\.plant\\'"
  :config
  (message "Loading PlantUML Configuration..."))


(use-package plantuml-server
  :commands (plantuml-eval-to-browser plantuml-eval-to-other-window)
  :load-path "~/.emacs.d/plantuml-server"
  :after (:any graphviz-dot-mode plantuml-mode)
  :bind (("C-c s" . plantuml-eval-to-browser)
         ("C-c d" . plantuml-eval-to-other-window))
  :config
  (message "Loading plantuml-server Configuration..."))


(setq org-plantuml-jar-path (expand-file-name "~/plantuml.jar"))


(with-eval-after-load 'org
  (org-babel-do-load-languages 
   'org-babel-load-languages
   '((python . t)
     (emacs-lisp . t)
     (plantuml . t))))


(provide 'plantuml-config)
