;; pre-installed dark theme
(load-theme 'wombat t)

;; Show some line numbers when programming
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'erlang-mode-hook 'linum-mode)

;; More Erlang
(setq load-path (cons "~/lib/erlang/lib/tools-2.8.1/emacs" load-path))
(setq erlang-root-dir "~/homebrew/Cellar/erlang/18.1")
(setq exec-path (cons "~/homebrew/Cellar/erlang/18.1/" exec-path))
(setq erlang-man-root-dir "~/homebrew/Cellar/erlang/18.1/lib/erlang/man")
(require 'erlang-start)

;; Erlang - EDTS
(add-hook 'after-init-hook 'my-after-init-hook)
(defun my-after-init-hook ()
  (require 'edts-start))

;; Packages
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")))

(setenv "PATH" (concat (getenv "PATH") ":~/bin"))
(setq exec-path (append exec-path '("~/bin")))

;; (add-to-list 'load-path "~/.emacs.d")

;; Auto-complete
;; This is for popup
(add-to-list 'load-path "~/.emacs.d/elpa/popup-20150626.711")
;; For Auto-complete
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20150618.1949/")
(setq ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20150618.1949/dict/")
(require 'auto-complete-config)
(ac-config-default)


;; Also installed Merlin and tuareg and Auctex

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 180 :width normal :foundry "nil" :family "Menlo")))))
