;;; New version of my init.el
;;; Author: Jared Smith

;; MELPA Package settings
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.org/packages/")))
(package-initialize)

;; Load Path for .el files
(add-to-list 'load-path "~/.emacs.d/custom/")

;; make all themes safe
(setq custom-safe-themes t)

;; No tilde backups
(setq make-backup-files nil)

(color-theme-approximate-on)

;; Why no rainbow-delimiter-global-mode ?
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(autopair-global-mode t)

(setq magit-aut-revert-mode nil)

;; Rice
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(buffers-menu-show-directories t)
 '(custom-enabled-themes (quote (Glacial-Dark)))
 '(custom-theme-directory "~/.emacs.d/themes")
 '(custom-theme-load-path (quote (custom-theme-directory t)))
 '(display-battery-mode t)
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(global-nlinum-mode t)
 '(inhibit-startup-screen t)
 '(mode-line-format
   (quote
    ("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification "   " mode-line-position
     (vc-mode vc-mode)
     "  " mode-line-modes mode-line-misc-info mode-line-end-spaces)))
 '(org-export-backends (quote (ascii html icalendar latex md odt)))
 '(org-startup-truncated nil)
 '(overflow-newline-into-fringe nil)
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Transparency
;;; ( ... 'alpha '(<active> [inactive]))
(set-frame-parameter (selected-frame) 'alpha '(95 90))
(add-to-list 'default-frame-alist '(alpha 95 90))
;; C-c t: Keymap switch for on/off
(eval-when-compile (require 'cl))
(defun toggle-transparency ()
  (interactive)
  (if (/=
       (cadr (frame-parameter nil 'alpha))
       100)
      (set-frame-parameter nil 'alpha '(100 100))
    (set-frame-parameter nil 'alpha '(95 90))))
(global-set-key (kbd "C-c t") 'toggle-transparency)


(global-set-key (kbd "C-c p") 'project-explorer-toggle)
;; 
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; --------------------------------------------------
;
;; web-mode being set as defaults
;
;; --------------------------------------------------
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 4)

  (setq web-mode-code-indent-offset 4)

  (setq web-mode-css-indent-offset 4)
  (setq web-mode-enable-css-colorization t)
  (set-face-attribute 'web-mode-css-at-rule-face nil :foreground "Lawn Green")
  (set-face-attribute 'web-mode-css-function-face nil :foreground "goldenrod1")
  (set-face-attribute 'web-mode-css-pseudo-class-face nil :foreground "pink1")
  (set-face-attribute 'web-mode-css-property-name-face nil :foreground "DarkOrange3")
)
(add-hook 'web-mode-hook  'my-web-mode-hook)
;; End web-mode

;; --------------------------------------------------
;
;; OSX Specific
;
;; --------------------------------------------------
(if (eq system-type 'darwin)
    (progn
      (message "success osx")

      ;; fixes 'too long for unix domain', could be a problem on other platforms
      ;; confirmed problem on osx
      (put 'temporary-file-directory 'standard-value '((file-name-as-directory "/tmp")))
      
      (setq ring-bell-function 'ignore)
      
      (setq ispell-program-name "/usr/local/bin/aspell")
      
      ;; Adding homebrew binary path to emacs env variable
      (setenv "PATH" (concat
		      "/usr/local/bin" ":" "/bin" ":" (getenv "PATH")))
      
      (osx-clipboard-mode +1)

      ;; Rust stuff
      ;(require 'rust-mode)
      ;(require 'racer)
      
      ;; enable mouse reporting for terminal emulators
      (unless window-system
	(require 'mouse)
	(xterm-mouse-mode t)
	(global-set-key [mouse-4] (lambda ()
				    (interactive)
				    (scroll-down 1)))
	(global-set-key [mouse-5] (lambda ()
				    (interactive)
				    (scroll-up 1)))
	(defun track-mouse (e))
	(setq mouse-sel-mode t))
      ))
;; End OSX

;; --------------------------------------------------
;
;; Linux Specific
;
;; --------------------------------------------------
(if (eq system-type 'gnu/linux)
    (progn
      (message "success gnu/linux")

      (set-face-attribute 'default nil :height 100)

      (setq visible-bell nil)

      ;; Rust
      ;(setq racer-rust-src-path "/usr/local/src/rustc-1.0.0/src/")
      ;(setq racer-cmd "/home/jared/apps/racer/target/release/racer")
      ;(add-to-list 'load-path "/home/jared/apps/racer/editors/emacs")
      ;(eval-after-load "rust-mode" '(require 'racer))
      
      ))
;; End Linux

;; --------------------------------------------------
;
;; Windows Specific
;
;; --------------------------------------------------
(if (eq system-type 'windows-nt)
    (progn
      (message "success windows")
      ))
;; End Windows

;;; init.el ends here
