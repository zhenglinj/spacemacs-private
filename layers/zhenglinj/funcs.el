;;; funcs.el --- zhenglinj layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Zheng, Linjun
;;
;; Author: Zheng, Linjun
;; URL:
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; http://emacsredux.com/blog/2013/04/21/edit-files-as-root/
(defun z/sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

;; advanced comment function
(defun z/comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command. If no region is selected and current line is not blank and we are not at the end of the line, then comment current line. Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
