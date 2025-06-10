#!/bin/sh

# parameters:
#	a raw "Fixes" tag
# returns:
# 	0 when tag commit abbreviation refers to a commit object
# 	1 when tag commit message can be used to uniquely identify commit
# 	2 when tag commit message cannot identify commit
check_fixes_tag() {
	tag="$1"
	prefix=$(echo "$tag" | sed -nE "s/^\s*Fixes: ([0-9a-f]{12,}).*/\1/p")
	shortlog=$(echo "$tag" | sed -nE "s/^\s*Fixes: ([0-9a-f]{12,}).*\(?\"(.+)\"\)?.*/\2/p")

	git cat-file -e $prefix^{commit} > /dev/null 2>&1
	if [ $? = 0 ]
	then
		return 0
	fi

	if [ "$shortlog" = "" ]
	then
		return 2
	fi

	shortlogsha=$(echo "$shortlog" | sha1sum | sed -nE "s/^([0-9a-f]{40}).*/\1/p")
	if [ ! -e "$shortlogmap/$shortlogsha" ]
	then
		return 2
	fi

	if [ $(wc -l < "$shortlogmap/$shortlogsha") -gt 1 ]
	then
		return 2
	fi

	return 1
}

# may need to increase the number of available inodes in tmpfs for the following to work
# use the following:
# 	mount -o remount,nr_inodes=2000000 /tmp
shortlogmap=$(mktemp -d)
while IFS= read -r commit
do
	id=$(echo "$commit" | sed -nE "s/^([0-9a-f]{40}).*/\1/p")
	shortlog=$(echo "$commit" | sed -nE "s/^([0-9a-f]{40}) (.*)$/\2/p")
	shortlogsha=$(echo "$shortlog" | sha1sum | sed -nE "s/^([0-9a-f]{40}).*/\1/p")
	echo $id >> $shortlogmap/$shortlogsha
done < <(git log --pretty="%H %s")

tags=0
unambiguous=0
disambiguated=0
ambiguous=0

while IFS= read -r tag
do
	tags=$((tags+1))
	check_fixes_tag "$tag"
	result=$?
	if [ "$result" = 0 ]; then ((unambiguous++)) fi
	if [ "$result" = 1 ]; then ((disambiguated++)) fi
	if [ "$result" = 2 ]; then ((ambiguous++)) fi
done < <(git log | grep -E "^\s*Fixes: [0-9a-f]{12,}.*")

echo "Total: $tags"
echo "Unambiguous: $unambiguous"
echo "Disambiguated: $disambiguated"
echo "Ambiguous: $ambiguous"

