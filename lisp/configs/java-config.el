;; Java Configuration

(require 'cc-mode)

(use-package lsp-java
 :ensure t
 :hook (java-mode . lsp))

(use-package projectile :ensure t)
(use-package treemacs :ensure t)
;;(use-package yasnippet :ensure t)
(use-package lsp-mode :ensure t)
(use-package hydra :ensure t)
(use-package company-lsp :ensure t)
(use-package lsp-ui :ensure t)

(use-package lsp-java
  :ensure t
  :after lsp
  :config (add-hook 'java-mode-hook 'lsp))

(use-package dap-mode
  :ensure t
  :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(use-package dap-java :after (lsp-java))
(use-package lsp-java-treemacs :after (treemacs))



;; add lombok support
;; https://projectlombok.org/
(setq lsp-java-vmargs 
      '("-noverify"
        "-Xmx1G"
        "-XX:+UseG1GC"
        "-XX:+UseStringDeduplication"
        "-javaagent:/home/filip/.m2/repository/org/projectlombok/lombok/1.18.6/lombok-1.18.6.jar"
        "-Xbootclasspath/a:/home/filip/.m2/repository/org/projectlombok/lombok/1.18.6/lombok-1.18.6.jar"))


(defun java-hook-handler ()
  (add-hook 'before-save-hook 'whitespace-cleanup nil 'local))


(use-package java-mode
  :ensure t
  :hook
  (java-mode . java-hook-handler))


(provide 'java-config)
