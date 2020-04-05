;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 关闭启动帮助画面
(setq inhibit-splash-screen t)

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
;;(tool-bar-mode -1)

;; 高亮当前行，当文本内容很多时可以很容易找到光标的位置
(global-hl-line-mode t)

;; 将 Emacs 设置为开启默认全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))


(provide 'init-ui)
