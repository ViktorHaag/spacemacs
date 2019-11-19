;;; config.el --- MacOS Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2019 Sylvain Benner & Contributors
;;
;; Author: Viktor Haag (viktor.haag@gmail.com)
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary: modified form of osx layer from base spacemacs distribution

(defun macos/list-available-dictionaries ()
  "Get list of available dictionaries. Useful when setting `osx-dictionary-dictionary-choice'."
  (interactive)
  (message (shell-command-to-string
            (format "%s -l" (osx-dictionary-cli-find-or-recompile)))))

