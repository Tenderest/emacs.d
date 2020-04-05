;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

(add-to-list 'load-path "~/.emacs.d/other-init-lisp")


;; 快速打开配置文件
(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; 快捷键放在init-keybindings.el文件中


(require 'init-ui)              ;; 视觉层配置
(require 'init-org)             ;; Org 模式相关的全部设定
(require 'init-packages)        ;; 插件管理
(require 'init-keybindings)     ;; 快捷键绑定
(require 'init-better-defaults) ;; 增强内置功能
;;custome.el              # 存放使用编辑器接口产生的配置信息


(setq custom-file (expand-file-name "other-init-lisp/custom.el" user-emacs-directory))
(load-file custom-file)
