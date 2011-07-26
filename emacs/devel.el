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
                sh-mode-hook))
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

(defun pkg-config (pkg)
  (let* ((cmd  (concat "pkg-config --cflags-only-I " pkg))
         (output (shell-command-to-string cmd)))
    (split-string (replace-regexp-in-string "-I" "" output))))

;; Gtags
(require 'gtags)

;; Magit
(autoload 'magit-status "magit" nil t)

;; Cmake
(autoload 'cmake-mode "cmake-mode" t)
(add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))

;;
;; Define "sun" mode to get the continuation line indentation
;; proper, ie. sun-like, in cc-mode
;;
(defun c-sun-get-continuation-proper (langelem)
  (save-excursion
    (goto-char (cdr langelem))
    (let ((current-syntax (caar (c-guess-basic-syntax))))
      (if (or (eq current-syntax 'statement)
              (eq current-syntax 'statement-block-intro))
          4 0))))

(c-add-style
 "illumos"
 '((c-basic-offset . 4)
   (c-comment-only-line-offset . 0)
   (c-offsets-alist . ((statement-block-intro . +)
                       (knr-argdecl-intro . +)
                       ;; (substatement-open . 0)
                       ;; (substatement-label . 0)
                       (arglist-cont . c-sun-get-continuation-proper)
                       (arglist-cont-nonempty . c-sun-get-continuation-proper)
                       (arglist-close . 4)
                       (arglist-intro . 4)
                       (statement-cont . 4)
                       (defun-block-intro . +)
                       ))))