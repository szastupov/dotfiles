(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-insert-mode t)
 '(auto-insert-query nil)
 '(c-basic-offset 4)
 '(c-default-style "bsd")
 '(c-offsets-alist (quote ((inextern-lang . 0) (innamespace . 0))))
 '(column-number-mode t)
 '(compilation-auto-jump-to-first-error t)
 '(compilation-scroll-output 1)
 '(compilation-window-height 10)
 '(delete-selection-mode t)
 '(font-use-system-font t)
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(indent-tabs-mode nil)
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(mouse-wheel-mode t)
 '(org-replace-disputed-keys t)
 '(quack-default-program "ypsilon")
 '(quack-fontify-style (quote plt))
 '(quack-fontify-threesemi-p nil)
 '(quack-global-menu-p nil)
 '(quack-pretty-lambda-p t)
 '(quack-run-scheme-always-prompts-p nil)
 '(save-place t nil (saveplace))
 '(savehist-mode t nil (savehist))
 '(scheme-macro-expand-command "(debug-expand (quote %s))")
 '(scheme-mit-dialect nil)
 '(scheme-program-name "ypsilon")
 '(scroll-bar-mode nil)
 '(scroll-conservatively 10000)
 '(scroll-step 1)
 '(semanticdb-default-save-directory "~/.emacs.d/semanticdb")
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(tooltip-delay 0.5)
 '(tooltip-mode t)
 '(tuareg-library-path "/usr/lib64/ocaml")
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(use-dialog-box nil)
 '(x-select-enable-clipboard t))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:background "#0C1021" :foreground "#F8F8F8"))))
 '(font-lock-builtin-face ((((class color) (min-colors 88) (background dark)) (:inherit font-lock-string-face))))
 '(font-lock-comment-delimiter-face ((default (:inherit font-lock-comment-face)) (((class color) (min-colors 8) (background light)) nil)))
 '(font-lock-comment-face ((nil (:foreground "#AEAEAE"))))
 '(font-lock-constant-face ((((class color) (min-colors 88) (background dark)) (:inherit font-lock-string-face))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-function-name-face ((((class color) (min-colors 88) (background dark)) (:foreground "#9e91ff"))))
 '(font-lock-keyword-face ((((class color) (min-colors 8)) (:foreground "#ff9900"))))
 '(font-lock-preprocessor-face ((t (:foreground "red"))))
 '(font-lock-regexp-grouping-backslash ((t (:foreground "#E9C062"))))
 '(font-lock-regexp-grouping-construct ((t (:foreground "red"))))
 '(font-lock-string-face ((((class color) (min-colors 8)) (:foreground "#96ff00"))))
 '(font-lock-type-face ((((class color) (min-colors 88) (background dark)) (:foreground "#009cff"))))
 '(font-lock-variable-name-face ((((class color) (min-colors 88) (background dark)) nil)))
 '(fringe ((((class color) (background dark)) nil)))
 '(highlight ((((class color) (min-colors 88) (background dark)) (:background "#222222"))))
 '(magit-diff-add ((((class color) (background dark)) (:foreground "green"))))
 '(magit-diff-del ((((class color) (background dark)) (:foreground "red"))))
 '(minibuffer-prompt ((((background dark)) (:foreground "#729fcf"))))
 '(mode-line ((((class color) (min-colors 88)) (:background "grey75" :foreground "black"))))
 '(quack-pltish-comment-face ((((class color) (background dark)) (:inherit font-lock-comment-face))))
 '(quack-pltish-defn-face ((t (:inherit font-lock-function-name-face))))
 '(quack-pltish-keyword-face ((t (:inherit font-lock-keyword-face))))
 '(quack-pltish-paren-face ((((class color) (background dark)) (:foreground "magenta3"))))
 '(quack-pltish-selfeval-face ((((class color) (background dark)) (:inherit font-lock-constant-face))))
 '(region ((((class color) (min-colors 88) (background dark)) (:background "#253B76")))))

(fset 'yes-or-no-p 'y-or-n-p)

(defvar tmp-autosave-dir "~/.emacs.d/autosave/")

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defvar backup-dir "~/.emacs.d/backup/")
(setq backup-directory-alist (list (cons "." backup-dir)))

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))

(setq frame-title-format '("" "%b%& - emacs"))

(require 'uniquify)

(load "~/dotfiles/emacs/devel")

(add-hook 'org-mode-hook
          (lambda ()
            (setq fill-column 100)
            (auto-fill-mode 1)))