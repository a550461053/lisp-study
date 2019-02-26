# 开发环境

## emacs
- emacs安装
1. 下载
官网：www.gnu.org/software/emacs/
找到windows的ftp链接：ftp.gnu.org/gnu/emacs/windows/emacs-25
下载：emacs-25.2-x86_64.zip和emacs-25-x86_64-deps.zip
可见百度云盘：
2. 解压
先解压emacs-25.2-x86_64.zip
然后解压deps时候选择同一路径，覆盖解压
或者分别解压后，deps覆盖上一结果。
3. 配置
可以把上一解压后的文件夹存在任意位置
可以选择添加bin路径的环境变量
发送图标到桌面

- emacs特点
	+ Emacs 最基本的哲学： 用最少的指头运动幅度来操作光标的移动， 其实我们写程序最占时间的有两个： 发呆思考和光标移动， 像智能补全都属于耗时的小头， 想象一下如果每一次光标的移动都能节省1秒， 一天无数次的光标移动要节省多少时间啊？ 呵呵， 其实很多编程高手不是因为他多聪明， 而是他的编程工具效率要比传统的编程工具的效率高很多倍。
	+ 
- emacs和vim
	+ emacs是神的编辑器，All-in-One的理念
	+ vim是编辑器之神，“一个程序只做一件事并做好它”的 Unix哲学
	+ 设计哲学
		* vim的前身是vi，更符合Unix传统，通过管道机制和系统内各种积木工具打交道，主打和系统内的工具程序协作完成任务；定位很明确，就是要做强大的编辑器
		* emacs：All-in-One，就像一个操作系统
- emacs就是用emacs lisp编写的

- emacs基本使用(wiki)

0. 启动Emacs: 可以点击Emacs图标启动，也可以在命令行下直接输入emacs。启动以后会看到一个欢迎界面，按 q 关闭它即可进入普通编辑器模式。
1. 在编辑区域尝试直接输入 I love emacs , 怎么样？ 和普通编辑器没啥差别吧？ ;)
2. 我们接下来进行简单的移动操作， 按一下上下左右键， 哈哈， 一样的啊， 没啥碉堡的啊？
3. 尝试高级编辑器的移动功能： ‘Ctrl + 右’ 会向右按照词来移动， 而不是一个字母一个字母的移动，再试试 ‘Ctrl + 左’ , 一样的按照词向左移动， 呵呵， 还行。
4. 我们用另外一种按键来执行按词移动操作： ‘Alt + f’ 和 ‘Alt + b’, 是不是一样按词移动啊？ 那为啥要教这种非主流的按键？ 你是不是发现当你按 ‘Alt + f’ 和 ‘Alt + b’ 的时候双手都没有离开主键区？ 我们不用像按 ‘Ctrl + 左’ 那样双手都要做大范围的移动和跳跃。 这就是 Emacs 最基本的哲学： 用最少的指头运动幅度来操作光标的移动。
5. 接下来我们再试一下按 ‘Ctrl + a’ 移动到行首， ‘Ctrl + e’ 移动到行尾， 是不是要比按 HOME 和 END 键快啊？ 我以前就看到很多程序员移动到行首都是按着左键不放， 眼睛看着光标从屏幕右边一路晃过去， 是不是躺枪了 ？ ;)
6. 其他类似的光标移动按键： ‘Ctrl + n’ 下一行， ‘Ctrl + p’ 上一行。
7. 编辑功能： ‘Ctrl + d’ 向右删除字符， ‘Alt + d’ 向右按词删除， ‘Ctrl + k’ 从光标处一直删除到行尾（躺枪的同学是不是按 End 键到行尾然后一路 Backspace 键啊， 哈哈）
8. 跟着我玩一下字符大小写变化： ‘Ctrl + a’ 移动到行首， 然后一直按 ‘Alt + u’ 是不是所有的单词都变成大写了啊？ 变成小写咋玩啊？ 按 ‘Ctrl + a’ 移动到行首， 然后按着 ‘alt + l’ 不要放。 那首字母大写呢? 很简单按 ‘Alt + c’。 那些打各种字符然后删除只是大小写不同的重复字母的同学， 这些小功能是不是非常贴心啊？
9. 有时候我们的时候非常想快速交换两个单词， 我们可以把光标移动到 love 和 emacs 两个单词之间， 然后按 ‘Alt + t’ , 是不是神奇的交换了啊？ 有时候我们单词拼写错误， 两个字符之间顺序敲错了， 可以尝试把光标移动到单词中间， 然后按 ‘Ctrl + t’ , 看到没？ 其实 Emacs 很多按键都是 Ctrl 和 Alt 对应同一个字符表示按键的， 比如 Ctrl + f 就是按字符移动， Alt + f 按词移动， Ctrl + d 按字符删除， Alt + d 按词删除， 都是非常容易联想记忆的。
10. 保存: 按 Ctrl + x 然后再按 Ctrl + s , Emacs 会在底部提示你输入要保存的文件名， 写上 emacs.txt 然后按回车， 欧拉。
11. 退出: 按 Ctrl + x 然后再按 Ctrl + c。 退出好奇怪啊？ 是啊， Emacs的流行度不高就是有很多奇怪的地方， 但是相对于上面我们说的各种贴心功能还是可以忍受的， 就像天才都有怪癖一样。

## clisp
- clisp安装
	+ 直接下载：https://clisp.sourceforge.io
	+ 版本：2.49
- windows下mingw64-bash开发

# Lisp简介
1. 参考资料
- CLisp中文翻译版：https://acl.readthedocs.io/en/latest/
- 
2. Lisp是什么？
- Lisp是继FORTRAN之后，仍在使用的最古老的程序语言。
- Lisp能够自我进化，能用lisp定义新的lisp操作符——你在用lisp语言编程时，也在创造一个属于自己的程序语言
- 特色：
	+ 宏、闭包、运行期类型
	+ 可扩展：自己定义操作符
	+ 可重用：自下而上的编程方法，写可重用软件的本质是把共同的地方从细节中分离出来，而由下而上的编程方法本质地创造这种分离。
	+ 编程是即时的：
	+ 交互式语言：
3. Lisp开发的语言
- GNU Emacs
- Autocad
- Interleaf
4. Lisp的理解
- 其他语言，相当于一种集中式的管理，由语言开发者统一定义整个语言的规则
- 而Lisp则是一种分布式的管理，应用开发者都可以管理lisp语言
5. Lisp和C语言区别
- Form形式
	+ Lisp都是采用(操作符 实参1 实参2 )，前缀表达式，逆波兰，用单一的表示法，来表达所有的概念。
	+ C：算术表达式是中序表示法；函数调用采用前序表示法，实参还要用逗号隔开；表达式用分号隔开；一段程序还要用大括号隔开。
- 
6. 


# Lisp语法
1. 语法
- 调用程序
	+ clisp a.lisp
- 加载程序
	+ clisp
	+ (load "a.lisp")
2. 列表
- 创建列表：
	+ list(a b c)
	+ (cons 1 '(2 3)) 
		* cons第二个参数为list，把1插入到list前面
	+ (cons 'a nil)
		* (A)
		* nil既是一个原子，也是一个list
	+ cons箱子表示法box notation
		* 每个cons内含一个car和cdr指针
- 空表：()或者 nil
- 取出首元素：car('(a, b)]
- 取得去掉首元素的列表：cdr('(a, b))
- append
	+ (append '(a b) '(c d))
	+ 返回：(A B C D)
	+ 把后续的list连接在前面的list上
3. 变量
- let 局部变量
	+ (let ((x 1) (y 2))
	+    (+ x y))
- setf 全局变量
	+ (setf x (list 'a 'b))
4. 输出
- (format t "~A plus ~A equals ~A. ~%" 2 3 (+ 2 3))
- 第一个实参t：表示输出被送到缺省的地方去，通常是顶层
- 第二个实参：输出模板的字符串，~A表示被填入的位置，~%表示一个换行
- 
5. 输入
- (defun myread (string)
-  (format t "~A" string)
-  (read)
- )
- 调用：
- (myread "who are you?")
- 
6. 循环
- (variable initial update)
- variable 是一个符号
- initial 和 update 是表达式

7. 迭代
```
;; 求start到end之间整数的平方
(defun mysquare (start end)
	(do ((i start (+ i 1)))
		((> i end) 'done)
		(format t "~A ~A~%" i (* i i))
	)
)
```
8. 递归
```
;; 递归实现上述功能
(defun mysquare (i end)
	(if (> i end)
		'done
		(progn
			(format t "~A ~A~%" i (* i i))
			(mysquare (+ i 1) end)
		)
	)
)
```
9. 函数作为对象
- 和quote类似，function是一个特殊操作符
- quote的缩写是'，function的缩写是#' 升引号
- 比如：实现累加的功能
```
;; +是内置系统函数
(+ 1 2 3)
;; apply 接受的实参是一个函数和实参列表
(apply #'+ '(1 2 3))
;; apply 可以接受任意数量的实参，只要最后一个实参是list
(apply #'+ 1 2 '(3 4 5))
;; funcall 做的是一样的事情，但不需要把实参包装成list
(funcall #'+ 1 2 3)
```
10. lambda
- (lambda (x y) (+ x y))
	+ 列表(x y)是形参列表，后面是函数主体
- 一个lambda表达式也可以作为函数名
	+ ((lambda (x) (+ x 100) 1)
- 得到labmda函数对象：
	+ (funcall #'(lambda (x) (+ x 100)) 1)
11. 类型types
- clisp里面，数值才有类型，变量没有
- 不需要声明变量类型，变量可以存放任意对象
- 内置类型，是一个类别的层级，对象不止属于一个类型
	+ 数字2的类型：fixnum,integer,rational,real,number,atom,t
- t类型是所有类型的积累，每个对象都属于t类型
- 判断对象类型
	+ (typep 2 'integer)
12. equal等式
- (eql a b)
- 
13. lisp没有指针
- lisp没有显式指针explicitly pointer
- lisp中每一个值都是一个指针，赋值的时候就是存储指针
- 
14. 映射函数
- (mapcar #'list '(a b c) '(1 3 2))
- 一个函数，和一个或多个列表
15. 树Trees
- cons对象可以看成是二叉树，car表示左子树，cdr表示右子树
- 
16. 

# lisp编程
```
;; 实现length函数
(defun mylen (list)
	(if (null list)
		0
		(+ (mylen (cdr list)) 1)
	)
)
```

```
;; 实现append函数

(defun double-append (a b)
	(cond 
		( (null a) b)
		( (null b) a)
		(t 
			(cons (car a) (double-append (cdr a) b))
		)
	)
)

(defun triple-append (a b c)
	(double-append a (double-append b c))
)
```

```
;; 实现progn顺序流程函数
(defun my-progn (x1 x2)
	(and x1 x2)
)

(defun my-progn (x1 x2)

)

```

```
;; 实现caar等car和cdr的迭代函数
(defun my-caar (a)
	(car(car a))
)

(defun my-cdar (a)
	(cdr(car a))
)
```

# 项目作业1
- 需求
	+ 不能使用循环等lisp的高级用法
	+ 局限于：null,atom,equal,and,or,not,car,cdr,cons,list,mapcar,defun,apply,funcall,function,quote,eval,let,let*,setq,cond
	+ 目的：领悟lisp的高扩展性开发理念
- 测试
	+ 共五道题，详见pdf
	+ cd mmm/
	+ clisp mmm_test.clisp

# 项目作业2
- 需求
	+ 作业地址：https://eclass.srv.ualberta.ca/portal/
	+ 局限于：需要满足函数式编程的理念，避免使用显示循环、爆炸性赋值等
- 测试
	+ 共六道题，详见word
	+ clisp
	+ (load "a2-my.lisp")
	+ (load "a2-public-tests.lisp")
	+ 运行测试语句即可。


