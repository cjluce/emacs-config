;; -*- lexical-binding: t; -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ajrepl cape consult corfu eat embark embark-consult
	    exec-path-from-shell expand-region gruvbox-theme
	    janet-mode janet-ts-mode jinx magit marginalia
	    multiple-cursors orderless org-appear org-modern puni
	    racket-mode tempel treesit-auto vertico))
 '(package-vc-selected-packages
   '((ajrepl :url "https://github.com/sogaiu/ajrepl")
     (janet-ts-mode :url "https://github.com/sogaiu/janet-ts-mode")))
 '(ring-bell-function 'ignore)
 '(safe-local-variable-values '((line-spacing . 2))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Remove uninstalled packages from the selected-packages list. I hate
;; old baggage. This means `package-install-selected-packages' won't
;; restore packages I've explicitly uninstalled.
(let ((installed-packages (seq-filter #'package-installed-p package-selected-packages)))
      (customize-save-variable 'package-selected-packages installed-packages))
