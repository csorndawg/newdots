#------------------------------------------------------------------------------
#  Description:  This file holds experimental bashrc aliases.
#
#  Sections:
#  1.   File and Folder Management
#  2.   Searching
#  3.   Process Management
#  4.   Networking
#  5.   Date & Time Management
#  6.   Other/Miscellaneous Aliases
#
#  X.   Reminders & Notes
#
#------------------------------------------------------------------------------

#   -------------------------------
#   1.  FILE AND FOLDER MANAGEMENT
#   -------------------------------

alias numFiles='_omb_util_print $(ls -1 | wc -l)'       # numFiles:     Count of non-hidden files in current dir
alias make1mb='truncate -s 1m ./1MB.dat'     # make1mb:      Creates a file of 1mb size (all zeros)
alias make5mb='truncate -s 5m ./5MB.dat'     # make5mb:      Creates a file of 5mb size (all zeros)
alias make10mb='truncate -s 10m ./10MB.dat'  # make10mb:     Creates a file of 10mb size (all zeros)


#   ---------------------------
#   2.  SEARCHING
#   ---------------------------

alias qfind="find . -name "                 # qfind:    Quickly search for file


#   ---------------------------
#   3.  PROCESS MANAGEMENT
#   ---------------------------

#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
    alias memHogsTop='top -l 1 -o rsize | head -20'
    alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
    alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing (every 10 seconds)
#   -----------------------------------------------------
    alias topForever='top -l 9999999 -s 10 -o cpu'

#   ttop:  Recommended 'top' invocation to minimize resources
#   ------------------------------------------------------------
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
#   ------------------------------------------------------------
    alias ttop="top -R -F -s 10 -o rsize"


#   ---------------------------
#   4.  NETWORKING
#   ---------------------------

alias netCons='lsof -i'                         # netCons:      Show all open TCP/IP sockets
alias lsock='sudo lsof -i -P'                   # lsock:        Display open sockets
alias lsockU='sudo lsof -nP | grep UDP'         # lsockU:       Display only open UDP sockets
alias lsockT='sudo lsof -nP | grep TCP'         # lsockT:       Display only open TCP sockets
alias openPorts='sudo lsof -i | grep LISTEN'    # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'              # showBlocked:  All ipfw rules inc/ blocked IPs


#   ---------------------------------------
#   5.  DATE & TIME MANAGEMENT
#   ---------------------------------------

alias bdate="date '+%a, %b %d %Y %T %Z'"
alias cal3='cal -3'
alias da='date "+%Y-%m-%d %A    %T %Z"'
alias daysleft='_omb_util_print "There are $(($(date +%j -d"Dec 31, $(date +%Y)")-$(date +%j))) left in year $(date +%Y)."'
alias epochtime='date +%s'
alias mytime='date +%H:%M:%S'
alias secconvert='date -d@1234567890'
alias stamp='date "+%Y%m%d%a%H%M"'
alias timestamp='date "+%Y%m%dT%H%M%S"'
alias today='date +"%A, %B %-d, %Y"'
alias weeknum='date +%V'

#   ---------------------------------------
#   6.  OTHER ALIASES
#   ---------------------------------------

