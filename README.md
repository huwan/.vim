```
           __  __  _____  _____ _____ _______
     /\   |  \/  |/ ____||_   _/ ____|__   __|
    /  \  | \  / | (___    | || |       | |
   / /\ \ | |\/| |\___ \   | || |       | |
  / ____ \| |  | |____) | _| |_ |____   | |
 /_/    \_\_|  |_|_____(_)_____\_____|  |_|

```

VIM 配置文件
===========
透过配置给程序员更多关爱

## 支持特性
- 使用[NeoBundle](http://github.com/Shougo/neobundle.vim)管理VIM插件
- 预置常用的VIM插件（见预置插件列表）
- 支持FFmepg 官方要求的开发代码风格和[编码规范](http://ffmpeg.org/developer.html#Coding-Rules-1)

## 快速安装

```
$ git clone git://github.com/mengyingchina/.vim ~/.vim
$ cd ~/.vim
$ make
```
运行`vim`, 按照提示安装预置的插件（bundles/plugins）即可。

####部分快捷键
使用VIM 编辑代码文件时：
- `F2`: 格式化代码中的空格和TAB缩进方式(4 spaces, no tabs)
- `F4`: 生成`ctags` 和`cscope`的数据库文件，并自动加载
- `<C-]>`: 跳转到定义
- `gcc`: 注释当前行
- 待补充

## 高级配置
### NeoBundle
[NeoBundle](https://github.com/Shougo/neobundle.vim)是一个管理VIM 插件的插件。

通过使用NeoBundle，你可以不必自己去下载插件，然后在放到vim的配置插件目录下，只需要简单的在`.vimrc` 文件中`" My Bundles here:`下面添加一行形式如`NeoBundle '<plugin repository location>'`的内容即可。NeoBundle 默认在github上面去找你添加的插件，以vim-airline(https://github.com/bling/vim-airline)插件为例，仅需添加`NeoBundle 'bling/vim-airline'`即可安装。

虽然NeoBundle 也支持其它地方的插件，但常见的插件github上都有了，特别是在[vim-scripts](https://github.com/vim-scripts) 搬运了很多vim.org 上的插件到上面去之后，实在有需要的话自己手动安装可能更方便。

参考 `:help neobundle` 内容查看更多示例和命令帮助。

### 推荐安装的插件
下面的插件是这个配置文件中预置的，如果有不需要的插件，注释掉即可。

```
 NeoBundle 'bling/vim-airline'
 NeoBundle 'terryma/vim-multiple-cursors'
 NeoBundle 'vim-scripts/autotags'
 NeoBundle 'chazy/cscope_maps'
 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'majutsushi/tagbar'
 NeoBundle 'tpope/vim-commentary'
 NeoBundle 'terryma/vim-expand-region'
 NeoBundle 'Shougo/unite.vim'
 NeoBundle 'junegunn/vim-easy-align'
 NeoBundle 'vim-scripts/sudo.vim'
```
插件的详细使用请参考各个插件的帮助文件，其中autotags需安装ctags 和cscope。


### FFmpeg 开发相关配置
请阅读 FFmpeg Developers Guide 中提到相关的 [Coding Rules](http://ffmpeg.org/developer.html#Coding-Rules-1) :
>- Code formatting conventions
>   - Indent size is 4.
>   - The TAB character is forbidden outside of Makefiles as is any form of trailing whitespace.
>   - You should try to limit your code lines to 80 characters; however, do so if and only if this improves readability.
>- Comments
>- C language features
>- Naming conventions
>- Miscellaneous conventions
>- Editor configuration

已经在` .vimrc`中加入配置以符合FFmpeg的格式要求。

当文件内容一行末尾有多余的空格或者tab与空格缩进混用时会提示 Trailing或Mixed-indent 并高亮，可以按`F2`来格式化代码。

### 自定义配置
在符合编码规范的前提下，可以自己定制符合自己习惯的配置，欢迎共享你认为特别值得推荐的配置，以让更多人享受到编码的乐趣。
