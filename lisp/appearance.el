;;file includes any settings for the apperance of emacs
(require 'package-utils)
(require 'utils)

;;color theme
(if (not (window-system))
    (progn 
      (package-require 'color-theme)
      (color-theme-initialize)
      (color-theme-tty-dark))
  (progn 
     (package-require 'waher-theme)
     (load-theme 'waher t t)))


(provide 'appearance)
