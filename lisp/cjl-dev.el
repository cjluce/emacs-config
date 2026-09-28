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

;; (use-package gptel
;;   :config
;;   (setq gptel-model 'qwen3:14b
;;         gptel-backend
;;         (gptel-make-ollama "Ollama"
;;           :host "localhost:11434"
;;           :stream t
;;           :models '(qwen3:14b))))

;; Janet section

(use-package janet-mode)

(use-package janet-ts-mode
  :vc (:url "https://github.com/sogaiu/janet-ts-mode"
	    :rev :newest))

(defvar-local cjl-janet-cached-imports nil)
(defvar-local cjl-janet-completions nil)
(defvar-local cjl-janet-completions-initialized-p nil)
(defconst cjl-janet-special-forms
  '("break"
    "def"
    "do"
    "fn"
    "if"
    "quasiquote"
    "quote"
    "set"
    "splice"
    "unquote"
    "upscope"
    "var"
    "while"))

(defun cjl-janet-imports ()
  (mapcar
   (lambda (capture)
     (treesit-node-text (cdr capture) t))
   (seq-filter
    (lambda (capture)
      (eq (car capture) 'import))
    (treesit-query-capture
     (treesit-buffer-root-node 'janet-simple)
     '(((par_tup_lit
         (sym_lit) @head) @import
       (:equal @head "import")))))))

(defun cjl-janet-refresh-completions (imports)
  (let* ((expr
          (format
           "(do %s (each x (all-bindings) (print x)))"
           (string-join imports " ")))
         (bindings
          (process-lines "jref" "-e" expr)))
    (setq cjl-janet-cached-imports imports
          cjl-janet-completions (append cjl-janet-special-forms bindings)
          cjl-janet-completions-initialized-p t)))

(defun cjl-janet-completion-at-point ()
  (let ((imports (cjl-janet-imports)))
    (unless (and cjl-janet-completions-initialized-p
                 (equal imports cjl-janet-cached-imports))
      (cjl-janet-refresh-completions imports))

    (when-let ((bounds (bounds-of-thing-at-point 'symbol)))
      (list (car bounds)
            (cdr bounds)
            cjl-janet-completions))))

(defun cjl-janet-setup ()
  (cjl-janet-refresh-completions (cjl-janet-imports))
  (add-hook 'completion-at-point-functions
            (cape-capf-super
             #'cjl-janet-completion-at-point
             #'cape-dabbrev)
            nil t))

(add-hook 'janet-ts-mode-hook #'cjl-janet-setup)

(use-package ajrepl
  :vc (:url "https://github.com/sogaiu/ajrepl"
	    :rev :newest)
  :hook (janet-ts-mode . ajrepl-interaction-mode))

;; C section

(use-package eglot
  :hook (c-ts-mode . eglot-ensure))

;; Racket section

(use-package racket-mode
  :ensure t)

(provide 'cjl-dev)



;;; cjl-dev.el ends here
