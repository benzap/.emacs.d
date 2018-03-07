(message "Loading clojure Configuration...")
(require 'package-utils)

;; Dependencies
(package-require 'clojure-mode)
(package-require 'inf-clojure)
(package-require 'cider)


(defun load-inf-clojure ()
  (interactive)
  (autoload 'inf-clojure "inf-clojure" "Run an inferior Clojure process" t)
  (add-hook 'clojure-mode-hook #'inf-clojure-minor-mode))


(defun cider-mode-config ()
  (local-set-key (kbd "C-c b") 'cider-eval-buffer))


(defun load-cider ()
  (interactive)
  (add-hook 'cider-mode-hook 'cider-mode-config)
  
  ;; New testing forms defined for hsynapse
  (add-to-list 'cider-test-defining-forms "deftest-db"))


(load-cider)


(defun cljs-node-repl ()
  (interactive)
  (run-clojure "boot cljs-repl"))


(provide 'clojure-config)
