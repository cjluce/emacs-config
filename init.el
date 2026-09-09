;; -*- lexical-binding: t; -*-

;; Placing this at the beginning of my init.el means that any
;; `customize-' settings will be overwritten by my init.el. If this is
;; at the end of the file, then `customize-' settings win.
(require 'package)
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror)


(add-to-list 'load-path
             (expand-file-name "lisp" user-emacs-directory))


;; This, and everything above, are my effective "needs" when using
;; emacs. I.e., if these things aren't set, I'll probably set them
;; before even editing a file.
(require 'cjl-core)

(require 'cjl-ui)

(require 'cjl-completions)

(require 'cjl-editing)

(require 'cjl-dev)

(require 'cjl-org)
