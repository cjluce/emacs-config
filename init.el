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
 '(package-selected-packages '(magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
