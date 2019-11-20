;;; packages.el --- lorem-ipsum layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2019 Sylvain Benner & Contributors
;;
;; Author: Viktor Haag <viktor.haag@gmail.com>
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary: Loading of lorem ipsum package

;;; Code:

(setq lorem-ipsum-packages
      '(
        lorem-ipsum
        ))

(defun lorem-ipsum/init-lorem-ipsum ()
  (use-package lorem-ipsum))

;;; packages.el ends here
