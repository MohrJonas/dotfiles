;; Screw warnings
(setq warning-minimum-level :emergency)

;; Disable bell
(setq ring-bell-function 'ignore)

;; Hide startup screen
(setq inhibit-startup-screen t)

;; Hide toolbar
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Hide scrollbar
(defun my/disable-scroll-bars (frame)
  (modify-frame-parameters frame
                           '((vertical-scroll-bars . nil)
                             (horizontal-scroll-bars . nil))))
(add-hook 'after-make-frame-functions 'my/disable-scroll-bars)

;; Show relative line numbers
(setq display-line-numbers 'relative)

;; Move custom stuff to another file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Setup package manager stuff
(require 'package)
(setq package-archives
'(
   ("org" . "https://orgmode.org/elpa/")
   ("gnu" . "https://elpa.gnu.org/packages/")
   ("melpa" . "https://melpa.org/packages/")
   ))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(setq my-package-list '(use-package))
(dolist (package my-package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Install packages
(use-package cobol-mode :ensure t)
(use-package markdown-mode :ensure t)
(use-package rust-mode :ensure t)
(use-package rustic :ensure t)
(use-package rainbow-delimiters :ensure t)
(use-package solarized-theme :ensure t)
(use-package which-key :ensure t)
(use-package lsp-mode :ensure t)
(use-package lsp-java :ensure t)
(use-package lsp-ui :ensure t)
(use-package flycheck :ensure t :init (global-flycheck-mode))
(use-package company :ensure t)
(use-package helm :ensure t)
(use-package helm-lsp :ensure t)
(use-package magit :ensure t)
(use-package treemacs :ensure t)
(use-package lsp-treemacs :ensure t)
(use-package helm-posframe :ensure t)
(use-package demap :ensure t)
(use-package projectile :ensure t)
(use-package helm-projectile :ensure t)
(use-package elcord :ensure t)
(use-package vterm :ensure t)
(use-package xclip :ensure t)

;; Register major modes
(setq auto-mode-alist
      (append
       '(("\\.cob\\'" . cobol-mode)
         ("\\.cbl\\'" . cobol-mode)
         ("\\.cpy\\'" . cobol-mode)
	 ("\\.md\\'" . markdown-mode))
       auto-mode-alist))

;; Rainbow delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Color theme
(load-theme 'solarized-dark t)

;; Enable which key
(which-key-mode)

;; Enable company mode
(add-hook 'after-init-hook 'global-company-mode)

;; Enable LSP
(setq lsp-keymap-prefix "C-c l")
(add-hook 'prog-mode-hook #'lsp-deferred)

;; Override open file with helm-find-files
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; Set keybind for projectile
(global-set-key (kbd "C-x g") 'helm-projectile-grep)
(global-set-key (kbd "C-x j") 'helm-projectile-recentf)

;; Set keybind for magit
(global-set-key (kbd "C-c g") 'magit-status)

;; Setup treemacs
(lsp-treemacs-sync-mode 1)
(global-set-key (kbd "C-c f") 'treemacs)

;; Enable floating helm minibuffers
(helm-posframe-enable)

;; Enable minimap
(setq demap-minimap-window-side  'right)
(setq demap-minimap-window-width 15)
(demap-minimap-construct)
(demap-toggle)

;; Enable elcord
(elcord-mode)

;; Set keybind for quick buffer switching
(global-set-key (kbd "C-<tab>") 'helm-buffers-list)
(global-set-key (kbd "C-<iso-lefttab>") 'helm-projectile-recentf)
(setq helm-boring-buffer-regexp-list (list (rx "*")))

;; Enable xclip
(xclip-mode)
