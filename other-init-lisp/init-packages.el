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
		      web-mode
		      js2-refactor
		      expand-region
		      iedit
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
(global-set-key (kbd "<f8>") 'package-list-packages)

;; ================插件的配置=========================
;; 启动石加载主题
;;(load-theme 'monokai 1)
(load-theme 'gruvbox t)


;; 开启全局补全
(global-company-mode t)

;; ------------------ 前端配置 -----------------
;; js2-mode configurations 设置打开JavaScript文件的Major Mode
;; web-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
       auto-mode-alist))
;; 下面的代码用于设置初始的代码缩进
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

;; 下面的函数可以用于在两个空格和四个空格之间进行切换
(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	     (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

  (setq indent-tabs-mode nil))

(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)


;; js2-refactor配置，用来重构js代码的插件
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")


;; ------------------ 前端配置 -----------------

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
;; emacs-lisp-mode 和 lisp-interaction-mode模式下不补全单引号
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)

;; popwin configurations 更好的窗口显示
(require 'popwin)
;; when require, wh(setq company-minimum-prefix-length 1)en not require
(popwin-mode t)


;; iedit 是一个可以同时编辑多个区域的插件 C-; 为默认快捷键
(global-set-key (kbd "M-s e") 'iedit-mode)





;; =========================================

(provide 'init-packages)
