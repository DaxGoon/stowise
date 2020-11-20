#!/bin/bash
####### stowise: Doing stow wisely. ############
################################################

# 1. Ask for what directory to create for stow
echo "---------------------------------------\n"
echo "------------- PREPARATIONS ------------\n"
echo "---------------------------------------\n"

# Enable copying of dotfiles
shopt -s dotglob

# Prompt for directory name
echo "Enter a name for new Gnu Stow directory.\n"
read input

# 2. Create the directory
mkdir ~/"$input"

# 3. Create subdirectories based on the contents
# of the ~/.config directory
cd ~/.config
echo "Creating directories in '$input'"
for dir in */; do
  echo "creating $input/$dir/.config/$dir"
  mkdir -p ~/"$input/$dir/.config/$dir"
done

# 4. Move contents to the newly created directories
cd ~/.config
for dir in */; do
  echo "moving contents of $dir ..."
  cp -r ./$dir/* ~/$input/$dir/.config/$dir
done


# 5. Back up the existing contents of ~/.config
echo "---------------------------------------\n"
echo "---------- BACKUPS  & CLEANUPS --------\n"
echo "---------------------------------------\n"
echo "Enter the name for backup directory\n"
read input2
mkdir ~/$input2
echo "Created ~/$input2"
# backup
cd ~/.config
cp -r ./* ~/$input2
echo "Backed up files at ~/$input2"
# cleanup
rm -rf ./*

# 6. Activate the stow
echo "---------------------------------------\n"
echo "-------------- ACTIVATION -------------\n"
echo "---------------------------------------\n"
cd ~/$input
for dir in */; do
  stow $dir
done

echo "ALL DONE"
echo "Next steps: Backup your $input in git repository."
echo "Cheers!"

