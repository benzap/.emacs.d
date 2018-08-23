(message "Loading ethlance Configuration...")
(require 'package-utils)


;; Dependencies

(defcustom ethlance-project-directory
  "~/projects/ethlance"
  "Root directory of ethlance repo")

(defun ethlance-project-exists? ()
  (file-exists-p (concat ethlance-project-directory "/project.clj")))

;;(ethlance-project-exists?)

(when (ethlance-project-exists?)
  (add-to-list 'load-path ethlance-project-directory)
  (require 'ethlance)
  (setq ethlance-root ethlance-project-directory))

(provide 'ethlance-config)
