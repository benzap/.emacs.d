(message "Loading git auto commit configuration...")
(require 'package-utils)

;;Dependencies
(package-require 'git-auto-commit-mode)
(require 'org-config)

;;perform correct pushing after commit command
(defadvice gac-commit (after gac-push-alt ())
  "Performs a simple shell-based push using git"
  (shell-command "git push"))
(ad-activate 'gac-commit)

(defun git-auto-commit-hook ()
  ;;check if we're currently in an org-agenda file
  (let ((filelist org-agenda-files))
    (if (member (concat org-directory "/" (buffer-name)) org-agenda-files)
	(git-auto-commit-mode 1))))

;;(add-hook 'find-file-hook 'git-auto-commit-hook)

(provide 'git-auto-commit-config)


