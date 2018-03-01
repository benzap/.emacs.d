(message "Loading clojure Configuration...")
(require 'package-utils)

;; Dependencies
(package-require 'clojure-mode)
(package-require 'inf-clojure)


(autoload 'inf-clojure "inf-clojure" "Run an inferior Clojure process" t)
(add-hook 'clojure-mode-hook #'inf-clojure-minor-mode)


(defun cljs-node-repl ()
  (interactive)
  (run-clojure "boot cljs-repl"))


(provide 'clojure-config)
