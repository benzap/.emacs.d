(message "Loading zone Configuration")


;;zone out the display when it goes idle for a given length of time
(setq zone-idle-time 300)
(setq zone-timer (run-with-idle-timer zone-idle-time t 'zone))
(setq zone-programs [
		     zone-pgm-drip
		     zone-pgm-drip-fretfully
		     ])

(provide 'zone-config)
