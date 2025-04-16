;; Author: Cooper Luce

;; This fails if there aren't any code blocks. Basically, first
;; `org-tangle' is called, which tangles all of the source blocks into
;; a file, then tries to `load' that file. The file is not created by
;; `org-tangle' when there aren't any source blocks.
;; TODO: handle this error. probably send a different error which more
;;       explicitly says what is _probably_ going on.
(defconst user-config-file
  (locate-user-emacs-file "config.org")
  "
Absolute path to the user's `config.org' file if it exists.
Otherwise, just yield the init file.")

(org-babel-load-file user-config-file)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-ts-mode-indent-style 'k&r)
 '(custom-safe-themes
   '("18a1d83b4e16993189749494d75e6adb0e15452c80c431aca4a867bcc8890ca9"
     "5aedf993c7220cbbe66a410334239521d8ba91e1815f6ebde59cecc2355d7757"
     "5a0ddbd75929d24f5ef34944d78789c6c3421aa943c15218bac791c199fc897d"
     "98ef36d4487bf5e816f89b1b1240d45755ec382c7029302f36ca6626faf44bbd"
     "046a2b81d13afddae309930ef85d458c4f5d278a69448e5a5261a5c78598e012"
     "18cf5d20a45ea1dff2e2ffd6fbcd15082f9aa9705011a3929e77129a971d1cb3"
     default))
 '(gptel-api-key
   "AAAAC3NzaC1lZDI1NTE5AAAAID+wv3T2nsruX87fIaxnwGNYcx4A07LIk3SU/zj4vz9j")
 '(org-modern-hide-stars " ")
 '(package-selected-packages
   '(cape corfu corfu-terminal emacs-reformatter embark-consult
	  exec-path-from-shell expand-region gptel gptel-mode
	  gruvbox-theme lua-mode magit marginalia micromamba mugur
	  multiple-cursors nov orderless org-agenda org-modern paredit
	  pdf-tools rainbow-delimiters sqlformat tempel vertico vterm
	  web-mode))
 '(sqlformat-args nil)
 '(sqlformat-command 'sqlfluff)
 '(warning-suppress-log-types '((gptel))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
