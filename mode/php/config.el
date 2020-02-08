;;; config.el --- PHP Mode File

;; Copyright (c) Marc-Antoine Loignon

;; Author: Marc-Antoine Loignon <developer@lognoz.org>
;; Keywords: php

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

;; Enable company-mode
(require 'company-php)

;; Enable ElDoc support
(ac-php-core-eldoc-setup)

(set (make-local-variable 'company-backends)
     '((company-ac-php-backend)
        company-phpactor company-files))

;; Add yasnippet to company backend
(setq company-backends (mapcar #'company//load-backend-with-yas company-backends))

;; Jump to definition
(define-key php-mode-map (kbd "M-]")
 'ac-php-find-symbol-at-point)

;; Return back
(define-key php-mode-map (kbd "M-[")
 'ac-php-location-stack-back))
