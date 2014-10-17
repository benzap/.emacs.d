;;file includes any settings for the apperance of emacs
(require 'package-utils)
(require 'utils)

;;On windows systems, set the default font to Consolas
;;http://tinyurl.com/kk9eb
(if (system-type-is-win32)
    (progn
      (set-default-font
       "-outline-Consolas-normal-r-normal-normal-14-97-96-96-c-*-iso8859-1")
      (add-hook 'before-make-frame-hook
		(lambda ()
		  (set-frame-font 
		   "-outline-Consolas-normal-r-normal-normal-14-97-96-96-c-*-iso8859-1")))))

;;color theme
(if (not (window-system))
    (progn 
      (package-require 'color-theme)
      (color-theme-initialize)
      (color-theme-jsc-dark))
  (progn 
     (package-require 'waher-theme)
     (load-theme 'waher t t)))


(provide 'appearance)
