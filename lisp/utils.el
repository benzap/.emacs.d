;;Provides several utilities for determining the type of OS, etc

;; Check if system is Darwin/Mac OS X
(defun system-type-is-darwin ()
  "Return true if system is darwin-based (Mac OS X)"
  (interactive)
  (string-equal system-type "darwin"))

;;(system-type-is-darwin)

;; Check if system is GNU/Linux
(defun system-type-is-gnu ()
  (interactive)
  "Return true if system is GNU/Linux-based"
  (string-equal system-type "gnu/linux"))

;;(system-type-is-gnu)

;; Check if system is Win32
(defun system-type-is-win32 ()
  (interactive)
  "Return true if system is GNU/Linux-based"
  (string-equal system-type "windows-nt"))

;;(system-type-is-win32)

(provide 'utils)
