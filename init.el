
;;; init.el --- Start of the Emacs initialisation process.

;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://www.melpa.org/packages/") ; many packages won't show if using stable
      t))
(package-initialize)
(require 'package)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
		(package-refresh-contents)
		(package-install 'use-package))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
					;A Helper function

(defun xah-get-fullpath (@file-relative-path)
  (concat (file-name-directory (or load-file-name buffer-file-name)) @file-relative-path)
)
;Example
;(load (xah-get-fullpath "myinit"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Error wrap
(defvar init-error nil 
  "The error which happened.")

(condition-case the-error
    (progn
      ;; Do the dangerous stuff here.
      (org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org")))
  (error
   ;; This is only evaluated if there's an error.
   (setq init-error the-error)))

;;; Do the safe stuff here.
;(org-babel-load-file (expand-file-name "~/.emacs.d/essentials.org"))
(load-file (xah-get-fullpath "essentials.el"))
(message "Loaded essentials successfully!")


;;Show Error Msg
(when init-error
  (funcall #'signal (car init-error) (cdr init-error))
     )

;;If loading successfully comepleted show success dialogue
(if init-error nil
  (message "there were some errors!!!!!")  
      )

;;Reload config
(defun reload-init-file() (interactive)(load-file "~/.emacs.d/init.el"))
(global-set-key (kbd "C-c r")  'reload-init-file)
































(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-goggles-change-face ((t (:inherit diff-removed))))
 '(evil-goggles-delete-face ((t (:inherit diff-removed))))
 '(evil-goggles-paste-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-add-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-change-face ((t (:inherit diff-changed))))
 '(evil-goggles-undo-redo-remove-face ((t (:inherit diff-removed))))
 '(evil-goggles-yank-face ((t (:inherit diff-changed)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(package-selected-packages
   (quote
    (elscreen nlinum-relative evil-matchit restart-emacs evil-commentary evil-goggles evil-test-helpers company-jedi elquery treemacs-projectile treemacs folding paredit minimap ensime scala-mode ivy-rich zenburn-theme yasnippet-snippets xref-js2 widgetjs which-key web-mode w3m use-package try tide tabbar spacemacs-theme spaceline solarized-theme robe rainbow-mode rainbow-delimiters projectile-rails org-download org-bullets org openwith omnisharp monokai-theme moe-theme miniedit meghanada marmalade-demo lsp-ui lsp-java lsp-intellij json-mode js-comint java-snippets ivy-purpose ivy-hydra irony-eldoc indium gulp-task-runner gradle-mode ggtags general flycheck-irony flycheck-inline flatland-black-theme exec-path-from-shell evil-smartparens everything eslintd-fix elfeed edit-server-htmlize dracula-theme dired+ dashboard counsel-projectile company-lsp company-irony color-theme-sanityinc-tomorrow ample-theme amd-mode ace-window ace-jump-mode))))
