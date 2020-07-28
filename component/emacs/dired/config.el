;;; config.el --- Dired Component Config File

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

;; Package: dired

(define-config 'dired
  :config
    (setq dired-listing-switches "-aFlv --group-directories-first")
  :hook
    (put 'dired-find-alternate-file 'disabled nil)
    (setq dired-recursive-copies 'always
          dired-recursive-deletes 'always
          dired-isearch-filenames 'dwim
          dired-auto-revert-buffer t
          delete-by-moving-to-trash t
          dired-dwim-target t))

;; Package: dired-x

(define-config 'dired-x
  :hook (dired-hide-details-mode 1))
