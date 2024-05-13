;;; packages.el --- ibuffer-personal layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Viktor Haag <viktor.haag@gmail.com>
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary: personal modifications for ibuffer layer from base distribution.

;;; Code:

;; ibuffer package loaded by implication via layers.el
(setq ibuffer-personal-packages
  '(
    ibuffer
    ))

(defun ibuffer-personal/init-ibuffer ()
  (use-package ibuffer
    :bind (:map ibuffer-mode-map
                ("s p" . ibuffer-do-sort-by-filename-or-dired))
    :init
    (progn
      (spacemacs/set-leader-keys "bB" 'ibuffer)
      (global-set-key (kbd "C-x C-b") 'buffer)
      (evil-ex-define-cmd "buffers" 'ibuffer)
      )
    :config
    (progn
      (evilified-state-evilify-map ibuffer-mode-map
        :ibuffer-mode
        :bindings
        "gr" 'ibuffer-update)
      (eval-after-load "ibuf-ext"
        '(define-ibuffer-filter filename
             "Toggle current view to buffers with file or directory name matching QUALIFIER."
           (:description "filename"
                         :reader (read-from-minibuffer "Filter by file/directory name (regexp):"))
           (when-let ((it (or (buffer-local-value 'buffer-file-name buf)
                               (buffer-local-value 'dired-directory buf))))
             (string-match-qualifier it))
           ))
      (eval-after-load "ibuf-ext"
        '(define-ibuffer-sorter filename-or-dired
           "Sort the buffers by their pathname."
           (:description "filename plus dired")
           (string-lessp
            (with-current-buffer (car a)
              (or buffer-file-name
                  (if (eq major-mode 'dired-mode)
                      (expand-file-name dired-directory))
                  ;; so that all non-pathnames are at the end
                  "~"
                  ))
            (with-current-buffer (car b)
              (or buffer-file-name
                  (if (eq major-mode 'dired-mode)
                      (expand-file-name dired-directory))
                  ;; so that all non-pathnames are at the end
                  "~")))))
      )))

;;; packages.el ends here
