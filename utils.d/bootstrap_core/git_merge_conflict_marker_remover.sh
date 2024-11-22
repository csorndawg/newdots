# Auto remove git merge conflict markers

# example usage: sed -Ei '/^(\|.\||<<<|>>>|===)/d' $FNAME	# only add `i` after checking output

GIT_MERGE_CONFLICT_FLAGS_RGX='^(\|.\||<<<|>>>|===)'
sed -E '/"$GIT_MERGE_CONFLICT_FLAGS_RGX"/d' "$FNAME" -i
