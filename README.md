# VIM\_CONFIG #

## Introduction

Another vim config... yes this time to simplify and make it easy to link and
unlink bundles.

This is a vim configuration based on the vim\_config by [duwanis](http://www.duwanis.com
"Duwanis.com"). I had some issues running the full suite of plugins/config
values in the original duwanis config, so I did the following:

 * Cut it down
   * dropped a bunch of plugins that I don't really use
   * fixed the ruby.vim config to set the imaps/nmaps always (the original
     method caused vim to slow down on keyrepeat on large ruby files)
 * Dropped git submodules
   * This makes it easier to make changes as required and add new
     plugins as need. I figured I would manually update the contents anyway.
 * Dropped Command-T - Using CTRL-P instead
   * No compilation needed. Supports MRU and other options too.
 * Support 256-Color terminals
   * Config works with VIM and MacVim

## Installation

Make sure you have rvm installed (we use it to switch to the system ruby
so that commandT can be recompiled automatically).

Run the following

    bash < <(curl -sk https://raw.github.com/jyn/jyn_vim_config2/master/install.sh)

## Features

* [Ack.vim](http://github.com/mileszs/ack.vim "Ack.vim at github")
* [AutoClose](http://github.com/Townk/vim-autoclose "Autoclose at github")
* [ctrlp](https://github.com/kien/ctrlp.vim.git "CTRLP at github")
* [Endwise](http://github.com/tpope/vim-endwise "vim-endwise at github")
* [Fugitive](http://github.com/tpope/vim-fugitive "vim-fugitive at github")
* [NERDCommenter](http://github.com/scrooloose/nerdcommenter "nerdcommenter at
  github")
* [NERDTree](http://github.com/scrooloose/nerdtree "nerdtree at github")
* [Rails.vim](http://github.com/tpope/vim-rails "vim-rails at github")
* [Rake.vim](http://github.com/tpope/vim-rake "vim-rake at github")
* [Snipmate.vim](http://github.com/msanders/snipmate.vim "snipmate.vim at
  github")
* [Surround.vim](http://github.com/tpope/vim-surround "vim-surround at github")
* [Syntastic](http://github.com/scrooloose/syntastic "syntastic at github")
* [YankRing](http://github.com/chrismetcalf/vim-yankring "yankring at github")

## Structure

This vim config makes use of Tim Pope's pathogen plugin, which allows all other
plugins to be split into their own individual folders rather than jumbled
together in vim's default locations. This means that if you want to copy this
config but don't like a few of the plugins, you can very easily identify what
needs to be removed.

* bundle - this is the special folder pathogen uses to store plugins. Activated
  bundles are just symbollically linked in.
* bundle-src - this is the folder to store actual bundle sources.
* config - this is where all the custom config files are kept. If you look in
  the vimrc file, you'll see where everything in this folder is loaded
  recursively (even subfolders, if you're obsessive about organizing your config
  settings).
* config/private - this folder is included in .gitignore in case you have some
  personal stuff that you don't want to share (for example, if you want to blog
  using vim, but you don't want to keep your username and password in a git
  repository somewhere :D).

## General Settings

* in Vim, you can define a mapleader key, which you can then use for
  keybindings. I personally prefer to use the semicolon (';') for the mapleader,
  since it's right there on the home row. If you'd like to change it to
  something else (it defaults to '\\', and I know several people who prefer the
  comma (',')), you can find that setting in the vimrc file. For the rest of
  this README I'll use `<Leader>` to indicate a keybinding that makes use of the
  mapleader - e.g. `<Leader>t` means hit `<Leader>` (the semicolon, unless you've
  changed it) and then the `t` key.
* Vim's default navigation keys - `h`,`j`,`k`, and `l`, can be used to navigate
  between windows if preceded by Ctrl-W. I do this often enough (and hate
  hitting Ctrl enough) that I've created bindings to do this with the mapleader:
  `<Leader>h`,`<Leader>j`,`<Leader>k`, and `<Leader>l`.
* In a similar fashion, I've created bindings for `:w!` and `:q!` : `<Leader>w`
  and `<Leader>q`.
* Tab-completion is enabled on the command-line (`:...`), the settings for this
  are found in `vim/config/completion.vim`.
* General display settings (color theme, statusbar, etc.) can be found in
  `vim/config/display.vim`.
* General editing settings (indentation settings, etc.) can be found in
  `vim/config/editing.vim`.).
* GUI-specific settings are located in `vim/config/gui.vim`.
* Search-related settings (incremental search, highlighting of search terms, and
  the like) are found in `vim/config/search.vim`.
* Temporary files are kept in one central location so that they don't clutter
  your project folders. Rather than warning you when you open a file that
  already has a swapfile (e.g. a file that's open in another vim session), vim
  should now quietly let you edit the file, which is much less annoying. These settings can be found in
  `vim/config/tempfiles.vim`.

## PLUGINS ##

### Ack.vim ###

Ack is better than grep. Ack.vim lets you use Ack to search in the current
directory. It then loads the results into Vim's "quickfix" window for easy
browsing. `<Leader>A` (note that's Shift-a) is configured to bring Ack up ready to search in
`.vim/config/ack.vim`.

### AutoClose ###

Autoclose monitors when you type paired characters (like `"`, `(`, etc.) and
automatically places the closing character for you. e.g. you can type `"` and
autoclose will automatically change it to `"|"` (where the '|' in this case
represents your cursor location). If you don't want to use autoclose in
a certain situation, you can use the `<Leader>a` binding to toggle it.

### CTRLP ###

In the Mac OS X application TextMate, you can use Cmd-t to do a 'fuzzy' search
for files in your current working directory. CTRLP is a plugin that duplicates
this functionality - using `<Leader>t` by default. Just start typing and you'll see it in
action.

### Endwise ###

Endwise attempts to intelligently insert 'end' in Ruby/VimL. It's likely not
useful if you're working with other languages.

### Fugitive ###

Fugitive is an awesome git wrapper for Vim. When you're working in a git
repository, the following keybindings are available for you:

* `<Leader>gs` - bring up Fugitive's GitStatus window.
* `<Leader>gc` - bring up a window for committing the current changes to git.
* `<Leader>gp` - push your changes to origin master.

I also added a couple of git-svn keychains:

* `<Leader>gnd` - git svn dcommit (push your git revisions to subversion)
* `<Leader>gnr` - git svn rebase (pull the latest from subversion and integrate
  it with your local changes)

`:help fugitive` will let you browse the full documentation for fugitive.

You can also check the configuration changes I made in
`vim/config/fugitive.vim`.


### NERDCommenter ###

NERDCommenter is a nice plugin that allows you to comment/uncomment lines of
code quickly and easily. I've set up a keybinding for it so that `<Leader>c`
will toggle the comment status ofthe current line of code (that is, comment it
if it's not already commented, or uncomment it if it is already commented).
   This also works with line-motion commands - for example, `3<Leader>c` will
   comment the next 3 lines of code, `G<Leader>c` will comment every line until
   the end of the file, etc. You can run `:help NERDCommenter` to see the help
   info, and check out the config changes I've made in
   `vim/config/nerdcommenter.vim`.

### NERDTree ###

NERDTree is a file-navigation buffer that works like the 'drawer' in other
editors. It gives you quick and easy access to the file tree for your current
working directory, a way to bookmark directories so that you can access them
later, and lots of other nice functionality. `<Leader>d` is configured to toggle
the 'drawer' buffer for you. You'll also want to check out the help - `:help
NERDTree`, or simply press `?` while you're in the NERDTree buffer to see the
list of keyboard shortcuts you can use. The configuration for NERDTree is
present in `vim/config/nerdtree.vim`.

### Rails.vim ###

Rails.vim provides a lot of nice functionality for working with Rails
applications. There's a lot of really cool functionality that would take a while
to explain - if you do any rails work, you should run `:help rails-introduction`
and read up on everything that it offers.

I've made a couple of config changes to rails.vim (mostly changing the automatic
2-space setting that it uses for indentation, since I'm required to use 3 spaces
at work), which can be found in `vim/config/rails.vim`.

### SnipMate ###

SnipMate gives you snippets - pieces of often typed text you can insert into
your document using a trigger word. Checkout the help files (`:help snipmate`)
or view the plugin's website at vim.org for more specifics.

### Surround.vim ###

Surround.vim allows you to do fancy things with surrounding
characters/strings... it's really useful if you're working in a tag-based
language like HTML or XML. I could describe it more fully here, but the help
file has a more than sufficient explanation and tutorial: `:help surround`.

### Syntastic ###

Syntastic provides syntax-checking for you when you load/write to a buffer. It
has syntax checkers for several popular programming languages/markup languages
(look in `vim/syntax_checkers/` for the full list), and will automatically flag
any errors/warnings it finds. You can check the helpfile for it at `:help
syntastic`, and see the configuration settings I use in
`vim/config/syntastic.vim`.

### YankRing ###

YankRing adds the equivalent of Emacs' "Kill Ring" to Vim. It wraps Vim's
default yank/delete mechanisms and allows you to easily work with the last `n`
items that you've put in Vim's registries - it's sort of a clipboard manager for
Vim.

`:help yankring` will give you the full rundown as well as a tutorial.

You can also view the configuration I've set up by examining
`vim/config/yankring.vim`.

