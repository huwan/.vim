MD := @mkdir
RM := rm
CD := @cd
CP := @cp
LN := @ln
VIM:= @vim

DIR_VIMFILES=${PWD}
DIR_NEO=bundle/neobundle.vim
REPO_NEO=git://github.com/Shougo/neobundle.vim
NEO_REMOTE_URL=$(shell mkdir -p $(DIR_NEO); cd $(DIR_NEO); git config --get remote.origin.url)

VIMRC=${HOME}/.vimrc
all: install

clean:
	$(RM) -rf $(DIR_NEO)

check:
	$(MD) -p $(DIR_NEO)

update: check
ifeq ($(NEO_REMOTE_URL),$(REPO_NEO))
	@echo "Updating NeoBundle"
	@echo $(DIR_VIMFILES)
	$(CD) $(DIR_NEO) ; git fetch origin -q; git rebase origin -q
	$(CD) $(DIR_VIMFILES)
else
	@echo "Checking out latest NeoBundle"
	$(CD) $(DIR_VIMFILES) ; git clone $(REPO_NEO) $(DIR_NEO);
endif

backup:
	$(RM) -f "$(VIMRC).bk" "$(GVIMRC).bk"
	$(CP) -f $(VIMRC) "$(VIMRC).bk" 2>/dev/null

install: update
	@echo "Running setup script"
	@echo "Linking .vimrc"
	$(LN) -fs "$(DIR_VIMFILES)/_vimrc" $(VIMRC)
	$(VIM) +NeoBundleClean +NeoBundleCheck
	@echo
	@echo "Vim setup finished"
