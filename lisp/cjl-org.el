;;; cjl-org.el --- Org mode configuration            -*- lexical-binding: t; -*-

;;; Commentary:
;; 


;; Copyright (C) 2026  Cooper Luce

;; Author: Cooper Luce <lucec@Coopers-MacBook-Pro.local>


;;; Code:

(use-package org
  :config
  (setq org-todo-keywords
      	'((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)" "CANCELLED(c@/!)")))
  (setq org-log-done 'time)
  ;; setup the inbox and projects files and append the header
  (let ((dir "~/org"))
    (dolist (f (list "projects.org" "inbox.org"))
      (let ((full-file (format "%s/%s" dir f)))
    	(unless (file-exists-p full-file)
    	  (dired-create-empty-file full-file)
    	  (when (string-equal "inbox.org" f)
    	    (write-region "#+STARTUP: content showstars indent\n#+FILETAGS: inbox" nil full-file 'append))
    	  (when (string-equal "projects.org" f)
    	    (write-region "#+STARTUP: content showstars indent\n#+FILETAGS: projects" nil full-file 'append)))))))

(use-package org-modern
  :after org
  :config
  (setq org-modern-todo-faces
      	'(("NEXT" :foreground "purple" :weight bold :background "orange")))
  (setq org-modern-hide-stars " ")
  (global-org-modern-mode))


;; Allow moving task from anywhere into your projects:
(setq org-refile-targets '(("~/org/projects.org" :maxlevel . 1)))

;; Automatically save org files after refile
(advice-add 'org-refile :after (lambda (&rest _) (org-save-all-org-buffers)))

;; Setup capture template to write new tasks to ~/org/inbox.org
(setq org-capture-templates
      '(("t" "todo" entry (file "~/org/inbox.org")
         "* TODO %?\n/Entered on/ %U\n")
    	("m" "Meeting Notes" entry
    	 (file+datetree "~/org/meetings.org")
    	 "* %?\n%U\n")))

(setq org-archive-location "~/org/meetings-archive::datetree/")

;; Press F6 to capture a task
(global-set-key (kbd "<f6>") 'org-capture)

(provide 'cjl-org)

;;; cjl-org.el ends here
