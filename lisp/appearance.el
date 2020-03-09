;;file includes any settings for the apperance of emacs
(require 'package-utils)
(require 'utils)
(require 'server)

;;color theme for terminal/server and for gui
(if (and (not (window-system))
	 (not (server-running-p)))
    (load-theme 'tango-dark t t)
  (progn 
    (package-require 'waher-theme)
    (load-theme 'waher t t)))

(provide 'appearance)
