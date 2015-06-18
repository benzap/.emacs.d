(message "Loading escreen Configuration...")
(require 'package-utils)

;;Dependencies
(package-require 'escreen)

;;Escreen setup functionality
(escreen-install)
(escreen-number-mode 1)
(setq escreen-prefix-char "\C-z")
(global-set-key escreen-prefix-char 'escreen-prefix)

;;Function to prompt before killing the given screen
(defun escreen-prompt-kill-p ()
  "Prompts the user whether they want to kill the current screen,
kills the screen if true"
  (interactive)
  (if (y-or-n-p "Kill Current Escreen?") 
      (escreen-kill-screen)))

(provide 'escreen-config)
