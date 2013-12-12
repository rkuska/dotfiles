# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias vim="gvim -v"
alias install="sudo yum install"
alias mv="mv -i"
alias rm="rm -i"
alias shutdown="sudo shutdown -h now"
alias irssi="screen irssi"
alias gcc="gcc -Wall -Wextra -pedantic -std=c99 -fdiagnostics-color=auto"
alias mc="mc --colors base_color=lightgray,green:normal=green,default:selected=white,gray:marked=yellow,default:markselect=yellow,gray:directory=blue,default:executable=brightgreen,default:link=cyan,default:device=brightmagenta,default:special=lightgray,default:errors=red,default:reverse=green,default:gauge=green,default:input=white,gray:dnormal=green,gray:dfocus=brightgreen,gray:dhotnormal=cyan,gray:dhotfocus=brightcyan,gray:menu=green,default:menuhot=cyan,default:menusel=green,gray:menuhotsel=cyan,default:helpnormal=cyan,default:editnormal=green,default:editbold=blue,default:editmarked=gray,blue:stalelink=red,default"
alias xflux="xflux -l 49.10 -g 16.35"
function ? {
	ls *$@*
}


. ~/utils/z/z.sh



echo -e ""
echo -ne "Today is "; date
echo -ne "Up time:";uptime | awk /'up/'
echo "";
