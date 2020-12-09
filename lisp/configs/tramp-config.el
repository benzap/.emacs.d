;; Tramp Configuration

(setq putty-directory "/bin")

(when (eq window-system 'w32)
  (setq tramp-default-method "plink")
  (when (and (not (string-match putty-directory (getenv "PATH"))))
       (file-directory-p putty-directory)
    (setenv "PATH" (concat putty-directory ";" (getenv "PATH")))
    (add-to-list 'exec-path putty-directory)))

(provide 'tramp-config)
