;; Solidity-mode Configuration


(use-package solidity-mode
  :ensure t
  :mode "\\.sol\\'"
  :interpreter ("solc" . solidity-mode)
  :config
  (message "Loading solidity-mode Configuration..."))


(provide 'solidity-config)
