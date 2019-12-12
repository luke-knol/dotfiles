BACKUP_FOLDER="$HOME/vim_backups"
TEMP_FOLDER="$BACKUP_FOLDER/tmp"
TODAY=`date +%Y-%m-%d`
FNAME="vim-backup-$TODAY.tgz"

mkdir -p "$BACKUP_FOLDER"
mkdir -p "$TEMP_FOLDER"

cp -r ~/.vim "$TEMP_FOLDER"
# cd "$TEMP_FOLDER/.vim" && find . -name ".git" -exec rm {} \;
# cd "$BACKUP_FOLDER"

cd "$TEMP_FOLDER"
tar cvzf "$BACKUP_FOLDER/$FNAME" .vim
rm -rf "$TEMP_FOLDER"

