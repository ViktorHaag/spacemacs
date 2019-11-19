;;; config.el --- MacOS Layer config File for Spacemacs
;;
;; Copyright (c) 2012-2019 Sylvain Benner & Contributors
;;
;; Author: Viktor Haag (viktor.haag@gmail.com)
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary: modified form of osx layer from base spacemacs distribution

(defvar macos-use-option-as-super t
  "If non nil the option key is mapped to super. Set to `nil` if you need the
  option key to type common characters.")

(defvar macos-use-command-as-meta t
  "if non nil the command key is mapped to meta. Set to `nil` if
  you need the command key mapped to super instead.")

(defvar macos-use-dictionary-app t
  "If non nil use osx dictionary app instead of wordnet")

;; Use the OS X Emoji font for Emoticons
(when (fboundp 'set-fontset-font)
  (set-fontset-font "fontset-default"
                    '(#x1F600 . #x1F64F)
                    (font-spec :name "Apple Color Emoji") nil 'prepend))

