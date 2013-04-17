#!/bin/sh
#
#
# generate tags
#
# Grantzhu97@gmail.com
#

if [ -f tags ]; then
echo "rm tags..."
rm tags
fi

if [ -f filenametags ]; then
echo "rm filenametags..."
rm filenametags
fi

if [ -f cscope.files ]; then
echo "rm cscope.files"
rm cscope.files
fi

if [ -f cscope.in.out ]; then
echo "rm cscope.in.out"
rm cscope.in.out
fi

if [ -f cscope.out ]; then
echo "rm cscope.out"
rm cscope.out
fi

if [ -f cscope.po.out ]; then
echo "rm cscope.po.out"
rm cscope.po.out
fi

#
#generate tags
#find . \( -path "./win" -o -path "./mac*" \) -prune -o \( -name "*.[ch]" -a -print \) | ctags -L –
#ctags -R --exclude=".git" --exclude' ".gitignore" --exclude=".repo" --exclude="kernel-imx" --exclude="./bootable/bootloader/uboot-imx/" --exclude="*.js"
#ctags -R --exclude=".repo" --exclude="kernel-imx" --exclude="./bootable/bootloader/uboot-imx/" --exclude="*.js"
echo "generating tags...."
#ctags -R . *
ctags --fields=+iaS --extra=+q -R

# generate filenametags
echo "generating filenametags...."
echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > filenametags
find . -not -regex '.*\.\(png\|gif\|so\)' -type f -printf "%f\t%p\t1\n" | \
    sort -f >> filenametags

# generate cscope files
echo "generating cscope..."
find . -type f -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.mk" -o -name "Makefile" -o -name "*.java" > cscope.files
cscope -bkq -i cscope.files

