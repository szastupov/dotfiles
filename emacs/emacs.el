(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-insert-mode t)
 '(auto-insert-query nil)
 '(c-basic-offset 4)
 '(c-default-style "bsd")
 '(column-number-mode t)
 '(compilation-auto-jump-to-first-error t)
 '(compilation-scroll-output 1)
 '(compilation-window-height 10)
 '(delete-selection-mode t)
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(mouse-wheel-mode t)
 '(quack-default-program "ypsilon")
 '(quack-fontify-style (quote plt))
 '(quack-fontify-threesemi-p nil)
 '(quack-global-menu-p nil)
 '(quack-pretty-lambda-p t)
 '(quack-run-scheme-always-prompts-p nil)
 '(save-place t nil (saveplace))
 '(scheme-macro-expand-command "(debug-expand (quote %s))")
 '(scheme-mit-dialect nil)
 '(scheme-program-name "ypsilon")
 '(scroll-bar-mode nil)
 '(scroll-conservatively 10000)
 '(scroll-step 1)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(tooltip-delay 0.5)
 '(tooltip-mode t)
 '(tuareg-library-path "/usr/lib64/ocaml"))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:background "#0C1021" :foreground "#F8F8F8"))))
 '(font-lock-builtin-face ((((class color) (min-colors 88) (background dark)) (:foreground "#F8F8F8"))))
 '(font-lock-comment-delimiter-face ((default (:inherit font-lock-comment-face)) (((class color) (min-colors 8) (background light)) nil)))
 '(font-lock-comment-face ((nil (:foreground "#AEAEAE"))))
 '(font-lock-constant-face ((((class color) (min-colors 88) (background dark)) (:foreground "#D8FA3C"))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-function-name-face ((((class color) (min-colors 88) (background dark)) (:foreground "#FF6400"))))
 '(font-lock-keyword-face ((((class color) (min-colors 8)) (:foreground "#FBDE2D"))))
 '(font-lock-preprocessor-face ((t (:foreground "Aquamarine"))))
 '(font-lock-regexp-grouping-backslash ((t (:foreground "#E9C062"))))
 '(font-lock-regexp-grouping-construct ((t (:foreground "red"))))
 '(font-lock-string-face ((((class color) (min-colors 8)) (:foreground "#61CE3C"))))
 '(font-lock-type-face ((((class color) (min-colors 88) (background dark)) (:foreground "#8DA6CE"))))
 '(font-lock-variable-name-face ((((class color) (min-colors 8)) (:foreground "#FF6400"))))
 '(highlight ((((class color) (min-colors 88) (background dark)) (:background "#222222"))))
 '(mode-line ((((class color) (min-colors 88)) (:background "grey75" :foreground "black"))))
 '(region ((((class color) (min-colors 88) (background dark)) (:background "#253B76")))))


(defvar tmp-autosave-dir "~/.emacs.d/autosave/")

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defvar backup-dir "~/.emacs.d/backup/")
(setq backup-directory-alist (list (cons "." backup-dir)))

(require 'iswitchb)
(dolist (b '("*Messages*" "*Completions*" "*Buffer List*"))
  (add-to-list 'iswitchb-buffer-ignore b))
(iswitchb-mode 1)

(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))

(setq frame-title-format '("" "%b%& - emacs"))

(load "~/dotfiles/emacs/devel")
