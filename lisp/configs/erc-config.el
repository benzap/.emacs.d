(message "Loading erc Configuration...")
(require 'package-utils)

;;Depenencies
;;...


;;ERC nick coloring

;; Pool of colors to use when coloring IRC nicks
(setq erc-colors-list '("forest green" 
			"blue" 
			"red"
			"light gray" 
			"dark orange"
			"tomato"
			"goldenrod" 
			"maroon"
			"indian red"
			"dark khaki"
			"orchid"
			"SeaGreen3"
			"forest green"
			"peach puff"
			"steel blue" 
			"medium aquamarine"))

;; special colors for some people
(setq erc-nick-color-alist '(("John" . "blue")
			     ("Bob" . "red")
			     ))

(defun erc-get-color-for-nick (nick)
  "Gets a color for NICK. If NICK is in erc-nick-color-alist, use that color, else hash the nick and use a random color from the pool"
  (or (cdr (assoc nick erc-nick-color-alist))
      (nth
       (mod (string-to-number
	     (substring (md5 (downcase nick)) 0 6) 16)
	    (length erc-colors-list))
       erc-colors-list)))

(defun erc-put-color-on-nick ()
  "Modifies the color of nicks according to erc-get-color-for-nick"
  (save-excursion
    (goto-char (point-min))
    (if (looking-at "<\\([^>]*\\)>")
	(let ((nick (match-string 1)))
	  (put-text-property (match-beginning 1) (match-end 1) 'face
			     (cons 'foreground-color
				   (erc-get-color-for-nick nick)))))))

(add-hook 'erc-insert-modify-hook 'erc-put-color-on-nick)

(setq erc-lurker-threshold-time 3600)

(provide 'erc-config)
