;;; cjl-completions.el --- Completion configuration  -*- lexical-binding: t; -*-

;;; Commentary:
;; 


;; Copyright (C) 2026  Cooper Luce

;; Author: Cooper Luce <lucec@Coopers-MacBook-Pro.local>

;;; Code:
;; Minibuffer completion
(use-package vertico
  :init
  (vertico-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides
   '((file (styles partial-completion)))))

(use-package marginalia
  :init
  (marginalia-mode))

;; Better versions of common search/navigation commands
(use-package consult
  :bind
  (("C-x b" . consult-buffer)
   ("M-s l" . consult-line)
   ("M-s r" . consult-ripgrep)))

;; Actions on completion candidates / things at point
(use-package embark
  :bind
  (("C-." . embark-act)
   ("M-." . embark-dwim))
  :init
  (setq prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult
  :after (embark consult)
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))


;; In-buffer completion
(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-cycle t)
  :init
  (global-corfu-mode))

;; Extra completion-at-point backends
(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file))


;; Templates / snippets
(use-package tempel
  :ensure t
  :bind
  (("M-+" . tempel-complete)
   ("M-*" . tempel-insert))
  :init
  (defun my/tempel-setup-capf ()
    (setq-local completion-at-point-functions
                (cons #'tempel-expand
                      completion-at-point-functions)))

  (add-hook 'prog-mode-hook #'my/tempel-setup-capf)
  (add-hook 'text-mode-hook #'my/tempel-setup-capf))


(provide 'cjl-completions)

;;; cjl-completions.el ends here
