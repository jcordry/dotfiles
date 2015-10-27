;; pre-installed dark theme
(load-theme 'wombat t)

;; Show some line numbers
(global-linum-mode 1)

;; More Erlang
(setq load-path (cons "/usr/local/Cellar/erlang/18.1/lib/erlang/lib/tools-2.8.1/emacs"
		      load-path))
(setq erlang-root-dir "/usr/local/Cellar/erlang/18.1")
(setq exec-path (cons "/usr/local/Cellar/erlang/18.1/bin" exec-path))
(setq erlang-man-root-dir "/usr/local/Cellar/erlang/18.1/lib/erlang/man")
(require 'erlang-start)

;; Erlang - EDTS
(add-hook 'after-init-hook 'my-after-init-hook)
(defun my-after-init-hook ()
  (require 'edts-start))

;; Packages
(add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(setenv "PATH" (concat (getenv "PATH") ":~/bin"))
(setq exec-path (append exec-path '("~/bin")))

;; Auto-complete
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(require 'auto-complete-config)
(ac-config-default)

(add-to-list 'load-path "~/.emacs.d")

;; Also installed Merlin and tuareg and Auctex
