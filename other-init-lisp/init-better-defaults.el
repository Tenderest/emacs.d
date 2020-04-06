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


;; Company 有时候补全功能并不是非常理想，这时就可以使用 Hippie Expand 来完成补全。
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))


;; 当询问yes or no 的时候替换成y or n
(fset 'yes-or-no-p 'y-or-n-p)

(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 启用 dired-x 可以让每一次进入 Dired 模式时，使用新的快捷键 C-x C-j 就可以进 入当前文件夹的所在的路径
(require 'dired-x)
;; 使用 (setq dired-dwin-target 1) 则可以使当一个窗口（frame）中存在两个分屏 （window）时，将另一个分屏自动设置成拷贝地址的目标。
(setq dired-dwim-target t)

(provide 'init-better-defaults)
