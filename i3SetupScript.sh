!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

####### Update system ########
sudo apt update
sudo apt upgrade


##### install i3-wm #####
sudo apt -y install i3-wm 

# used to set wallpaper
sudo apt -y install feh

#### install piecom #####

# install dependencies
sudo apt -y install libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfix>

# install build tools
sudo apt -y install meson ninja-build cmake python3-pip

print_header($header) {
  printf "\n\n${GREEN}==============================================${NC}\n"
  printf "${RED} $1 ${NC}"
  printf "\n\n${GREEN}==============================================${NC}\n"

}

# fetch picom from github
clone_picom () {
  print_header "Cloning Picom"
  if cd /tmp/picom
  then
   printf "\n\n${RED} Picom git reposetory already cloned. Continuing...${NC}\n\n"
  else
    git clone https://github.com/yshui/picom.git /tmp/picom
  fi
}
clone_picom

# install picom
install_picom (){
  print_header "Installing Picom"
  sudo meson --buildtype=release . build
  sudo ninja -C build
  sudo ninja -C build install

}

install_picom
# copy sample config to .config folder
print_header "Copying Picom config file to ~/.config/picom.conf"
cp /tmp/picom/picom.sample.conf ~/.config/picom.conf

clone_pywal() {
  print_header "Cloning Pywal"
  if cd /tmp/pywal
  then
    printf "\n\n${RED} Pywall git reposetory already cloned. Continueing..${NC}"
  else 
    git clone https://github.com/dylanaraps/pywal /tmp/pywal
  fi
}

clone_pywal

install_pywall() {
  print_header "Installing pywall"
  pip3 install /tmp/pywal/ 

}

install_pywall

install_ranger() {
  print_header "Installing Ranger"
        sudo apt -y install ranger caca-utils highlight atool w3m poppler->
        ranger --copy-config=all
}

install_ranger

sudo apt -y install rofi