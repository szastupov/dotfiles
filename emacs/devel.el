(defun make-cur ()
  (interactive)
  (compile
   (concat "make "
		   (car (split-string (buffer-name) "\\.")))))

(defun devel-hook ()
  (auto-fill-mode 1)
  (setq show-trailing-whitespace t)
  (local-set-key "\r" 'newline-and-indent)
  (local-set-key [return] 'newline-and-indent))

(defun make ()
  "Saves all unsaved buffers, and runs 'compile'."
  (interactive)
  (save-some-buffers t)
  (compile compile-command))

(defun my-c-mode-hook ()
  (local-set-key "\C-cm" 'make)
  (c-toggle-auto-hungry-state 1)
  (c-toggle-auto-newline 0))

(add-hook 'c-mode-common-hook 'my-c-mode-hook)

(dolist (hook '(python-mode-hook
				scheme-mode-hook
				c-mode-hook
				c++-mode-hook
				objc-mode-hook
				emacs-lisp-mode-hook
				perl-mode-hook
				html-mode-hook
				java-mode-hook
				tuareg-mode-hook
				haskell-mode-hook
				shell-script-mode))
  (add-hook hook 'devel-hook))

(setq load-path (cons "~/dotfiles/emacs/site" load-path))
(require 'quack)

;;Ocaml
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)

(setq auto-mode-alist
	  (append '(("\\.ml[ily]?$" . tuareg-mode)
				("\\.topml$" . tuareg-mode))
			  auto-mode-alist))

(defun my-tuareg-hook ()
  (local-set-key "\C-cm" 'make))

(add-hook 'tuareg-mode-hook 'my-tuareg-hook)
;;

;;Haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; Cedet

(defun my-cedet-hook ()
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary))

(add-hook 'c-mode-common-hook 'my-cedet-hook)

(defun c-libraries-load ()
  (interactive)
  (load "/home/redchrom/src/cedet/common/cedet.el")
  (semantic-load-enable-code-helpers)
  (require 'semantic-ia)
  (require 'semantic-gcc))

(add-hook 'c-initialization-hook 'c-libraries-load)