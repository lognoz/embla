;;; init.el --- Private Initialization File

;; Copyright (c) Marc-Antoine Loignon

;; Author: Marc-Antoine Loignon <developer@lognoz.org>
;; Keywords: init

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

;;; Contextual programs configuration.

(setq elfeed-feeds
  '(("https://www.youtube.com/feeds/videos.xml?channel_id=UC0uTPqBCFIpZxlz_Lv1tk_g" emacs)
    ("https://www.reddit.com/r/emacs.xml" emacs)
    ("http://xenodium.com/rss.xml" emacs)
    ("https://www.legrandsoir.info/spip.php?page=backend" independent)
    ("https://www.investigaction.net/fr/feed/rss/" independant)
    ("https://www.lemonde.fr/international/rss_full.xml" actuality)))

(setq project-directories
  '("~/project/web/"
    "~/project/program/"))

;;; Architect Project Builder.

(defconst architect-directory (concat embla-external-directory "architect/")
  "The directory of Architect files.")

(defconst architect-source "https://github.com/lognoz/architect"
  "The git source of Architect Program.")

(when (not (file-exists-p architect-directory))
  (let* ((default-directory embla-external-directory))
    (shell-command (format "git clone %s" architect-source))))

(load (concat architect-directory "architect") nil 'nomessage)

(setq architect-directory "~/.emacs.d/private/external/architect-template")
