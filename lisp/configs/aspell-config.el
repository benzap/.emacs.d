(message "Loading aspell Configuration...")
(require 'package-utils)

;;Dependencies


(setq ispell-program-name "aspell")


(when (system-type-is-win32)
    (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin"))


(provide 'aspell-config)
