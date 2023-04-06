(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(wakatime-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'neotree)
(global-set-key [f4] 'neotree-toggle)
(global-set-key [f5] 'neotree-change-root)

(global-set-key [f6] 'ielm )
(global-set-key [f7] '+eshell/toggle )
(global-set-key [f8] 'doom/open-scratch-buffer)

(defun run-buffer ()
  (interactive)
  (shell-command (concat "python " buffer-file-name)))
(global-set-key (kbd "<f9>") 'run-buffer)

(setq-default indent-tabs-mode t)

;; --------------------------------------------------------

(defun malb/indent-fold-or-complete (&optional arg)
  (interactive "P")
  (cond
   ;; if a region is active, indent
   ((use-region-p)
    (indent-region (region-beginning)
                   (region-end)))

   ;; always fold if we're looking at an org heading
   ((and (eq major-mode 'org-mode)
         (or (org-at-drawer-p)
             (org-at-heading-p)))
    (save-excursion (org-cycle)))

   ;; always use table actions in org tables
   ((and (eq major-mode 'org-mode) (org-table-p))
    (save-excursion (call-interactively 'orgtbl-tab)))

   ;; leave the math env
   ((and (or (and (eq major-mode 'org-mode) (bound-and-true-p org-cdlatex-mode))
             (and (eq major-mode 'latex-mode) (bound-and-true-p cdlatex-mode)))
         (texmathp)
         ;; (or (looking-at "\\\\)")
         ;;     (looking-at "\\]")
         ;;     (looking-at "}"))
         )
    (cdlatex-tab))

   ;; arg triggers cdlatex
   ((or
     (and (eq major-mode 'org-mode) (bound-and-true-p org-cdlatex-mode) arg)
     (and (eq major-mode 'latex-mode) (bound-and-true-p cdlatex-mode) arg))
    (cdlatex-tab))

   ;; if the next char is space or eol, but prev char not whitespace
   ((and (not (active-minibuffer-window))
         (or (looking-at " ")
             (looking-at "$"))
         (looking-back "[^[:space:]]" nil)
         (not (and (eq major-mode 'org-mode) (looking-back "<[a-z]+" nil)))
         (not (looking-back "^" nil)))
    (company-complete-common))

   ;; no whitespace anywhere
   ((and (not (active-minibuffer-window))
         (looking-at "[^[:space:]]")
         (looking-back "[^[:space:]]" nil)
         (not (looking-back "^" nil)))
    (cond ((bound-and-true-p cdlatex-mode) (cdlatex-tab))
          ((bound-and-true-p hs-minor-mode) (save-excursion (end-of-line) (hs-toggle-hiding)))
          ((bound-and-true-p outline-minor-mode) (save-excursion (outline-cycle)))))

   ;; by default just call whatever was bound
   (t
    (let ((fn (or (lookup-key (current-local-map) (kbd "TAB"))
                  'indent-for-tab-command)))
      (if (not (called-interactively-p 'any))
          (fn arg)
        (setq this-command fn)
        (call-interactively fn))))))

(bind-key "<tab>" #'malb/indent-fold-or-complete)
