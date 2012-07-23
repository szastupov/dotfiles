(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(auto-insert-mode t)
 '(auto-insert-query nil)
 '(c-basic-offset 4)
 '(c-default-style "bsd")
 '(c-offsets-alist (quote ((inextern-lang . 0) (innamespace . 0))))
 '(column-number-mode t)
 '(compilation-auto-jump-to-first-error t)
 '(compilation-scroll-output 1)
 '(compilation-window-height 10)
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(delete-selection-mode t)
 '(font-use-system-font t)
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(indent-tabs-mode nil)
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(lua-indent-level 4)
 '(mouse-wheel-mode t)
 '(org-replace-disputed-keys t)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(save-place t nil (saveplace))
 '(savehist-mode t nil (savehist))
 '(scroll-bar-mode nil)
 '(scroll-conservatively 10000)
 '(scroll-step 1)
 '(semanticdb-default-save-directory "~/.emacs.d/semanticdb")
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(tooltip-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(use-dialog-box nil)
 '(which-function-mode t)
 '(x-select-enable-clipboard t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

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

(add-to-list 'custom-theme-load-path "~/Projects/emacs-color-theme-solarized")
(load-theme 'solarized-dark)
