;; Clojure Configuration


(use-package inf-clojure
  :ensure t
  :after (clojure-mode)
  :commands (inf-clojure-connect)
  :config
  (message "inf-clojure Configuring...")
  (add-hook 'clojure-mode-hook #'inf-clojure-minor-mode))


(use-package clojure-mode
  :ensure t
  :hook clojure-mode
  :mode "\\.clj\\'"
  :config
  (message "Loading Clojure Configuration..."))


(use-package clojurescript-mode
  :after (clojure-mode)
  :hook clojurescript-mode
  :mode "\\.cljs\\'"
  :config
  (message "Loading Clojurescript Configuration..."))


(use-package clojurec-mode
  :after (clojure-mode)
  :hook clojurec-mode
  :mode "\\.cljc\\'"
  :config
  (message "Loading ClojureC Configuration..."))


(use-package cider
  :commands (cider-jack-in cider-connect cider-connect-clj cider-connect-cljs)
  :ensure t
  :after (clojure-mode clojurescript-mode clojurec-mode)
  :hook (cider-mode . cider-mode-config)
  :config
  (message "Loading Cider Configuration...")
  (add-to-list 'cider-test-defining-forms "deftest-db")
  (local-set-key (kbd "C-c b") 'cider-eval-buffer))


(provide 'clojure-config)
