;;; pip-decorate.el --- A major mode for decorating pip requirements files.

;; Derived from pip-requirements.el by Wilfred Hughes
;; url --> https://github.com/Wilfred/pip-requirements.el

;;; Code:

(require 'dash)
(require 'cl-lib)

(defgroup pip-decorate nil
  "Decoration of pip requirements files"
  :prefix "pip-decorate-"
  :group 'languages
  )

(defcustom pip-decorate-mode-hook nil
  "Hook to run after `pip-decorate-mode`."
  :group 'pip-decorate
  :type 'hook
  :risky t)

;;;###autoload
(add-to-list 'auto-mode-alist
             `(,(rx ".pip" string-end) . pip-decorate-mode))
;;;###autoload
(add-to-list 'auto-mode-alist
             `(,(rx "requirements" (zero-or-more anything) ".txt" string-end) . pip-decorate-mode))

;;;###autoload
(add-to-list 'auto-mode-alist
             `(,(rx "requirements.in") . pip-decorate-mode))

(defconst pip-decorate-name-regex
  (rx
   line-start
   (group (1+ (or alphanumeric "-" "_" ".")))))

(defconst pip-decorate-version-regex
  ;; https://www.python.org/dev/peps/pep-0440/#version-specifiers
  (rx
   (group (or "==" ">" ">=" "<" "<=" "!=" "~="))
   (group (1+ (or digit "b" "." "post" "*")))))

(defconst pip-decorate-arbitrary-version-regex
  ;; https://www.python.org/dev/peps/pep-0440/#arbitrary-equality
  (rx (group "===") (group (1+ not-newline))))

(defconst pip-decorate-operators
  (list
   (list pip-decorate-name-regex 1 'font-lock-variable-name-face)
   (list pip-decorate-version-regex 1 'font-lock-builtin-face)
   (list pip-decorate-arbitrary-version-regex 1 'font-lock-builtin-face)
   (list pip-decorate-version-regex 2 'font-lock-constant-face)
   (list pip-decorate-arbitrary-version-regex 2 'font-lock-constant-face)))

(defconst pip-decorate-syntax-table
  (let ((table (make-syntax-table)))
    (modify-syntax-entry ?# "<" table)
    (modify-syntax-entry ?\n ">" table)
    (modify-syntax-entry ?> "." table)
    (modify-syntax-entry ?< "." table)
    (modify-syntax-entry ?= "." table)
    (modify-syntax-entry ?~ "." table)
    table))

;;;###autoload
(define-derived-mode pip-decorate-mode prog-mode "pip-decorate"
  "Major mode for decorating pip requirements files."
  :syntax-table pip-decorate-syntax-table
  (set (make-local-variable 'font-lock-defaults) '(pip-decorate-operators))
  (set (make-local-variable 'comment-start) "#"))

(provide 'pip-decorate)

;;; pip-decorate.el ends here
