;;; config.el --- MacOS Layer keybindings File for Spacemacs
;;
;; Copyright (c) 2012-2019 Sylvain Benner & Contributors
;;
;; Author: Viktor Haag (viktor.haag@gmail.com)
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary: modified form of osx layer from base spacemacs distribution

(when (spacemacs/system-is-mac)
  (spacemacs/set-leader-keys "bf" 'reveal-in-osx-finder)

  ;; this is only applicable to GUI mode
  (when (display-graphic-p)

    (when macos-use-command-as-meta
      ;; Treat command as meta
      (setq mac-command-key-is-meta t))
    (setq mac-command-modifier (if macos-use-command-as-meta 'meta super))

    (when macos-use-option-as-super
      ;; Treat option as meta
      (setq mac-option-key-is-super t))
    (setq mac-option-modifier (if macos-use-option-as-super 'super nil))

    ;; Keybindings
    (global-set-key (kbd "s-=") 'spacemacs/scale-up-font)
    (global-set-key (kbd "s--") 'spacemacs/scale-down-font)
    (global-set-key (kbd "s-0") 'spacemacs/reset-font-size)
    (global-set-key (kbd "s-q") 'save-buffers-kill-terminal)
    (global-set-key (kbd "s-v") 'yank)
    (global-set-key (kbd "s-c") 'evil-yank)
    (global-set-key (kbd "s-a") 'mark-whole-buffer)
    (global-set-key (kbd "s-x") 'kill-region)
    (global-set-key (kbd "s-w") 'delete-window)
    (global-set-key (kbd "s-W") 'delete-frame)
    (global-set-key (kbd "s-n") 'make-frame)
    (global-set-key (kbd "s-z") 'undo-tree-undo)
    (global-set-key (kbd "s-s")
                    (lambda ()
                      (interactive)
                      (call-interactively (key-binding "\C-x\C-s"))))
    (global-set-key (kbd "s-Z") 'undo-tree-redo)
    (global-set-key (kbd "C-s-f") 'spacemacs/toggle-frame-fullscreen)
    ;; Emacs sometimes registers C-s-f as this weird keycode
    (global-set-key (kbd "<C-s-268632070>") 'spacemacs/toggle-frame-fullscreen)
    (global-set-key (kbd "C-x C-b") 'ibuffer)
    (global-set-key [home] 'beginning-of-buffer)
    (global-set-key [end] 'end-of-buffer)
    ))
