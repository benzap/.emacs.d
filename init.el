;;
;; Benzap's Emacs Configuration
;;
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Initial Package Manager Setup
(package-initialize)
(require 'init-package)


;; Defaults for every editor
(require 'init-defaults)

;; Eldoc Setup
(use-package eldoc-mode
  :diminish ElDoc
  :hook
  (emacs-lisp-mode
   lisp-interaction-mode
   ielm-mode))

;; Helm & Company Setup (Auto-Complete Libraries)
(use-package helm
  :ensure t
  :diminish Helm
  :init
  (require 'helm-config)
  (helm-mode 1)
  (define-key global-map [remap find-file] 'helm-find-files)
  (define-key global-map [remap occur] 'helm-occur)
  (define-key global-map [remap list-buffers] 'helm-buffers-list)
  (define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
  (define-key global-map [remap execute-extended-command] 'helm-M-x)
  (define-key global-map [remap apropos-command] 'helm-apropos))

(require 'my-config-company) ;; Include: company

(use-package helm-company
  :ensure t
  :after (helm company)
  :init
  (define-key company-mode-map (kbd "C-;") 'helm-company)
  (define-key company-active-map (kbd "C-;") 'helm-company))

;;
;; Appearance
;;
(require 'init-appearance)



;;
;; DONE
;;
(message "Welcome!")
