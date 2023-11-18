;; Author: Cooper Luce

;; This fails if there aren't any code blocks. Basically, first
;; `org-tangle' is called, which tangles all of the source blocks into
;; a file, then tries to `load' that file. The file is not created by
;; `org-tangle' when there aren't any source blocks.
;; TODO: handle this error. probably send a different error which more
;;       explicitly says what is _probably_ going on.
(org-babel-load-file "config.org")
