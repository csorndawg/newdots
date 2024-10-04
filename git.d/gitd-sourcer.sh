DELTA_BINARY="$(whereis delta | egrep ":.+" -o)"
BAT_BINARY="$(whereis delta | egrep ":.+" -o)"

# true if delta available 
if [ "$DELTA_BINARY" -gt 0 ];
	echo ""
	echo "Delta available"
	pager = delta
	# do 
elif [ "$BAT_BINARY" -gt 0 ];
	echo ""
	echo "Delta missing, but BAT available"
	pager = bat
else
	echo ""
	echo "Delta and BAT missing, using colorized LESS as fallback"
fi
	


# function for any extra delta configuration requirements/addons 
delta_extra() {
}
