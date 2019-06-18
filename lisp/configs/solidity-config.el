;; Solidity-mode Configuration


(use-package solidity-mode
  :ensure t
  :mode "\\.sol\\'"
  :interpreter ("solc" . solidity-mode)
  :config
  (setq-default c-basic-offset 2)
  (setq default-tab-width 2)
  (setq indent-tabs-mode nil)
  (message "Loading solidity-mode Configuration..."))


(provide 'solidity-config)
