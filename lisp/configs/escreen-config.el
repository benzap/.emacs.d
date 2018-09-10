(message "Loading escreen Configuration...")
(require 'package-utils)

;;Dependencies
(package-require 'elscreen)

;;Escreen setup functionality
(elscreen-start)
(elscreen-toggle-display-tab)
(setq elscreen-prefix-char "\C-z")
(global-set-key elscreen-prefix-char 'elscreen-prefix)

;;Function to prompt before killing the given screen
(defun elscreen-prompt-kill-p ()
  "Prompts the user whether they want to kill the current screen,
kills the screen if true"
  (interactive)
  (if (y-or-n-p "Kill Current Escreen?") 
      (elscreen-kill)))

(provide 'escreen-config)
