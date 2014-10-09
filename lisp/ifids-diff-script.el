;; Package-Requires: ((dash "2.8.0"))
;;File contains functions for performing a diff between two projects folders

(setq ifids-legacy-server-location "M:\\iFIDSNew")
(setq ifids-current-server-location "\\\\192.168.10.51\\c$\\inetpub\\iFIDS")

(directory-files ifids-legacy-server-location)

(defun generate-path (values)
  "Used to generate the path to the given file"
  (reduce (lambda (a b) (concat a b)) (-interpose "\\" values)))

;;(generate-path (list ifids-legacy-server-location "test"))

(defun generate-legacy-path (relative-filepath)
  (generate-path (list ifids-legacy-server-location relative-filepath)))

;;(generate-legacy-path "js\\ifidsDisplay.asp")


(defun generate-current-path (relative-filepath)
  (generate-path (list ifids-current-server-location relative-filepath)))

;;(generate-current-path "js\\ifidsDisplay.asp")

(defun ifids-diff-server-files (relative-filepath)
  "performs a diff between the two files"
  (interactive "MFilename: ")
  (let ((current (generate-current-path relative-filepath))
	(legacy (generate-legacy-path relative-filepath)))
    (diff legacy current "-c --ignore-all-space")))
  
;;(ifids-diff-server-files "fidswaitstate.asp")
;;(ifids-diff-server-files "fids.asp")
;;(ifids-diff-server-files "downloadCacheWaitState.asp")
;;(ifids-diff-server-files "FIDSFrames.asp")
;;(ifids-diff-server-files "ScreenBuilder/fidsblankpage.asp")
;;(ifids-diff-server-files "FIDSDrag.aspx")
;;(ifids-diff-server-files "js/refreshPage.htm")
;;(ifids-diff-server-files "ImageServer.asp")
;;(ifids-diff-server-files "ImageServerMain.asp")
;;(ifids-diff-server-files "FlightDisplayNew.asp")
;;(ifids-diff-server-files "downloadCache.asp")
;;(ifids-diff-server-files "ImageServerCache.asp")

(provide 'ifids-diff-script)
