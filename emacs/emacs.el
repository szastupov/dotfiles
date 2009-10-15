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
 '(gud-tooltip-mode t)
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
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
 '(tuareg-library-path "/usr/lib64/ocaml")
 '(xterm-mouse-mode t)
 '(xterm-title-icon-title-format nil))

(defvar tmp-autosave-dir "~/.emacs.d/autosave/")

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defvar backup-dir "~/.emacs.d/backup/")
(setq backup-directory-alist (list (cons "." backup-dir)))

(require 'info)

(require 'iswitchb)
(dolist (b '("*Messages*" "*Completions*" "*Buffer List*"))
  (add-to-list 'iswitchb-buffer-ignore b))
(iswitchb-mode 1)

(load "~/dotfiles/emacs/devel")

(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(font-lock-comment-delimiter-face ((default (:inherit font-lock-comment-face)) (((class color) (min-colors 8) (background light)) nil)))
 '(font-lock-comment-face ((((class color) (min-colors 8) (background light)) (:foreground "blue"))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-keyword-face ((((class color) (min-colors 8)) (:foreground "yellow"))))
 '(font-lock-string-face ((((class color) (min-colors 8)) (:foreground "red"))))
 '(font-lock-variable-name-face ((((class color) (min-colors 8)) nil))))

(setq x-select-enable-clipboard t)
(setq frame-title-format '("" "%b%& - emacs"))
(require 'xterm-title)

(unless window-system
  (xterm-title-mode 1))
