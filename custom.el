;; -*- lexical-binding: t; -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(cape consult corfu eat embark embark-consult exec-path-from-shell
	  expand-region gptel gruvbox-theme jinx magit marginalia
	  orderless org-modern puni tempel treesit-auto vertico))
 '(ring-bell-function 'ignore))
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
