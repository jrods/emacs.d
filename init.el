;;; New version of my init.el
;;; Author: Jared Smith
; Load Path for .el files
(add-to-list 'load-path "~/.emacs.d/custom/")
; MELPA Package settings
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.org/packages/")))
(package-initialize)
; No tilde backups
(setq make-backup-files nil)
(color-theme-approximate-on)
(hl-line-mode)
;; Why no rainbow-delimiter-global-mode ?
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'org-mode-hook #'rainbow-delimiters-mode)
;; Paredit sucks
(autopair-global-mode t)
;; Rust stuff
(require 'rust-mode)
(require 'racer)
; Org-mode
;; LaTeX export options

; Rice
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(buffers-menu-show-directories t)
 '(custom-enabled-themes (quote (Glacial-Dark)))
 '(custom-safe-themes
   (quote
    ("7dc68389ff027b898cd4ed7b2c42018e4d4d8e34a6036c1c2ba94c18f6bfcfc3" default)))
 '(custom-theme-directory "~/.emacs.d/themes")
 '(custom-theme-load-path (quote (custom-theme-directory t)))
 '(display-battery-mode t)
 '(global-linum-mode t)
 '(inhibit-startup-screen t)
 '(linum-format "%5d")
 '(max-mini-window-height 2)
 '(minibuffer-auto-raise nil)
 '(mode-line-format
   (quote
    ("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification "   " mode-line-position
     (vc-mode vc-mode)
     "  " mode-line-modes mode-line-misc-info mode-line-end-spaces)))
 '(omnisharp-host "http://localhost:5004/")
 '(org-export-backends (quote (ascii html icalendar latex md odt)) t)
 '(org-startup-truncated nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Transparency
;;; ( ... 'alpha '(<active> [inactive]))
(set-frame-parameter (selected-frame) 'alpha '(90 80))
(add-to-list 'default-frame-alist '(alpha 90 80))
;; C-c t: Keymap switch for on/off
(eval-when-compile (require 'cl))
(defun toggle-transparency ()
  (interactive)
  (if (/=
       (cadr (frame-parameter nil 'alpha))
       100)
      (set-frame-parameter nil 'alpha '(100 100))
    (set-frame-parameter nil 'alpha '(90 80))))
(global-set-key (kbd "C-c t") 'toggle-transparency)

;; --------------------------------------------------
;
;; OSX Specific
;
;; --------------------------------------------------
(if (eq system-type 'darwin)
    (progn
      
      (setq ispell-program-name "/usr/local/bin/aspell")
      
      ;; Adding homebrew binary path to emacs env variable
      (setenv "PATH" (concat
		      "/usr/local/bin" ":" "/bin" ":" (getenv "PATH")))
      
      (osx-clipboard-mode +1)
      
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
(if (eq system-type 'linux)
    (progn
      (message "success linux")
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
