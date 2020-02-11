;;; packages.el --- json-mode layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Viktor Haag <viktor.haag@gmail.com>
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(setq json-mode-packages
      '(
        json-mode))

(defun json-mode/init-json-mode ()
  (use-package json-mode
    :mode
    "\\.jsonld\\'"
    "\\.json\\'"
    ))

;;; packages.el ends here
