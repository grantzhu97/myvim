#!/bin/sh
#
# generate tags
#
# Grantzhu97@gmail.com
#


if [ -f filenametags ]; then
echo "rm filenametags..."
rm filenametags
fi

# generate filenametags
echo "generating filenametags...."
echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > filenametags
find . -not -regex '.*\.\(png\|gif\|so\)' -type f -printf "%f\t%p\t1\n" | \
    sort -f >> filenametags

