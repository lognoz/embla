;;; lisp/autoloads.el --- autoloads generator -*- lexical-binding: t; -*-

;; Copyright (c) Marc-Antoine Loignon

;; Author: Marc-Antoine Loignon <developer@lognoz.org>
;; Homepage: https://github.com/lognoz/embla
;; Keywords: autoloads

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <https://www.gnu.org/licenses/>.

;;; Code:

(defun refresh-autoloads (dir outfile)
  "Update the autoloads for DIR.
Make sure to give an absolute path as OUTFILE."
  (delete-file outfile)
  (dolist (file (directory-files-recursively dir ""))
    (when (string-match "\\.el\\'" file)
      (update-file-autoloads file t outfile))))

;;;###autoload
(defun refresh-site-lisp-autoloads ()
  "Update the autoloads located in `embla-site-lisp-directory'."
  (interactive)
  (refresh-autoloads embla-site-lisp-directory embla-site-lisp-autoloads-file))

;;;###autoload
(defun refresh-lisp-autoloads ()
  "Update the autoloads located in `embla-lisp-directory'."
  (interactive)
  (refresh-autoloads embla-lisp-directory embla-lisp-autoloads-file))


(provide 'autoloads)

;;; autoloads.el ends here
