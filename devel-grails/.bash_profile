# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export JAVA_HOME=/usr/lib/jvm/java-openjdk
export GRAILS_HOME=$HOME/devel/lib/grails
export EDITOR=vi

PATH=$GRAILS_HOME/bin:$JAVA_HOME/bin:$PATH:$HOME/.local/bin:$HOME/bin

export PATH
