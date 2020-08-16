;;; emacs/dired/config.el --- Dired Component Config File

(defun dired-init-dired ()
  "Initialization of dired mode."
  (put 'dired-find-alternate-file 'disabled nil)
  (setq dired-recursive-copies 'always
        dired-recursive-deletes 'always
        dired-isearch-filenames 'dwim
        dired-auto-revert-buffer t
        delete-by-moving-to-trash t
        dired-dwim-target t))

(defun dired-init-dired-x ()
  "Initialization of dired-x package."
  (dired-hide-details-mode 1))
