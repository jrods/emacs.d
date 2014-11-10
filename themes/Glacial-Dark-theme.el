;;; Glacial-Dark.el --- Summary
;
;;; Commentary:
;
;;; Code:
(deftheme Glacial-Dark
  "Author: Jared Smith Created 2014-10-23.")

(custom-theme-set-variables
 'Glacial-Dark
 `(minibuffer-auto-raise nil)
 `(max-mini-window-height 2))

(let ((class '((class color) (min-colors 89)))
      (Glacial-1 "DarkSeaGreen1")
      (Glacial-2 "SeaGreen1")
      (Glacial-3 "khaki2")
      (Glacial-4 "LightGoldenrod2")
      (Glacial-5 "DarkGoldenrod1")
      (Glacial-6 "sienna1")
      (Glacial-7 "DarkGoldenrod3")
      (Glacial-8 "coral3")
      (Glacial-9 "coral4")
      (gray-Glacial-1 "gray95")
      (gray-Glacial-2 "gray90")
      (gray-Glacial-3 "gray85")
      (gray-Glacial-4 "gray70")
      (error-background "sienna1")
      (Glacial-background "gray7")
      (Glacial-background-above "gray16")
      (Glacial-background-below "black"))
  
  (custom-theme-set-faces
   'Glacial-Dark
   
   `(info-title-1
     ((t (:family "Source Sans Pro" :foreground ,gray-Glacial-1 :inherit outline-1))))
   `(info-title-2 
     ((t (:inherit outline-2 :foreground ,gray-Glacial-2 :family "Source Sans Pro"))))
   `(info-title-3 
     ((t (:inherit outline-3 :foreground ,gray-Glacial-3 :family "Source Sans Pro"))))
   `(info-title-4 
     ((t (:inherit outline-4 :foreground ,gray-Glacial-4 :family "Source Sans Pro"))))
   
   `(info-header-node
     ((t (:foreground "lawn green"))))
   `(info-header-xref 
     ((t (:foreground "khaki1"))))
   `(info-menu-header 
     ((t (:family "helv" :weight bold))))
   `(info-node 
     ((t (:foreground "medium spring green"))))
   `(info-xref 
     ((t (:foreground "SeaGreen4"))))
   
   
   `(font-lock-builtin-face 
     ((t (:foreground "DarkOrange3"))))
   `(font-lock-comment-delimiter-face 
     ((t (:foreground "gray50"))))
   `(font-lock-comment-face 
     ((t (:foreground "gray50" :slant italic))))
   `(font-lock-constant-face 
     ((t (:foreground "DarkOliveGreen4"))))
   `(font-lock-doc-face 
     ((t (:foreground "peru"))))
   `(font-lock-function-name-face 
     ((t (:foreground "goldenrod1"))))
   `(font-lock-keyword-face 
     ((t (:foreground "pale green"))))
   `(font-lock-preprocessor-face 
     ((t (:foreground "gold3"))))
   `(font-lock-regexp-grouping-backslash 
     ((t (:weight bold))))
   `(font-lock-regexp-grouping-construct 
     ((t (:weight bold))))
   `(font-lock-string-face 
     ((t (:foreground "chartreuse3"))))
   `(font-lock-type-face 
     ((t (:foreground "pink1"))))
   `(font-lock-variable-name-face 
     ((t (:foreground "SeaGreen4"))))
   `(font-lock-warning-face 
     ((t (:foreground "salmon1"))))
   
   `(cursor
     ((,class (:background "maroon1"))))
   
   `(fringe
     ((t (:background ,Glacial-background-below))))
   
   `(highlight
     ((t (:background "gray25"))))
   
   `(isearch 
     ((t (:background "chartreuse4" :foreground "white"))))
   
   `(lazy-highlight 
     ((t (:background "cadetblue" :foreground "white"))))
   
   `(match 
     ((t (:background "chartreuse2" :foreground "white"))))
   
   `(minibuffer-prompt 
     ((t (:foreground "white smoke" :weight bold :height 1.1))))
   
   `(mode-line 
     ((t (:background ,Glacial-background-above :foreground "goldenrod1"
	  :box (:line-width 3 :color ,Glacial-background-above) :weight normal :height 1.1))))
   `(mode-line-buffer-id 
     ((t (:foreground "SeaGreen3" :weight bold :height 1.3))))
   `(mode-line-inactive 
     ((t (:background ,Glacial-background-below :foreground "dark gray"
	  :box (:line-width 3 :color ,Glacial-background-below) :weight normal :height 1.1))))
   
   `(region 
     ((t (:background "goldenrod2"))))
   
   `(show-paren-match 
     ((t (:background "DarkSeaGreen4" :foreground "LightGoldenrod1"))))
   `(show-paren-mismatch 
     ((t (:background "firebrick4" :foreground "sienna1"))))
   
   `(warning
     ((t (:foreground "yellow2"))))
   
   `(linum
     ((t (:inherit (shadow default) :foreground "gray33"))))

   `(company-tooltip
     ((t (:background ,Glacial-background-above :foreground "gray"))))
   `(company-tooltip-selection
     ((t (:foreground "chartreuse" :background "maroon4"))))
   `(company-tooltip-common
     ((t (:foreground ,Glacial-4 :background ,Glacial-background-below))))
   `(company-tooltip-common-selection
     ((t (:inherit company-tooltip-selection :foreground ,Glacial-7))))
   `(company-scrollbar-fg
     ((t (:background "maroon3"))))
   `(company-scrollbar-bg
     ((t (:background "gray25"))))
   `(company-tooltip-annotation
     ((t (:foreground ,Glacial-7 :background ,Glacial-background-above))))
   `(company-preview
     ((t (:background ,Glacial-background-above))))
   `(company-preview-common
     ((t (:foreground ,Glacial-5 :background ,Glacial-background-above))))
   
   `(outline-1
     ((t (:foreground ,Glacial-1))))
   `(outline-2
     ((t (:foreground ,Glacial-2))))
   `(outline-3
     ((t (:foreground ,Glacial-3))))
   `(outline-4
     ((t (:foreground ,Glacial-4))))
   `(outline-5
     ((t (:foreground ,Glacial-5))))
   `(outline-6
     ((t (:foreground ,Glacial-6))))
   `(outline-7
     ((t (:foreground ,Glacial-7))))
   `(outline-8
     ((t (:foreground ,Glacial-8))))
   
   `(org-level-1
     ((t (:height 250 :weight bold :inherit outline-1))))
   `(org-level-2
     ((t (:inherit outline-2 :weight semi-bold :height 230))))
   `(org-level-3
     ((t (:inherit outline-3 :weight semi-bold :height 210))))
   `(org-level-4
     ((t (:inherit outline-4 :weight normal :height 200 :slant normal))))
   `(org-level-5
     ((t (:inherit outline-5 :weight normal :height 190))))
   `(org-level-6 
     ((t (:height 170 :inherit outline-6))))
   `(org-level-7 
     ((t (:inherit outline-7 :height 150))))
   `(org-level-8
     ((t (:inherit outline-8 :height 130))))
   
   `(rainbow-delimiters-depth-1-face 
     ((t (:foreground ,Glacial-1))))
   `(rainbow-delimiters-depth-2-face
     ((t (:foreground ,Glacial-2))))
   `(rainbow-delimiters-depth-3-face
     ((t (:foreground ,Glacial-3))))
   `(rainbow-delimiters-depth-4-face 
     ((t (:foreground ,Glacial-4))))
   `(rainbow-delimiters-depth-5-face 
     ((t (:foreground ,Glacial-5))))
   `(rainbow-delimiters-depth-6-face
     ((t (:foreground ,Glacial-6))))
   `(rainbow-delimiters-depth-7-face
     ((t (:foreground ,Glacial-7))))
   `(rainbow-delimiters-depth-8-face 
     ((t (:foreground ,Glacial-8))))
   `(rainbow-delimiters-unmatched-face
     ((t (:foreground "white smoke" :background ,error-background))))
   `(rainbow-delimiters-mismatched-face
     ((t (:foreground "yellow" :background ,error-background))))
   
   `(default
      ((t (:background ,Glacial-background :foreground "white smoke" :family "Source Code Pro"))))
   ))

(provide-theme 'Glacial-Dark)
;;; Glacial-Dark-theme.el ends here.
