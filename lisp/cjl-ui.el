;;; cjl-ui.el --- UI configuration                   -*- lexical-binding: t; -*-

;;; Commentary:
;; 


;; Copyright (C) 2026  Cooper Luce

;; Author: Cooper Luce <lucec@Coopers-MacBook-Pro.local>


;;; Code:

(fringe-mode -1) ;; disable fringes entirely (nil has default)

(use-package gruvbox-theme)
;; this should probably be based on the dpi or something? (note: check
;; out the code for ~org--get-display-dpi~)
(set-face-attribute 'default nil :height 210)
(set-frame-font "Iosevka" nil t)
(toggle-frame-maximized)

;; define a helper function for switching between my light/dark theme
(defun cjl-refresh-theme ()
  (interactive)
  (let ((hour (decoded-time-hour (decode-time (float-time)))))
    (if (and (>= hour 8) (<= hour 19))
	(load-theme 'modus-operandi t)
      (load-theme 'modus-vivendi-tinted t))))

;; call it on emacs start
(cjl-refresh-theme)

;; call it every half hour (the repeat is in seconds)
;; (run-at-time "12:00am" "30 minutes" #'cjl/refresh-theme)
(run-at-time 0 (* 30 60) #'cjl-refresh-theme)

(provide 'cjl-ui)

;;; cjl-ui.el ends here
