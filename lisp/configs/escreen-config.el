;; elscreen Configuration


(use-package elscreen
  :ensure t
  :functions elscreen-prompt-kill-p
  :commands (elscreen-create
	     elscreen-next
	     elscreen-previous
	     elscreen-kill) 

  :bind (([f9] . elscreen-create)
         ([f10] . elscreen-previous)
	 ([f11] . elscreen-next)
	 ([f12] . elscreen-prompt-kill-p))

  :config
  (message "Loading escreen Configuration...")
  (defun elscreen-prompt-kill-p ()
    "Prompts the user whether they want to kill the current screen,
     kills the screen if true"
    (interactive)
    (if (y-or-n-p "Kill Current Elscreen?") 
	(elscreen-kill)))
  (elscreen-start)
  (elscreen-toggle-display-tab))


(provide 'escreen-config)
