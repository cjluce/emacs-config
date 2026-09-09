;;; cjl-dev.el --- Dev configuration                 -*- lexical-binding: t; -*-

;; Copyright (C) 2026  Cooper Luce

;; Author: Cooper Luce <lucec@Coopers-MacBook-Pro.local>

;;; Commentary:
;; 

;;; Code:

(use-package eat) ;; testing this instead of vterm

(use-package magit)

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package gptel
  :config
  (setq gptel-model 'qwen3:14b
        gptel-backend
        (gptel-make-ollama "Ollama"
          :host "localhost:11434"
          :stream t
          :models '(qwen3:14b))))

(provide 'cjl-dev)

;;; cjl-dev.el ends here
