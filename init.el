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
 '(custom-safe-themes
   '("98ef36d4487bf5e816f89b1b1240d45755ec382c7029302f36ca6626faf44bbd" "046a2b81d13afddae309930ef85d458c4f5d278a69448e5a5261a5c78598e012" "18cf5d20a45ea1dff2e2ffd6fbcd15082f9aa9705011a3929e77129a971d1cb3" default))
 '(package-selected-packages
   '(racket-mode tempel cape corfu gruvbox-theme zenburn-theme zenburn embark-consult embark consult marginalia orderless vertico nov web-mode which-key pdf-tools rainbow-delimiters paredit geiser-chicken magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
