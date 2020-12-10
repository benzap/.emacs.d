;; Package Initialization
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(when (not package-archive-contents)
  (message "Refreshing Packages...")
  (package-refresh-contents))

;; Retrieve and setup use-package
(when (not (package-installed-p 'use-package))
  (message "Installing Use Package Library...")
  (package-install 'use-package))
(require 'use-package)

;; Automatically Update Packages
(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions  t
	auto-package-update-prompt-before-update t
	auto-package-update-hide-results         t
        auto-package-update-interval             14)
  (auto-package-update-maybe))

(provide 'init-package)
