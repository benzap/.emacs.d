(message "Loading Org Configuration...")

(require 'package-utils)


;;dependent packages
(package-require 'org-bullets)


(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)

(setq org-log-done t)
(setq org-agenda-files (list "~/org/apersonal.org"
			     "~/org/diet.org" 
			     "~/org/exercise.org"
			     "~/org/journal.org"
			     "~/org/tasks.org"
			     "~/org/finance.org"
			     "~/org/notes.org"))

(setq org-directory "~/org")
(setq org-default-notes-file (concat org-directory "/refile.org"))



(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;;Custom Agenda Commands
(setq org-agenda-custom-commands
      '(("w" . "Work Related Searches")
	("wa" "All Work" tags-todo "WORK")
	("wi" "iFIDS Work" tags-todo "WORK|IFIDS")
	("g" "Groceries and Shopping" tags-todo "FOOD|SHOP")
	("b" "Books" tags "BOOK")))

(setq org-capture-templates
      '(("t" "Todo Task" entry (file+headline "~/org/tasks.org" "Tasks")
	 "* TODO %? %^g")
	("p" "Project Task" entry (file+headline "~/org/tasks.org" "Projects")
	 "* TODO %? %^g")
	("w" "Work Task" entry (file+headline "~/org/tasks.org" "Work")
	 "* TODO %? %^g")
	("j" "Journal" entry (file+datetree "~/org/journal.org")
	 "* %?\nEntered on %U\n  %i\n  %a")
	("f" "Food Entry" entry (file+headline "~/org/diet.org" "Refile")
	 "* %U - %?:FOOD:")
	("r" "Refile" entry (file+headline "~/org/tasks.org" "Refile")
	 "* %U - %? %^g:NOTE:")))





(provide 'org-config)
