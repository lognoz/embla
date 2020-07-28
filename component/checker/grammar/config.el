;;; package.el --- Grammar Component Config File

;; Copyright (c) Marc-Antoine Loignon

;; Author: Marc-Antoine Loignon <developer@lognoz.org>
;; Keywords: grammar

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

(defun grammar-init-flycheck-vale ()
  (require 'flycheck-vale)
  (flycheck-vale-setup)
  (flycheck-mode)
  (flycheck-vale-toggle-enabled))

(defun grammar-init-langtool ()
  (setq langtool-default-language "en-US"
        langtool-autoshow-idle-delay 0)

  (setq langtool-java-classpath
        "/usr/share/languagetool:/usr/share/java/languagetool/*")

  (add-hook 'after-save-hook 'langtool-check nil 'make-it-local))
