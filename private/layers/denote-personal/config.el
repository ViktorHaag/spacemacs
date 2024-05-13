;;; config.el --- denote-personal layer config file for Spacemacs.
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
(setq denote-directory (expand-file-name "~/Dropbox/Stuff/notes/"))
(setq denote-known-keywords '("rpg" "work"))
(setq denote-file-type "markdown-toml")


(setq denote-infer-keywords t)
(setq denote-sort-keywords t)
(setq denote-prompts '(title keywords))

(setq denote-date-prompt-use-org-read-date t)

;; denote-templates would go here

(setq denote-allow-multi-word-keywords nil)
(setq denote-date-format nil)
(setq denote-link-fontify-backlinks t)

;; Markdown by default, so add hook to render link buttons
(add-hook 'find-file-hook #'denote-link-buttonize-buffer)

;; useful to see various ways to add a directory to a path:
;; (thread-last denote-directory (expand-file-name "subdir"))
;; (expand-file-name "~/home-subdir/subsubdir")
(setq denote-dired-directories
      (list denote-directory))
(add-hook 'dired-mode-hook #'denote-dired-mode-in-directories)
