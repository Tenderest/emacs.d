(setq ring-bell-function 'ignore)

;; 自动刷新文件
(global-auto-revert-mode t)

;; 显示行号
(global-linum-mode t)

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; myname
					    ("myname" "liyunfeng")
					    ;; Linux
					    ("linux" "Linux")
					    ))


;; 关闭自动备份
(setq make-backup-files nil)
(setq auto-save-default nil)


(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-item 20)


;; 替换选中部分文字
(delete-selection-mode t)

;; 开启括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(provide 'init-better-defaults)
