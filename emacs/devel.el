(defun devel-hook ()
  (auto-fill-mode 1)
  (setq show-trailing-whitespace t)
  (local-set-key (kbd "RET") 'newline-and-indent))

(defun make ()
  "Saves all unsaved buffers, and runs 'compile'."
  (interactive)
  (save-some-buffers t)
  (compile compile-command))

(defun my-c-mode-hook ()
  (subword-mode 1)
  (gtags-mode)
  (local-set-key "\C-cm" 'make)
  (c-toggle-auto-hungry-state 1)
  (c-toggle-auto-newline 0))

(add-hook 'c-mode-common-hook 'my-c-mode-hook)
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.glsl$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

(dolist (hook '(python-mode-hook
                scheme-mode-hook
                c-mode-common-hook
                objc-mode-hook
                emacs-lisp-mode-hook
                perl-mode-hook
                html-mode-hook
                java-mode-hook
                tuareg-mode-hook
                haskell-mode-hook
                octave-mode-hook
                cmake-mode-hook
                nxml-mode-hook
                js-mode-hook
                ruby-mode-hook
                lua-mode-hook
                sh-mode-hook))
  (add-hook hook 'devel-hook))

(setq load-path (append '("/usr/local/share/emacs/site-lisp" "~/dotfiles/emacs/site") load-path))

;; Gtags
(require 'gtags)

;; Magit
(autoload 'magit-status "magit" nil t)
