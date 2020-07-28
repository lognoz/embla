;;; keybinding.el --- Elfeed Component Keybinding File

;; Copyright (c) Marc-Antoine Loignon

;; Author: Marc-Antoine Loignon <developer@lognoz.org>
;; Keywords: elfeed

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

(define-keybinding
  :mode 'elfeed-search-mode-map
  :normal
    (kbd "RET") 'elfeed-search-show-entry
    (kbd "C-<return>") 'elfeed-search-browse-url
    (kbd "s-r") 'elfeed-show-refresh
    "o" 'elfeed-search-show-entry
    "y" 'elfeed-search-yank
    "s" 'elfeed-search-live-filter
    "S" 'elfeed-search-set-filter
    "q" 'quit-window
    "+" 'elfeed-search-tag-all
    "-" 'elfeed-search-untag-all
    "U" 'elfeed-search-tag-all-unread
    "u" 'elfeed-search-untag-all-unread
  :visual
    "+" 'elfeed-search-tag-all
    "-" 'elfeed-search-untag-all
    "U" 'elfeed-search-tag-all-unread
    "u" 'elfeed-search-untag-all-unread)

(define-keybinding
  :mode 'elfeed-show-mode
  :normal
    (kbd "C-j") 'elfeed-show-next
    (kbd "C-k") 'elfeed-show-prev)
