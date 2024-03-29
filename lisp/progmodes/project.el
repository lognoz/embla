;;; lisp/progmodes/project.el --- Extensions to project -*- lexical-binding: t -*-

;; Copyright (c) Marc-Antoine Loignon <developer@lognoz.org>

;; Author: Marc-Antoine Loignon <developer@lognoz.org>
;; URL: https://github.com/lognoz/embla
;; Version: 0.1.0
;; Package-Requires: ((emacs "28.0"))

;; This file is NOT part of GNU Emacs.

;; This file is free software: you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by the
;; Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This file is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this file.  If not, see <http://www.gnu.org/licenses/>.
;; This file is not part of GNU Emacs.

;;; Code:

(require 'project)


;;; --- Project focus mode

;;;###autoload (define-key embla-mode-map (kbd "s-p") #'embla-project-focus-mode)
;;;###autoload
(defvar embla-project-focus-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-x b") #'project-switch-to-buffer)
    (define-key map (kbd "C-x k") #'project-kill-buffers)
    map))

;;;###autoload
(define-minor-mode embla-project-focus-mode
  "Minor mode to focus on the current project."
  :global t
  :keymap embla-project-focus-mode-map)


;;; --- Execute last command shell

;;;###autoload (define-key embla-mode-map (kbd "M-`") #'embla-project-execute-last-shell-command)
;;;###autoload
(defun embla-project-execute-last-shell-command ()
  (interactive)
  (save-window-excursion
    (let* ((shell-window)
           (default-directory (project-root (project-current t)))
           (default-project-shell-name (concat "vterm " default-directory)))
      (dolist (window (window-list))
        (when (equal default-project-shell-name (buffer-name (window-buffer window)))
          (setq shell-window window)))
      (if (not shell-window)
          (message "No shell window is opened.")
        (select-window shell-window)
        (embla-shell-execute-previous)))))


;;; --- Toggle dired

;;;###autoload (define-key embla-mode-map (kbd "s-t") #'embla-project-toggle-dired-sidebar)
;;;###autoload
(defun embla-project-toggle-dired-sidebar ()
  (interactive)
  (let* ((root (project-root (project-current t))))
    (when root
      (message root)
      (dired-sidebar-toggle-sidebar root))))


;;; --- Shell in foreground

(defvar embla-foreground-buffer nil
  "The active buffer before to execute `embla-project-shell'.")

;;;###autoload (define-key embla-mode-map (kbd "C-z") #'embla-project-shell)
;;;###autoload
(defun embla-project-shell ()
  "Start an inferior shell in the current project's root directory.
If a buffer already exists for running a shell in the project's root,
switch to it."
  (interactive)
  (require 'comint)
  (let* ((default-directory (project-root (project-current t)))
         (default-project-shell-name (concat "vterm " default-directory))
         (shell-buffer (get-buffer default-project-shell-name)))
    (if (with-current-buffer (current-buffer)
          (eq major-mode 'vterm-mode))
      (progn
        (switch-to-buffer embla-foreground-buffer)
        (setq embla-foreground-buffer nil))
      (setq embla-foreground-buffer (window-buffer))
      (if (and shell-buffer (not current-prefix-arg))
        (if (comint-check-proc shell-buffer)
          (pop-to-buffer shell-buffer (bound-and-true-p display-comint-buffer-action))
          (vterm shell-buffer))
        (vterm (generate-new-buffer-name default-project-shell-name))))))

;;; project.el ends here
