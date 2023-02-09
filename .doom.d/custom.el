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
