;;; appleseed.el --- Kaizen Task Scheduler
;; Filename: appleseed.el
;; Description: Kaizen Task Scheduler minor mode for org-mode
;; Author: Benjamin Zaporzan <benzaporzan@gmail.com>
;; Maintainer: Benjamin Zaporzan <benzaporzan@gmail.com>
;; Copyright (C) 2018, Benjamin Zaporzan, all rights reserved.
;; Created: February 1st, 2018
;; Version: 0.1
;; URL: http://github.com/benzap/appleseed
;; Keywords: emacs, task scheduling, kaizen, org-mode, org
;; Compatibility: GNU Emacs 24+ (Not Fully Tested)
;; Package-Requires: ((dash "2.13.0") (dash-functional "1.2.0") (emacs "24") (s "*"))

;;; This file is NOT part of GNU Emacs

;;; License
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;;; Let us Begin

(eval-when-compile (require 'cl))


(defvar appleseed-default-task-duration (* 60 10)) ;; 10 Minutes


(cl-defstruct appleseed-task
  name
  (duration-seconds appleseed-default-task-duration))


(setq test-task (make-appleseed-task :name "Test Task"))



(defun appleseed-create-task)


;;;###autoload
(define-minor-mode appleseed-mode
  "Kaizen Task Scheduler minor mode for org-mode")


(save-excursion
  (switch-to-buffer-other-window "*Appleseed Tasks*")
  (insert-string "Hello World!")
  (other-window 1))




(provide 'appleseed)
