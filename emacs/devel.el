(defun make-cur ()
  (interactive)
  (compile
   (concat "make CFLAGS='-Wall -ggdb' "
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
  (subword-mode 1)
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
                octave-mode-hook
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
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary))

(add-hook 'c-mode-common-hook 'my-cedet-hook)

(defun pkg-config (pkg)
  (let* ((cmd  (concat "pkg-config --cflags-only-I " pkg))
         (output (shell-command-to-string cmd)))
    (split-string (replace-regexp-in-string "-I" "" output))))

(global-ede-mode 1)
(require 'semantic/sb)
(semantic-mode 1)
(let ((pf "~/Projects/ede.el"))
  (if (file-exists-p pf)
      (load pf)))

;; Yasnippets
(require 'yasnippet)
(yas/initialize)

(setq yas/root-directory  "~/dotfiles/emacs/snippets")
(yas/load-directory yas/root-directory)