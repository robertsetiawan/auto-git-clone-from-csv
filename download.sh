INPUT=data.csv
OLDIFS=$IFS
IFS=','

[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
while read name nim repo
do
    folderName="$nim"-"$name";
    if [ -d $folderName ]; then
        continue
    fi

    git clone $repo $folderName && echo "cloned"
done < $INPUT
IFS=$OLDIFS
