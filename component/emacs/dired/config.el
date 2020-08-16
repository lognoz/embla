;;; emacs/dired/config.el --- Dired Component Config File

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

(define-config 'dired-x
  :hook (dired-hide-details-mode 1))
