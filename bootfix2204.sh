clear

function userPrompt() {
  read -r -p "Press [Enter] to continue "
}

function checkStatus() {
  [ $? -eq 0 ] && echo "${1}" || echo "${2}"

  userPrompt
}

# source https://ubuntu-mate.community/t/set-sis-graphics-1024x768-l-ubuntu-mate-14-04-and-16-04-16-10/3553
# not sure if this is a great idea but on my old desktop (the point of these scripts) this helps boot directly
# to a GUI where i dont have to do anything on bootup
function useVesa() {
  
  vesaFile="use-vesa.conf"
  # where to put the file - a dir/folder
  useVesaFinalDir="/usr/share/x11/xorg.conf.d/"

  echo -e "Adding file for VESA drivers"
  cat << EOF > ${vesaFile}
  Section "Device"
      Identifier "Configured Video Device"
      Driver "vesa"
  EndSection
  # is the tab level of the above correct?

  checkStatus "Vesa file successfully created" "Error creating Vesa file"

  # NOTE: the above code just creates a local file (so to speak), and the code below moves it to
  # where it needs to be ... this will help me check the file is correctly made

  ###################################################################################################
  #echo -e "Copying ${vesaFile} to proper location"
  #sudo cp ${vesaFile} ${useVesaFinalDir}

  #checkStatus "File Moved Successfully" "File Move Failed"
  userPrompt
}

#useVesa

#################################################################################

# To Add nomodeset
function addNoModeSet() {

  # grub configuration file
  defaultGrubFile="/etc/default/grub"

  # what to look for in the file above
  searchTerm="GRUB_CMDLINE_LINUX_DEFAULT"

  # make backup grub config file from the start
  echo -e "Making backup of default grub config file
  sudo cp ${defaultGrubFile} /etc/default/grub_backup

  checkStatus "Grub Default config file created" "Error creating grub default backup file"


  # original line that has to be modified
  ORIGINAL_LINE=$(grep -E "^${searchTerm}" ${defaultGrubFile})

  # Modified Line
  NEW_LINE=$(echo ${ORIGINAL_LINE} | sed 's/"/ nomodeset"/2')

  echo -e "Adding nomodeet to needed line"
  sed "s/${ORIGINAL_LINE}/${NEW_LINE}/" ${defaultGrubFile} > test.txt

  checkStatus "Test File created successfully" "Error Creating Test File"



}

addNoModeSet