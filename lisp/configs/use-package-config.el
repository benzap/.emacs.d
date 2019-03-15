;; use-package can be used to speed up initialization of emacs
(message "Loading use-package Configuration...")

(eval-when-compile
  (package-require 'use-package))

(package-require 'diminish)
(package-require 'bind-key)

;; Can be used with *nix and osx to ensure certain programs get
;; installed.
(use-package use-package-ensure-system-package
  :ensure t)

;; Adds key-chord support to use-package
(use-package use-package-chords
  :ensure t
  :config (key-chord-mode 1))


(provide 'use-package-config)
