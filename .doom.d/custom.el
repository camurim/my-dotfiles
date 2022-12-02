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

(defun run-buffer ()
  (interactive)
  (shell-command (concat "python " buffer-file-name)))
(global-set-key (kbd "<f5>") 'run-buffer)

(require 'neotree)
(global-set-key [f7] 'neotree-toggle)
(global-set-key [f8] 'neotree-change-root)
(global-set-key [f9] '+eshell/toggle )
