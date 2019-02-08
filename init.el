(if (equal system-type 'darwin)
    (require 'cask)
  (require 'cask "~/.cask/cask.el")
  :)
(cask-initialize)

(require 'flycheck)

;; haskell
(require 'intero)
(add-hook 'haskell-mode-hook 'intero-mode)
(custom-set-variables '(haskell-stylish-on-save t))
(flycheck-add-next-checker 'intero '(warning . haskell-hlint))

;; make enable clipboard copy
(cond (window-system
  (setq x-select-enable-clipboard t)
  ))

;; do not create backup file
(setq make-backup-files nil)
(setq auto-save-default nil)

(global-flycheck-mode)

;; C-n, C-pで補完候補を次/前の候補を選択
(require 'company)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'dracula t)

;; magit
(require 'magit)
(define-key global-map (kbd "M-g") 'magit-status)

;; multi-term
(require 'multi-term)
(setq multi-term-program (executable-find "zsh"))

;; yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
(define-key yaml-mode-map "\C-m" 'newline-and-indent)

;; markdown-mode
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))
(setq markdown-command "multimarkdown")

;; assign C-h delete-backward-char
(keyboard-translate ?\C-h ?\C-?)

;; buffer
(global-set-key [(control x) (k)] 'kill-this-buffer)
(global-set-key "\C-x\C-b" 'buffer-menu)

;; open multi-term on right window
(global-set-key (kbd "\C-ct") (lambda ()
                               (interactive)
                               (split-window-right)
			       (other-window 1)
                               (multi-term)))


(ivy-mode 1)
(counsel-mode 1)
(require 'find-file-in-project)

