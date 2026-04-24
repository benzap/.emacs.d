;;; os.el --- Operating System Functions

(defun is-computer-name
    (name)
  "Return non-nil if NAME is equal to the COMPUTERNAME environment variable."
  (string= (getenv "COMPUTERNAME") name))

(defun is-mac-computer () (string= system-type "darwin"))

(provide 'os)
;;; os.el ends here
