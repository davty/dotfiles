(require 'package)
(require 'lsp-mode)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(load-theme 'dracula t)

(tool-bar-mode -1)

;; Company mode
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)

;; Go - lsp-mode
;; Set up before-save hooks to format buffer and add/delete imports.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; Start LSP Mode and YASnippet mode
(add-hook 'go-mode-hook #'lsp-deferred)
(add-hook 'go-mode-hook #'yas-minor-mode)

(setq read-process-output-max (* 1024 1024)) ;; 1mb
(setq gc-cons-threshold 100000000)

(setq company-minimum-prefix-length 1
      company-idle-delay 0.0) ;; default is 0.2

(setq-default tab-width 2)

(package-initialize)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
	 '("0ab2aa38f12640ecde12e01c4221d24f034807929c1f859cbca444f7b0a98b3a" default))
 '(package-selected-packages
	 '(sage-shell-mode dracula-theme exec-path-from-shell yasnippet go-mode dap-mode lsp-ivy helm-lsp lsp-treemacs company lsp-ui lsp-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
