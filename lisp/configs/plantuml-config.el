(message "Loading PlantUML Configuration...")

(require 'package-utils)

;;Package dependencies
(package-require 'graphviz-dot-mode)
(package-require 'plantuml-mode)


;;plantuml-server setup
(add-to-list 'load-path "~/.emacs.d/plantuml-server")
(add-to-list 'auto-mode-alist '("\\.plant$" . plantuml-mode))


(provide 'plantuml-config)
