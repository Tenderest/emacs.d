;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

(add-to-list 'load-path "~/.emacs.d/other-init-lisp")
(require 'init-packages)



;;(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)





;; ===========子龙山人的配置======================
;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
;;(tool-bar-mode -1)

;; 自动刷新文件
(global-auto-revert-mode t)


;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode t)

;; 关闭启动帮助画面
(setq inhibit-splash-screen t)

;; 快速打开配置文件
(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f12>") 'open-init-file)

;; 开启全局补全
(global-company-mode t)

;; 关闭自动备份
(setq make-backup-files nil)
(setq auto-save-default nil)


(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-item 20)

;; 这个快捷键绑定可以用之后的插件 counsel 代替
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(global-set-key (kbd "C-x C-r") 'counsel-recentf)

;; 替换选中部分文字
(delete-selection-mode t)

;; 将 Emacs 设置为开启默认全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 开启括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 高亮当前行，当文本内容很多时可以很容易找到光标的位置
(global-hl-line-mode t)

;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/Org_files"))

;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "<f11>") 'load-theme)
;; ===========子龙山人的配置======================



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.05)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ( "b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" default)))
 '(package-selected-packages (quote (gruvbox-theme company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "dim gray")))))
