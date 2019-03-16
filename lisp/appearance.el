;;file includes any settings for the apperance of emacs
(require 'package-utils)
(require 'utils)
(require 'server)

;;color theme
(if (and (not (window-system))
	 (not (server-running-p)))
    (load-theme 'tango-dark t t)
  (progn 
    (package-require 'waher-theme)
    (load-theme 'waher t t)))

(provide 'appearance)
