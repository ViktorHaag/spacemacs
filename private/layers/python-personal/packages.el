;;; packages.el --- python-personal layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2019 Sylvain Benner & Contributors
;;
;; Author: Viktor Haag <viktor.haag@gmail.com>
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary: personal modifications for python layer from base distribution

;;; Code:

(setq python-personal-packages
  '(
    elpy
    flycheck
    py-autopep8
    py-yapf
    python-mode
    ))

(defun python-personal/init-python-mode ()
  (use-package python-mode
    :mode "\\.py\\'"
    :interpreter "python3"
    :init
    (progn
      (setq py-shell-name "python3")
      (setq python-shell-interpreter "python3"))
    ))


(defun python-personal/init-elpy ()
  (use-package elpy
    :init
    (progn
      (setq elpy-rpc-python-command "python3")
      (setq elpy-rpc-virtualenv-path 'global)
      (elpy-enable)
      (setq elpy-modules '(elpy-module-company
                           elpy-module-eldoc
                           elpy-module-pyvenv
                           elpy-module-yasnippet
                           elpy-module-sane-defaults))
      (setq elpy-rpc-timeout 10))
    ))

(defun python-personal/init-flycheck()
  (use-package flycheck))

(defun python-personal/init-py-autopep8()
  (use-package py-autopep8))

(defun python-personal/init-py-yapf ()
  (use-package py-yapf))


;;; packages.el ends here
