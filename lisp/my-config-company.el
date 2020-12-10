(use-package company
  :ensure t
  :defer t
  :init
  (setq company-backends '((company-files
			    company-keywords
			    company-capf
			    company-dabbrev-code
			    company-etags
			    company-dabbrev)))
  :config
  (global-company-mode 1))

(provide' my-config-company)
