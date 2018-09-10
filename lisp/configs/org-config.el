(message "Loading Org Configuration...")

(require 'package-utils)


;;dependent packages
(package-require 'org-bullets)

;; Location of everything
(setq org-directory "~/priv/notes/")
(setq org-work-directory "~/priv/work/")

(setq org-default-notes-file (concat org-directory "refile.org"))

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)


(setq org-file-tasks (concat org-directory "tasks.org"))
(setq org-file-personal (concat org-directory "apersonal.org"))
(setq org-file-diet (concat org-directory "diet.org"))
(setq org-file-exercise (concat org-directory "exercise.org"))
(setq org-file-journal (concat org-directory "journal.org"))
(setq org-file-finance (concat org-directory "finance.org"))
(setq org-file-notes (concat org-directory "notes.org"))

(setq org-work-tasks (concat org-work-directory "district0x/notes/work_tasks.org"))
(setq org-work-journal (concat org-work-directory "district0x/notes/work_journal.org"))


(setq org-log-done t)
(setq org-agenda-files
      (list org-file-tasks
	    org-file-personal
	    org-file-diet
	    org-file-exercise
	    org-file-journal
	    org-file-finance
	    org-file-notes
	    org-work-tasks
	    org-work-journal))


(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


;;Custom Agenda Commands
(setq org-agenda-custom-commands
      '(("w" . "Work Related Searches")
	("wa" "All Work" tags-todo "WORK")
	("g" "Groceries and Shopping" tags-todo "FOOD|SHOP")
	("b" "Books" tags "BOOK")))


(setq org-capture-templates
      '(("t" "Todo Task" entry (file+headline org-file-tasks "Tasks")
	 "* TODO %? %^g")
	("p" "Project Task" entry (file+headline org-file-tasks "Projects")
	 "* TODO %? %^g")
	("w" "Work Task" entry (file org-work-tasks "Work")
	 "* TODO %? %^g")
	("j" "Journal" entry (file+datetree org-file-journal)
	 "* %?\nEntered on %U\n  %i\n  %a")
	("f" "Food Entry" entry (file+headline org-file-diet "Refile")
	 "* %U - %?:FOOD:")
	("r" "Refile" entry (file+headline org-file-tasks "Refile")
	 "* %U - %? %^g:NOTE:")))


(provide 'org-config)
