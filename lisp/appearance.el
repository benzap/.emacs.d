;;file includes any settings for the apperance of emacs
(require 'package-utils)
(require 'utils)
(require 'server)

;;color theme
(if (and (not (window-system))
	 (not (server-running-p)))
    (progn 
      (package-require 'color-theme)
      (color-theme-initialize)
      (color-theme-tty-dark))
  (progn 
     (package-require 'waher-theme)
     (load-theme 'waher t t)))


(provide 'appearance)
