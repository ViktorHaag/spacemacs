;;; packages.el --- denote-personal layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2019 Sylvain Benner & Contributors
;;
;; Author: Viktor Haag <viktor.haag@gmail.com>
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary: personal layer for denote package

;;; Code:
(defconst denote-personal-packages
  '(
    denote
    ))

(defun denote-personal/init-denote ()
     (use-package denote
       ))
