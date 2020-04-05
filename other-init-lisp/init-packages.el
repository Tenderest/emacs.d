 (when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

 ;; cl - Common Lisp Extension
 (require 'cl)

 ;; Add Packages
 (defvar my/packages '(
		;; --- Auto-completion ---
		company
		;; --- Better Editor ---
		hungry-delete
		swiper
		counsel
		smartparens
		js2-mode
		popwin
		;; --- Themes ---
		monokai-theme
		gruvbox-theme
		;; solarized-theme
		) "Default packages")

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

;; list packages
(global-set-key (kbd "<f10>") 'package-list-packages)

;; ================插件的配置=========================
;; 启动石加载主题
;;(load-theme 'monokai 1)
(load-theme 'gruvbox t)


;; 开启全局补全
(global-company-mode t)


;; js2-mode configurations 设置打开JavaScript文件的Major Mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))


;; hungry-delete configurations 快速删除多个空格
(require 'hungry-delete)
(global-hungry-delete-mode)


;; Swiper&counsel configurations 更好的提示
(ivy-mode t)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)


;; smartparens configurations 自动补全括号
;;(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;; popwin configurations 更好的窗口显示
(require 'popwin)
;; when require, wh(setq company-minimum-prefix-length 1)en not require
(popwin-mode t)
;; =========================================

(provide 'init-packages)
