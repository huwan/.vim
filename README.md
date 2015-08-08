```
__     _____ __  __ ____   ____
\ \   / /_ _|  \/  |  _ \ / ___|
 \ \ / / | || |\/| | |_) | |
 _\ V /  | || |  | |  _ <| |___
(_)\_/  |___|_|  |_|_| \_\\____|

```

VIM 配置文件
===========
给程序员更多关爱

## 支持特性
- 使用[NeoBundle](http://github.com/Shougo/neobundle.vim)管理VIM插件
- 预置常用的VIM插件（见预置插件列表）
- 支持Linux官方要求的开发[代码风格](https://www.kernel.org/doc/Documentation/CodingStyle)

## 快速安装

```
$ git clone https://github.com/huwan/.vim.git ~/.vim
$ cd ~/.vim
$ make
```
运行`vim`, 按照提示安装预置的插件（bundles/plugins）即可。

####部分快捷键
使用VIM 编辑代码文件时：
- `F2`: 去掉文件内容一行末尾有多余的空格
- `F4`: 生成`ctags` 和`cscope`的数据库文件，并自动加载
- `gcc`: 注释当前行
- `ctrl` + `c`: cscope 快捷键，显示调用当前光标所在函数的函数

## 高级配置
### NeoBundle
[NeoBundle](https://github.com/Shougo/neobundle.vim)是一个管理VIM 插件的插件。

通过使用NeoBundle，你可以不必自己去下载插件，然后再放到vim的配置插件目录下，只需要简单的在`.vimrc` 文件中`" My Bundles here:`下面添加一行形式如`NeoBundle '<plugin repository location>'`的内容即可。NeoBundle 默认在github上面去找你添加的插件，以vim-airline( https://github.com/bling/vim-airline )插件为例，仅需添加`NeoBundle 'bling/vim-airline'`即可安装。

虽然NeoBundle 也支持其它地方的插件，但常见的插件github上都有了，特别是在[vim-scripts](https://github.com/vim-scripts) 搬运了很多vim.org 上的插件到上面去之后，实在有需要的话自己手动安装可能更方便。

参考 `:help neobundle` 内容查看更多示例和命令帮助。

### 推荐安装的插件
下面的插件是这个配置文件中预置的，如果有不需要的插件，注释掉即可。

```
 NeoBundle 'bling/vim-airline'
 NeoBundle 'terryma/vim-multiple-cursors'
 NeoBundle 'vim-scripts/autotags'
 NeoBundle 'chazy/cscope_maps'
 NeoBundle 'scrooloose/nerdtree'
 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'majutsushi/tagbar'
 NeoBundle 'tpope/vim-commentary'
 NeoBundle 'terryma/vim-expand-region'
 " NeoBundle 'Shougo/unite.vim'
 NeoBundle 'junegunn/vim-easy-align'
 " NeoBundle 'vim-scripts/sudo.vim'
 NeoBundle 'vivien/vim-addon-linux-coding-style'
```
插件的详细使用请参考各个插件的帮助文件，其中autotags需安装ctags 和cscope。Ubuntu 下可以通过如下命令安装：
```
$ sudo apt-get install ctags cscope
```
