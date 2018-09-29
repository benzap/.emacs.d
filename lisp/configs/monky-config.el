;; Monky Configuration


(use-package monky
  :ensure t
  :commands (monky)
  :config
  (message "Loading Monky Configuration...")
  (setq monky-process-type 'cmdserver))
  

(provide 'monky-config)
