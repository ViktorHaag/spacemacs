;;; funcs.el --- local-functions layer functions file for Spacemacs.
;;
;; Copyright (c) 2012-2019 Sylvain Benner & Contributors
;;
;; Author: Viktor Haag <viktor.haag@gmail.com>
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary: wrapper layer for miscellaneous local functions

;;; Code:

(when (configuration-layer/package-usedp 'local-functions)

  (defun indent-buffer ()
    "Indent the entire contents of the current buffer using indent-according-to-mode."
    (interactive)
    (save-excursion
      (goto-char (point-min))
      (while (< (point) (point-max))
        (indent-according-to-mode)
        (end-of-line)
        (next-line 1))
      (message "buffer indented")))

  (defun outdent-buffer ()
    "Remove leading white space in front of every line in buffer."
    (interactive)
    (save-excursion
      (goto-char (point-min))
      (replace-regexp "^[ \t]+" "")
      (message "buffer outdented")))

  (defun insert-date-string (prefix)
    "Insert the current date. With prefix-argument, use full ISO format."
    (interactive "P")
    (let ((format (cond
                   ((not prefix) "%Y-%m-%d")
                   ((equal prefix '(4))  "%Y-%m-%dT%T%z")))
          (system-time-locale "en_US"))
      (insert (format-time-string format))))

  (defun remove-paragraph-filling ()
    (interactive)
    (goto-char 1)
    (let ((delete-trailing-lines t))
      (delete-trailing-whitespace 1 nil))
    ;; replace all double newlines with double-newline-marker
    (goto-char 1)
    (while (search-forward "\n\n" nil t) (replace-match "~~~~" nil t))
    ;; remove all single newlines
    (goto-char 1)
    (while (search-forward "\n" nil t) (replace-match " " nil t))
    ;; replace all double-newline-markers with newlines
    (goto-char 1)
    (while (search-forward "~~~~" nil t) (replace-match "\n" nil t)))

  )
