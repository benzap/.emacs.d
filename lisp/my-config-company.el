;;; my-config-company.el --- Company Package Configuration
;;; Commentary:
;;; Author: Benjamin Zaporzan
;;; Code:

(require 'use-package)

(use-package company
  :ensure t
  :diminish company-mode
  :init
  (setq company-backends '((company-files
                            company-keywords
                            company-capf
                            company-dabbrev-code
                            company-etags
                            company-dabbrev))
        company-tooltip-align-annotations t)
  :config
  (global-company-mode 1))


(provide' my-config-company)
;;; my-config-company.el ends here
