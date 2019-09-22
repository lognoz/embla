;;; configs.el - Company Component File

;; Copyright (c) 2019-2019 Marc-Antoine Loignon

;; Author: Marc-Antoine Loignon <developer@lognoz.org>
;; Keywords: company autocomplete

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

(require-package (company yasnippet))

(require 'company)
(require 'yasnippet)

(defun company-initialize ()
  (company--setup-mapping)
  (setq company-minimum-prefix-length 1
        company-idle-delay 0
        company-selection-wrap-around t
        company-tooltip-align-annotations t
        company-backends (mapcar #'company--load-backend-with-yas company-backends)
        company-frontends '(company-pseudo-tooltip-frontend
                            company-echo-metadata-frontend))
  (global-company-mode 1))

(defun company--load-backend-with-yas (backend)
    (if (and (listp backend) (member 'company-yasnippet backend))
        backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))

(defun company--setup-mapping ()
  (with-eval-after-load 'company
    (define-key company-active-map [tab] 'company-complete-selection)
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "C-p") 'company-select-previous)))
