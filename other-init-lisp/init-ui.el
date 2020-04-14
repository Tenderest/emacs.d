;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 关闭启动帮助画面
(setq inhibit-splash-screen t)

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
;;(tool-bar-mode -1)
;; 关闭菜单栏
;;(menu-bar-mode -1)
(setq liyunfeng-cond (progn
		       (menu-bar-mode t)
		       (tool-bar-mode t)))
(defun switch-menu-tool-bar ()
  (interactive)
  (if liyunfeng-cond
      ;; then
      (setq liyunfeng-cond (progn (menu-bar-mode -1) (tool-bar-mode -1)) )
    ;; else
    (setq liyunfeng-cond (progn (menu-bar-mode t) (tool-bar-mode t)) )
    )
  )

;;(if COND THEN ELSE...)

;; If COND yields non-nil, do THEN, else do ELSE...
;; Returns the value of THEN or the value of the last of the ELSE’s.
;; THEN must be one expression, but ELSE... can be zero or more expressions.
;; If COND yields nil, and there are no ELSE’s, the value is nil.


;; 高亮当前行，当文本内容很多时可以很容易找到光标的位置
(global-hl-line-mode t)

;; 将 Emacs 设置为开启默认全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))


(provide 'init-ui)
