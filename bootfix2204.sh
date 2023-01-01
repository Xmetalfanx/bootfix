clear

vesaFile="use-vesa.conf"
# where to put the file - a dir/folder
useVesaFinalDir="/usr/share/x11/xorg.conf.d/"

function userPrompt() {
  read -r -p "Press [Enter] to continue "
}

# # source https://ubuntu-mate.community/t/set-sis-graphics-1024x768-l-ubuntu-mate-14-04-and-16-04-16-10/3553
# function useVesa() {

#     cat << EOF > ${vesaFile}
#     Section "Device"
#         Identifier "Configured Video Device"
#         Driver "vesa"
#     EndSection

#     echo -e "Copying ${vesaFile} to proper location"
#     sudo cp ${vesaFile} ${useVesaFinalDir}

#     [ $? -eq 0 ] && echo "File Moved Successfully" ||  echo "File Move Failed"
#     userPrompt
# }

#useVesa


# a file 
defaultGrubFile="/etc/default/grub"
# what to look for in the file above
searchTerm="GRUB_CMDLINE_LINUX_DEFAULT"

function addNoModeSet() {

  ORIGINAL_LINE=$(grep "${searchTerm}" ${defaultGrubFile})

  #echo -e "original line:\t ${ORIGINAL_LINE}\v"

  NEW_LINE=$(echo ${ORIGINAL_LINE} | sed 's/"/ nomodeset"/2')

  #echo -e "New Line: ${NEW_LINE}"

  # -r: regex extended 
  sed "s/${ORIGINAL_LINE}/${NEW_LINE}/" ${defaultGrubFile} > foo.bar
} 
addNoModeSet