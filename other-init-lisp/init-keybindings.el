;;(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)

;; 切换菜单和工具栏显示
(global-set-key (kbd "<f10>") 'switch-menu-tool-bar)
;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f12>") 'open-init-file)


;; 这个快捷键绑定可以用之后的插件 counsel 代替
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(global-set-key (kbd "C-x C-r") 'counsel-recentf)

;; 查找在git管理下的文件，需要提交以后才能查找
;; C-c 修饰键指用户自己定义的快捷键修饰
;; p : Project
;; f : Files
(global-set-key (kbd "C-c p f") 'counsel-git)

(global-set-key (kbd "<f11>") 'load-theme)


;; 更改默认的C-M-\缩进快捷键，修改代码缩进问题
(global-set-key (kbd "C-M-\\") 'all-select)

;; Company 有时候补全功能并不是非常理想，这时就可以使用 Hippie Expand 来完成补全。
(global-set-key (kbd "s-/") 'hippie-expand)

;; 修改复制粘帖的快捷键
(global-set-key (kbd "C-S-c") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-S-v") 'clipboard-yank)

;; 快速选中单词的快捷键，使用expand-region插件
(global-set-key (kbd "C-=") 'er/expand-region)

(provide 'init-keybindings)
