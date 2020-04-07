;;; autoload.el --- Isearch Autoload Component File

;; Copyright (c) Marc-Antoine Loignon

;; Author: Marc-Antoine Loignon <developer@lognoz.org>
;; Keywords: isearch

;; This file is not part of GNU Emacs.

;; This Emacs config is free software: you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by the Free
;; Software Foundation, either version 3 of the License, or (at your option)
;; any later version.

;; This Emacs config is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this Emacs config. If not, see <https://www.gnu.org/licenses/>.

;;; Code:

;;;###autoload
(progn
  ;; Keybinding to search and replace.
  (global-set-key (kbd "M-s r") 'query-replace)
  (global-set-key (kbd "M-s M-r") 'query-replace-regexp)
  ;; Keybinding to occur in multiple buffer.
  (global-set-key (kbd "M-s M-o") 'occur-project)
  (global-set-key (kbd "M-s g") 'occur-project))

;;;###autoload
(defun occur-project (keyword)
  (interactive "sGrep for: ")
  (let ((directory (projectile-project-root)))
    (if directory
      (noccur-project keyword 0 directory)
      (noccur-project keyword))))

;;;###autoload
(defadvice isearch-exit (after my-goto-match-beginning activate)
  (when (and isearch-forward isearch-other-end)
    (goto-char isearch-other-end)))

;;;###autoload
(defun isearch-query-replace ()
  (interactive)
  (isearch-done t)
  (isearch-clean-overlays)
  (when (and isearch-forward isearch-other-end)
    (goto-char isearch-other-end))
  (if isearch-regexp
    (call-interactively 'isearch-query-replace-regexp-prompt)
    (call-interactively 'isearch-query-replace-prompt)))

;;;###autoload
(defun isearch-query-replace-prompt (replace-str)
  (interactive "sReplace with: ")
  (query-replace isearch-string replace-str))

;;;###autoload
(defun isearch-query-replace-regexp-prompt (replace-str)
  (interactive "sReplace with: ")
  (query-replace-regexp isearch-string replace-str))
