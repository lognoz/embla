;;; autoload.el --- Dired Component Autoload File

;; Copyright (c) Marc-Antoine Loignon

;; Author: Marc-Antoine Loignon <developer@lognoz.org>
;; Keywords: dired

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
(setq dired-listing-switches "-aFlv --group-directories-first")

;;;###autoload
(defun dired-toogle-dotfile ()
  "Toggle visibility of dotfiles lines."
  (interactive)
  (when (equal major-mode 'dired-mode)
    (if (or (not (boundp 'dired-dotfiles-show-p)) dired-dotfiles-show-p)
        (progn
          (set (make-local-variable 'dired-dotfiles-show-p) nil)
          (dired-mark-files-regexp "^\\\.")
          (dired-do-kill-lines))
      (progn (revert-buffer)
             (set (make-local-variable 'dired-dotfiles-show-p) t)))))

;;;###autoload
(defun dired-grep-file-name (pattern)
  "Search files in directory by name."
  (interactive "sFind-name (filename wildcard): ")
  (find-name-dired default-directory pattern))

;;;###autoload
(defun dired-grep-file-name-by-pattern (pattern)
  "Search files in directory by pattern."
  (interactive "sFind-grep (grep regexp): ")
  (find-grep-dired default-directory pattern))
