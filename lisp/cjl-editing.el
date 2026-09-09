;;; cjl-editing.el --- Editing configuration         -*- lexical-binding: t; -*-

;;; Commentary:
;; 


;; Copyright (C) 2026  Cooper Luce

;; Author: Cooper Luce <lucec@Coopers-MacBook-Pro.local>

;;; Code:

(use-package expand-region
  :bind ("C-=" . er/expand-region))

;; Spell checking
(use-package jinx
  :hook ((text-mode . jinx-mode)
         (prog-mode . jinx-mode))
  :bind
  (("M-$" . jinx-correct)
   ("C-M-$" . jinx-languages)))


;; Use puni-mode globally and disable it for term-mode.
(use-package puni
  :defer t
  :init
  ;; The autoloads of Puni are set up so you can enable `puni-mode` or
  ;; `puni-global-mode` before `puni` is actually loaded. Only after you press
  ;; any key that calls Puni commands, it's loaded.
  (puni-global-mode)
  (add-hook 'term-mode-hook #'puni-disable-puni-mode)) ;; may need to exclude EAT as well


(provide 'cjl-editing)

;;; cjl-editing.el ends here
