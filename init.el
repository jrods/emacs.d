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
(setq paradox-github-token "ec2165afa7f52a05acf456a8912b2b6962c66be9")
; No tilde backups
(setq make-backup-files nil)
(color-theme-approximate-on)
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
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(buffers-menu-show-directories t)
 '(custom-enabled-themes (quote (Glacial-Dark)))
 '(custom-safe-themes
   (quote
    ("4e262566c3d57706c70e403d440146a5440de056dfaeb3062f004da1711d83fc" "058eeda70c6a8e702da4c7037c582f727887f5ab49a401247eac40aece97060d" "7dc68389ff027b898cd4ed7b2c42018e4d4d8e34a6036c1c2ba94c18f6bfcfc3" default)))
 '(custom-theme-directory "~/.emacs.d/themes")
 '(custom-theme-load-path (quote (custom-theme-directory t)))
 '(display-battery-mode t)
 '(global-nlinum-mode t)
 '(inhibit-startup-screen t)
 '(max-mini-window-height 2)
 '(minibuffer-auto-raise nil)
 '(mode-line-format
   (quote
    ("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification "   " mode-line-position
     (vc-mode vc-mode)
     "  " mode-line-modes mode-line-misc-info mode-line-end-spaces)))
 '(omnisharp-host "http://localhost:5004/")
 '(org-export-backends (quote (ascii html icalendar latex md odt)))
 '(org-startup-truncated nil)
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

      ;; fixes 'too long for unix domain', could be a problem on other platforms
      ;; confirmed problem on osx
      (put 'temporary-file-directory 'standard-value '((file-name-as-directory "/tmp")))
      
      (setq ring-bell-function 'ignore)
      
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
