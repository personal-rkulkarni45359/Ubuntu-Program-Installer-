#!/bin/bash
##########################################################################################
#				            	Make.sh
#			       	       Ryan Kulkarni
#										      
#			                     Linux - Ubuntu 20.00 
##########################################################################################

##########################################################################################
#Program Description
# This is a bash script that will download apps and change confugurations for the ubuntu 
# enviroment. It uses the standard apt and dpkg downloaders as well as some custom programs 
#
#   The following is the basic structure for a command. It will folow the make program used 
#   in linux enviroment. The program name will be called following one of the options. 
#   target - This is the dedfault. It will uninstall and resinstall the program 
#	Central Repository Protypes - scripts that will be called to get things from apt central
#	Custom Repository Protypes - scripts that will be called to get things from outside repositories
#	Manual Script Protypes - scripts that will be called that were self generated
#	Function Protypes - Delegator functions the prototypes
#	Main Executables - Reads user inputs and then determines where to send the input.
#
#Post condition:
#	Executes the script otherwise will throw an error to standard input in
#To Add agram
#	1. create the program name and descriptionin variable section
#	2. create the prototype in correct area
#	3. create the delagator function
#	4. Add to main executable
#	5. Add to display function
#########################################################################################
PROGRAM_NAME='Make'
USER_NAME='r4770'

############################################################################
# 			GLOBAL CONSTANT DECLARATION
#########################################################################################

#----------------------------------------BASE CONSTANTS--------------------------------------------
readonly SLASH='/'
readonly  ALL='*'
readonly  UNDERSCORE='_'

readonly  STARS='********************************************************************************************************************************************'
readonly DDASH='============================================================================================================================================'
readonly  SDASH='--------------------------------------------------------------------------------------------------------------------------------------------'

readonly  JAR='jar'
readonly  DEB_EXT='.deb'
readonly  SH_EXT=".sh"
readonly  BKUP_EXT='.bkup'
readonly  JAR_EXT='.jar'
readonly  TAR_GZ=".tar.gz"
readonly  TAR_XZ=".tar.xz"
readonly  LOG_EXT=".log"
readonly ZIP_EXT=".zip"
readonly  NULL='null'
readonly TAR_EXT='.tar'
#Multi Install program names
readonly MAKE='make'
readonly TARGET='target'
readonly BUILD='build'
readonly INSTALL='install'
readonly DOWNLOAD='download'
readonly CLEAN="clean"
readonly INFO='info'
readonly ADMIN='admin'
readonly REMOVE='remove'
readonly MINIMIZE='minimize'
readonly FALSE='false'
readonly TRUE='true'
readonly ZOOM='zoom'
readonly SCALED='scaled'
readonly ILE='file'
readonly EPOCH_TIME=${EPOCHSECONDS}
readonly ECHO='echo'
readonly CAT='cat'
readonly TOUCH='touch'
readonly LOG='log'
readonly SUDO='sudo'
readonly RUN='run'

#tar options
declare -r TAR_REDIRECT='tar -C'
declare -r TAR_EXTRACT='-xvf'

#declare -r TAR_STRIP_1='--strip 1'
declare -r TAR_STRIP_2='--strip 2'

#declare -r UNZIP_REDIRECT="unzip -d"

declare -r  PARAM_ARRAY='$@'
declare -r  JAR_CMD='java -jar '
declare -r  WGET_URL="wget -O "



readonly CHMOD='chmod'
readonly CHOWN='chown'
declare -r  CHMOD_RUNNABLE="${SUDO} ${CHMOD} +x "
declare -r CHMOD_NONRUNNABLE="${SUDO} ${CHMOD} -x "
declare -r CHMOD_READONLY="${SUDO} ${CHMOD} -w "
declare -r CHOWN_USER="${SUDO} ${CHOWN} -R "

declare   WRITE_FILE='sh -c '
declare -r FORCE_WRITE_FILE="${SUDO} sh -c "
declare -r  CREATE_FILE_FLAG='>'
declare -r  APPEND_FILE_FLAG='>>'

readonly APT='apt'
readonly APT_GET="${APT}-get"
readonly APT_ADD="${SUDO} add-apt-repository "
readonly APT_INSTALL="${SUDO} ${APT} ${INSTALL} -y"
readonly APT_GET_INSTALL="${SUDO} $APT_GET $INSTALL -y"

DPKG='dpkg'
DPKG_INSTALL="${SUDO} ${DPKG} -i "
#DPKG_FIX="${SUDO} ${DPKG} --configure -a"

APT_UPDATE="${SUDO} $APT update"
APT_UPGRADE="${SUDO} $APT upgrade "
APT_PURGE="${SUDO} $APT purge -y"
APT_GET_REMOVE="${SUDO} $APT_GET remove -y"
APT_AUTOCLEAN="${SUDO} $APT autoclean -y"
APT_AUTOREMOVE="${SUDO} $APT autoremove -y "

GIT_CLONE="git clone "

SYMBOLIC_LINK="${SUDO} ln -s "

SNAP='snap'
SNAP_INSTALL="${SUDO} ${SNAP} $INSTALL "
SNAP_REMOVE="${SUDO} ${SNAP} $REMOVE "

CLASSIC_FLAG="--classic"
WGET_DIRECT_FLAG='-C'


MK_DIR="mkdir "
FORCE_MKDIR="${SUDO} ${MK_DIR} "
RM_DIR="rm -rf "
FORCE_RM="${SUDO} ${RM_DIR} "
CP='cp -rf'
FORCE_CP="${SUDO} ${CP} "
MV='mv -f'
FORCE_MV="${SUDO} ${MV} "

GDRIVE_MOUNT="google-drive-ocamlfuse mount "
GDRIVE_UNMOUNT="fusermount -u "
BASH_HEADING='#!/bin/bash'
HEADLESS='&>/dev/null &'


ANT_COMPILE_NAME='ant_compile.xml'
ANT_JAR_NAME='ant_jar.xml'
ANT_BUILD="ant -buildfile "

#---------------------------------------------Directoires--------------------------------------------
#Base Directories

declare readyonly USR='usr'
declare readonly LOCAL='local'
declare readonly BIN='bin'
declare readonly LIB='lib'
declare readonly SHARE='share'
USR_DIR="${SLASH}usr${SLASH}"
LOCAL_DIR="${USR_DIR}local${SLASH}"
BIN_DIR="${LOCAL_DIR}bin${SLASH}"
LIB_DIR="${LOCAL_DIR}lib${SLASH}"
SHARE_DIR="${USR_DIR}share${SLASH}"
BACKGROUND_DIR="${SHARE_DIR}backgrounds${SLASH}"

HOME_DIR="${SLASH}home${SLASH}"
LOGIN_DIR="${HOME_DIR}${USER_NAME}${SLASH}"

THEM_OLD_DIR="${HOME}theme/"
THEME_DIR="${LOGIN_DIR}.local/share/themes/"
ICON_DIR="${LOGIN_DIR}.local/share/icons/"
DEV_DIR="${LOGIN_DIR}dev${SLASH}"
BASH_DIR="${DEV_DIR}bash${SLASH}"
DEV_JAVA_DIR="${DEV_DIR}java${SLASH}eclipsejprojects${SLASH}"
GDRIVE_DIR=${LOGIN_DIR}${GDRIVE}${SLASH}
JAR_DIR="${DEV_DIR}${JAVA}${SLASH}${JAR}${SLASH}"
SHARE_DIR="



#-------------------------------------------Program Names---------------------------------------------
#Individual Program InstallMEDIA_DL_DIR
readonly THEME="theme"
readonly LIBREOFFICE="libreoffice"
readonly ECLIPSE="eclipse"
readonly MEDIA_DL="media-dl"
readonly ICONS="icons"
readonly CHROME="chrome"
readonly FIREFOX='firefox'
readonly JAVA="java"
readonly ANT="ant"
readonly CMAKE="cmake"
readonly CPULIMIT="cpulimit"
readonly FFMPEG="ffmpeg"
readonly GIMP="gimp"
readonly HTOP="htop"
readonly LAME="lame"
readonly MAVEN="maven"
readonly SNAP="snap"
readonly SENSORS='sensors'
readonly TEMPERATURE='temperature'
readonly VIM="vim"
readonly VLC="vlc"
readonly SKYPE='skype'
readonly YUM='yum'
readonly VIRTUALBOX="virtualbox"
readonly KAZAM='kazam'
readonly AVCONV='avconv'
readonly GIT='git'
readonly GDRIVE='gdrive'
readonly SCREENSAVER="screensaver"
readonly BACKGROUND="background"
readonly ICON="icon"
readonly CODE='code'
readonly PYTHON='python'
readonly SHELLCHECK='shellcheck'
readonly THUNDERBIRD='thunderbird'
readonly TWEAKS='tweaks'
readonly SCRCPY='scrcpy'
readonly CHEESE='cheese'

readonly VIDEO='video'
readonly GNOME='gnome'
readonly BOOKMARKS='bookmarks'
readonly NOMACS='nomacs'

#custom programs
readonly VIEWER='viewer'
readonly BACKUP='backup'
readonly IMAGE_TOOLS='imagetools'
readonly AUDIO_COMPRESSOR='audiocompressor'


readonly LINUX_APPS='linux-apps'
readonly OS_APPS='os-apps'
readonly JAVA_APPS='java-apps'
readonly GUI_APPS='gui-apps'
readonly PACKAGE_APPS='package-apps'
readonly SYSTEM_APPS='system-apps'


RELASELOCKS='relaselocks'

BASH_CMD='bash_cmd'

EXEC_MAKE='exec_make'
EXEC_BUILD='exec_build'
EXEC_BASH='exec_bash'
BASH_CMD="$EXEC_BASH"
EXEC_LEGACY='exec_legacy'

    
declare  LEGACY_CMD_FLAG=false; 
declare  BASH_CMD_FLAG=false; 
declare  MAKE_CMD_FLAG=false; 
declare  BUILD_CMD_FLAG=false; 


program_type="${NULL}"
program_name="${NULL}"
build_name="${NULL}"

ret_val=''


 pt()
{
    echo "[BASH] $1"
}

er()
{
    echo "[ERROR]       ${1}"
    read 
}




#---------------------------------------------------------------------------------------------------
#Script Description- program<name>https://drive.google.com/drive/u/1/my-drive
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function error_entry()
{
      issued_cmd="$1"
      error_message="$2"
      DATE_TIME=$('date')

      echo "$DDASH"
      echo  "Error Occured at ${DATE_TIME}" >> $ERROR_LOG
      echo  "Command causing error:  $issued_cmd " >> $ERROR_LOG
      echo " Error message:  $error_message  "  >> $ERROR_LOG 
      echo "$DDASH"
      echo ''

 

}

#---------------------------------------------------------------------------------------------------
#Script Description- program<name>https://drive.google.com/drive/u/1/my-drive
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
exec_legacy() {
        echo "Legacy Command Executing" 
        cmd="$1 $2 $3"
        echo "${cmd}"
        ${cmd}
    
}

#-------------------------EXEC_MAKE--------------------------------------------------------------------------
#Script Description- program<name>https://drive.google.com/drive/u/1/my-drive
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
exec_bash() {
    cmd="$1 $2 $3"
    echo $SDASH
    pt "                                             Bash  Command Executing.... "
    pt "Command:"
    pt "           ${cmd}"
    pt " "

    if ${cmd}; then
       pt "${cmd} ----> SUCUESSFUL"
   else
        pt "${cmd} ----> ERROR"     
        echo ${cmd}" >> ${ERROR_LOG}"
     
    fi
    pt "                                           Bash Command Complete"
    echo $SDASH
    echo
    echo $DDASH

}


#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function exec_make()
{
    cmd="f_$1 $2 $3"
    echo $SDASH
    pt "                                             Bash  Command Executing.... "
    pt "Command:"
    pt "           ${cmd}"
    pt " "

    if ${cmd}; then
       pt "${cmd} ----> SUCUESSFUL"
   else
        pt "${cmd} ----> ERROR"     
        echo "'${cmd}' >> ${ERROR_LOG}"
     
    fi
    pt "                                           Bash Command Complete"
    echo $SDASH
    echo
    echo $DDASH
}


#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function exec_build ()
{
    echo $DDASH
    pt "                           Build Program Name:$program_name               "
    pt "                           Build Program Type $program_type"
    f_$1
    
    pt "                           Build program demmand completed "
    echo $DDASH
    echo
    echo
}
##############################################.################################################################
# 				           MAKE FUNCTIONS
##############################################################################################################

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------

function f_gdrive()
{
    
    GDRIVE_NAME="google-drive-ocamlfuse"
    GDRIVE_CONFIG_NAME='.gdfuse'
    GDRIVE_APT_REPO='ppa:alessandro-strada/ppa'
    GDRIVE_CONFIG_DIR="${LOGIN_DIR}${GDRIVE_CONFIG_NAME}"
    
    make_download() {
        ${BASH_CMD} "${APT_ADD} ${GDRIVE_APT_REPO}"
        ${BASH_CMD} "${APT_UPDATE}"
    }
    
    make_install() {
        ${BASH_CMD} "${APT_INSTALL} ${GDRIVE_NAME}"
        ${BASH_CMD} "${CHOWN_USER} ${USER_NAME}.${USER_NAME} ${GDRIVE_CONFIG_DIR}"
    }
    
    make_clean() {
        ${BASH_CMD} "${APT_GET_REMOVE} ${GDRIVE_NAME} ${PURGE_FLAG}"
        ${BASH_CMD} "${FORCE_RM} ${GDRIVE_CONFIG_DIR}"
        
    }
    make_build() {
        make_download
        make_install
    }
    make_target() {
        make_clean
        make_build
    }
    
    ${MAKE}_$program_type
}
#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------


function f_eclipse()
{
ECLIPSE_NAME='eclipse'
ECLIPSE_URL='https://archive.org/download/linuxresources/eclipse.tar.xz'
ECLIPSE_DIR=${LIB_DIR}${ECLIPSE_NAME}${SLASH}
ECLIPSE_TAR=${ECLIPSE_NAME}${TAR_GZ}
P2_NAME='.p2'
ECLIPSE_HIDDEN_NAME="${DOT}${ECLIPSE}"
P2_DIR="${LOGIN_DIR}${P2_NAME}${SLASH}"
ECLIPSE_HIDDEN_DIR="${LOGIN_DIR}${ECLIPSE_HIDDEN_NAME}${SLASH}"
BIN_EXEC=${BIN_DIR}${ECLIPSE_NAME}




 make_download() {
    
    ${BASH_CMD} "${FORCE_MKDIR} ${LIB_DIR}"
    ${BASH_CMD} "${SUDO} ${WGET_URL}${LIB_DIR}${ECLIPSE_TAR} ${ECLIPSE_URL}"
    ${BASH_CMD} "${SUDO} ${TAR_REDIRECT} ${LIB_DIR} ${TAR_EXTRACT} ${LIB_DIR}${ECLIPSE_TAR}"
    ${BASH_CMD} "${FORCE_RM}  ${LIB_DIR}${ECLIPSE_TAR}"
    
}

 make_install() {
    ${BASH_CMD} "${SYMBOLIC_LINK} ${ECLIPSE_DIR}${ECLIPSE} ${BIN_DIR}"
}

 make_clean() {
    
    ${BASH_CMD} "${FORCE_RM} ${ECLIPSE_DIR}"
    ${BASH_CMD} "${FORCE_RM} ${P2_DIR}"
    ${BASH_CMD} "${FORCE_RM}  ${ECLIPSE_HIDDEN_DIR}"
    ${BASH_CMD} "${FORCE_RM}  ${BIN_EXEC}"
    
}

 make_target() {
    
    make_clean
    make_download
    make_install
}

 make_build() {
    make_download
    make_install
}
    ${MAKE}_$program_type


}
#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function f_media-dl()
{
    MEDIA_DL_URL='https://yt-dl.org/downloads/latest/youtube-dl'
MEDIA_DL_DIR=${LIB_DIR}${MEDIA_DL}${SLASH}


 make_clean() {
    
    ${BASH_CMD} "${FORCE_RM} ${BIN_DIR}${MEDIA_DL}"
    ${BASH_CMD} "${FORCE_RM} ${MEDIA_DL_DIR}"
    
}

 make_download() {
    ${FORCE_MKDIR} ${MEDIA_DL_DIR}
    ${BASH_CMD} "${SUDO} ${WGET_URL}${MEDIA_DL_DIR}${MEDIA_DL}${SH_EXT} ${MEDIA_DL_URL}"
    ${BASH_CMD} "${CHMOD_RUNNABLE} ${MEDIA_DL_DIR}${MEDIA_DL}${SH_EXT}"
    
}
 make_install() {
    
    ${BASH_CMD} "${FORCE_CP} ${MEDIA_DL_DIR}${MEDIA_DL}${SH_EXT} ${BIN_DIR}${MEDIA_DL}"
}

 make_build() {
    
    make_download
    make_install
}

 make_target() {
    
    make_clean
    make_build
}

    ${MAKE}_$program_type

}
#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#------------------------sys_purgeDir--------------------------------------------------------------------------
function f_skype()
{
SKYPE_URL='https://go.skype.com/skypeforlinux-64.deb'
SKYPE_NAME="skypeforlinux"
SKYPE_FILE="${SKYPE_NAME}${DEB_EXT}"
SKYPE_DIR=${LIB_DIR}${SKYPE}${SLASH}
 


 make_download() {
    
    ${BASH_CMD} "${FORCE_MKDIR} ${SKYPE_DIR}"
    ${BASH_CMD} "${SUDO} ${WGET_URL} ${SKYPE_DIR}${SKYPE_FILE} ${SKYPE_URL}"
}

 make_install() {
    
    ${BASH_CMD} "${DPKG_INSTALL} ${SKYPE_DIR}${SKYPE_FILE}"
}
 make_clean() {
    ${BASH_CMD} "${APT_PURGE} ${SKYPE_APT}"
    ${BASH_CMD} " ${FORCE_RM} ${SKYPE_DIR}"
    
}


 make_build() {
    
    make_download
    make_install
}
 make_target() {
    
    make_clean
    make_build
}
   ${MAKE}_$program_type

}

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function f_libreoffice()
{
LIBREOFFICE_NAME="libreoffice6.4"
LIBREOFFICE_URL='https://archive.org/download/linuxresources/libreoffice.tar.xz'
LIBREOFFICE_TAR="${LIBREOFFICE_NAME}${TAR_GZ}"
LIBREOFFICE_DIR="${LIB_DIR}${LIBREOFFICE_NAME}${SLASH}"
LIBREOFFICE_LIBRARY='libobasis6.4'


 make_download() {
    
    ${FORCE_MKDIR} "${LIBREOFFICE_DIR}"
    ${BASH_CMD} "${SUDO} ${WGET_URL} ${LIBREOFFICE_DIR}${LIBREOFFICE_TAR} ${LIBREOFFICE_URL}"
    ${BASH_CMD} "${SUDO} ${TAR_REDIRECT} ${LIBREOFFICE_DIR} ${TAR_EXTRACT} ${LIBREOFFICE_DIR}${LIBREOFFICE_TAR} ${TAR_STRIP_2}"
    ${BASH_CMD} "${FORCE_RM} ${LIBREOFFICE_DIR}${LIBREOFFICE_TAR}"
}

 make_install() {
    ${BASH_CMD} "${FORCE_RM} ${BIN_DIR}${LIBREOFFICE_NAME}"
    ${BASH_CMD} "${DPKG_INSTALL} ${LIBREOFFICE_DIR}${ALL}${DOT}${DEB_EXT}"
    
}
 make_clean() {
    ${BASH_CMD} "${FORCE_RM} ${LIBREOFFICE_DIR}"
    ${BASH_CMD} "${FORCE_RM} ${BIN_DIR}${LIBREOFFICE_NAME}"
    ${BASH_CMD} "${APT_PURGE} ${LIBREOFFICE_LIBRARY}"
}

 make_build() {
    make_download
    make_install
}

make_target() {
    make_clean
    make_build
}

${MAKE}_$program_type
}

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
#Variables for wallpaper change
function f_background()
{
BACKGROUND_URL='https://live.staticflickr.com/65535/49400376363_b8ef265017_b.jpg'
SET_BACKGROUND_CMD='gsettings set org.gnome.desktop.background picture-uri file://'
BACKGROUND_SCALE_OPTION='gsettings set org.gnome.desktop.background picture-options '
BACKGROUND_TRASH_ICON='gsettings set org.gnome.shell.extensions.desktop-icons show-trash '
BACKGROUND_HOME_ICON='gsettings set org.gnome.shell.extensions.desktop-icons show-home '
BACKGROUND_NAME="background.jpg"
BACKGROUND_PATH=${BACKGROUND_DIR}${BACKGROUND_NAME}




 make_download() 
 {
    ${BASH_CMD} "${SUDO} ${WGET_URL}${BACKGROUND_PATH} ${BACKGROUND_URL}"
    
}

 make_install() {
    ${BASH_CMD} "${SET_BACKGROUND_CMD}${BACKGROUND_PATH}"
    ${BASH_CMD} "${BACKGROUND_SCALE_OPTION} ${ZOOM}"
    ${BASH_CMD} "${BACKGROUND_TRASH_ICON} ${FALSE}"
    ${BASH_CMD} "${BACKGROUND_HOME_ICON} ${FALSE}"
    
}

 make_clean() {
    ${BASH_CMD} "${FORCE_RM} ${BACKGROUND_DIR}${BACKGROUND_NAME}"
    ${BASH_CMD} "${SUDO} ${SET_BACKGROUND_CMD}"
}


 make_build() {
    make_download
    make_install
}

 make_target() {
    
    make_clean
    make_build
}

   ${MAKE}_$program_type
}
#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function f_screensaver()
{
SCREENSAVER_URL='https://live.staticflickr.com/65535/49400376398_3abe8cb29a_b.jpg'
SET_SCREENSAVER_CMD="gsettings set org.gnome.desktop.screensaver picture-uri file://"
SCREENSAVER_SCALE_OPTION='gsettings set org.gnome.desktop.screensaver picture-options "zoom" '
SCREENSAVER_NAME='screensaver.jpg'
SCREENSAVER_PATH=${BACKGROUND_DIR}${SCREENSAVER_NAME}

 make_download() {
    ${BASH_CMD} "${SUDO} ${WGET_URL} ${SCREENSAVER_PATH} ${SCREENSAVER_URL}"
}
 make_install() {
    ${BASH_CMD} "${SET_SCREENSAVER_CMD}${SCREENSAVER_PATH}"
    ${BASH_CMD} "${SCREENSAVER_SCALE_OPTION} ${ZOOM}"
}
 make_clean() {
    
    ${BASH_CMD} "${FORCE_RM} ${SCREENSAVER_PATH}"
    ${BASH_CMD} "${SUDO} ${SET_SCREENSAVER_CMD}"
    
}
 make_build() {
    
    make_download
    make_install
}
 make_target() {
    
    make_clean
    make_build
}


   ${MAKE}_$program_type
}

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function f_loginscreen()
{
LOGINSCREEN='loginscreen'
LOGINSCREEN_URL='https://live.staticflickr.com/65535/49400376383_dd3f35cec8_b.jpg'
LOGINSCREEN_BASE_PATH="/usr/share/gnome-shell/theme/gnome-shell.css"
LOGINSCREEN_BASE_PATH_BKUP="/usr/share/gnome-shell/theme/gnome-shell-bkup.css"
LOGINSCREEN_YARU_PATH="/usr/share/gnome-shell/theme/Yaru/gnome-shell.css"
LOGINSCREEN_YARU_PATH_BKUP="/usr/share/gnome-shell/theme/Yaru/gnome-shell-bkup.css"
LOGIN_NAME="loginscreen.jpg"
LOGINSCREEN_TEXT="#lockDialogGroup {
    background: #2c001e url(file:///usr/share/backgrounds/loginscreen.jpg);
    background-repeat: no-repeat;
    background-size: zoom;
background-position: zoom; }"

 make_download(){
    ${BASH_CMD} "${SUDO} ${MK_DIR} ${BACKGROUND_DIR}"
    ${BASH_CMD} "${SUDO} ${WGET_URL} ${BACKGROUND_DIR}${LOGIN_NAME} ${LOGINSCREEN_URL}"
    
}

 make_install() {
    
    ${BASH_CMD} "${FORCE_CP} ${LOGINSCREEN_BASE_PATH} ${LOGINSCREEN_BASE_PATH_BKUP}"
    ${BASH_CMD} "${FORCE_CP} ${LOGINSCREEN_YARU_PATH} ${LOGINSCREEN_YARU_PATH_BKUP}"
    
    pt "Modifying ${LOGINSCREEN_BASE_PATH}"
    ${FORCE_WRITE_FILE} "$ECHO '$LOGINSCREEN_TEXT' $APPEND_FILE_FLAG ${LOGINSCREEN_BASE_PATH}"
    pt "Modifying ${LOGINSCREEN_YARU_PATH}"
    ${FORCE_WRITE_FILE} "$ECHO '$LOGINSCREEN_TEXT' $APPEND_FILE_FLAG ${LOGINSCREEN_YARU_PATH}"
}

 make_clean() {
    
    #Remove image file
    ${BASH_CMD} "${FORCE_RM} ${BACKGROUND_DIR}${LOGIN_NAME}"
    
    #check to see if its been created yet.
    if test -f "${LOGINSCREEN_BASE_PATH_BKUP}"; then
        ${BASH_CMD} "${FORCE_RM} ${LOGINSCREEN_BASE_PATH}"
        ${BASH_CMD} "${FORCE_MV} ${LOGINSCREEN_BASE_PATH_BKUP} ${LOGINSCREEN_BASE_PATH}"
        
    fi
    
    if test -f "${LOGINSCREEN_YARU_PATH_BKUP}"; then
        ${BASH_CMD} "${FORCE_RM} ${LOGINSCREEN_YARU_PATH}"
        ${BASH_CMD} "${FORCE_MV} ${LOGINSCREEN_YARU_PATH_BKUP} ${LOGINSCREEN_YARU_PATH}"
        
    fi
    
}


 make_build() {
    make_download
    make_install
    
}
 make_target() {
    
    make_clean
    make_build
    
}
   ${MAKE}_$program_type

}


#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------

function f_shelltheme
{
    THEME='theme'
    THEME_URL='https://archive.org/download/linuxresources/themes.tar.xz'    
    THEME_DIR="${LOGIN_DIR}${SLASH}${DOT}${LOCAL}/share/${THEMES}/"
    THEME_NAME='Dark_Mode'
    THEME_TAR=${THEME_NAME}${TAR_XZ}





 make_download() {
    
    ${BASH_CMD} "${FORCE_MKDIR} ${LIB_DIR}"
    ${BASH_CMD} "${SUDO} ${WGET_URL} ${THEME_DIR} ${THEME_URL}"
    ${BASH_CMD} "${SUDO} ${TAR_REDIRECT} ${THEME_DIR} ${TAR_EXTRACT} ${LIB_DIR}${THEME_TAR}"
  #  ${BASH_CMD} "${FORCE_RM}  ${THEME}${ECLIPSE_TAR}"
    
}

 make_install() {
    ${BASH_CMD} "${SYMBOLIC_LINK} ${ECLIPSE_DIR}${ECLIPSE} ${BIN_DIR}"
}

 make_clean() {
    
     SUDO $FORCE_RM
    
}

 make_target() {
    
    make_clean
    make_download
    make_install
}

 make_build() {
    make_download
    make_install
}
    ${MAKE}_$program_type


  
}
#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function f_theme()
{
    THEME_GIT_URL='https://github.com/rtlewis88/rtl88-Themes.git'
    SET_THEME_CMD='gsettings set org.gnome.desktop.interface icon-theme '
    RESET_THEME_CMD='gsettings reset org.gnome.desktop.interface icon-theme'

    THEME_NAME='Material-Black-Blueberry'

    make_download() 
    {
        ${BASH_CMD} "${MK_DIR} ${THEME_DIR}"
        ${BASH_CMD} "${GIT_CLONE} ${THEME_GIT_URL} ${THEME_DIR}"
    }
    make_install() 
    {
        ${BASH_CMD} "${SET_ICON_CMD} ${ICON_NAME}"

    }
    make_clean() 
    {
        ${BASH_CMD} "${FORCE_RM}${THEME_DIR}"
        ${BASH_CMD} "$RESET_THEME_CMD"
    }
    make_build() 
    {
        make_download
        make_install
    }
    
    make_target() 
    {
        make_clean
        make_build
    }

   ${MAKE}_$program_type
    
}

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function f_icons()
{
    ICON_GIT_URL='https://github.com/bikass/korla'
    SET_ICON_CMD='gsettings set org.gnome.desktop.interface icon-theme '
    RESET_ICON_CMD='gsettings reset org.gnome.desktop.interface icon-theme '
    ICON_NAME='korla'

    make_download() 
    {
        ${BASH_CMD} "${MK_DIR} ${ICON_DIR}"
        ${BASH_CMD} "${GIT_CLONE} ${ICON_GIT_URL} ${ICON_DIR}"
        ${BASH_CMD} "${RM} ${ICON_DIR}${TAR_NAME}"
    }
    make_install() 
    {
        ${BASH_CMD} "${SET_ICON_CMD} ${ICON_NAME}"

    }
    make_clean() 
    {
        ${RESET_ICON_CMD}
        ${BASH_CMD} "${FORCE_RM}${ICON_DIR}"
    }
    make_build() 
    {
        make_download
        make_install
    }
    
    make_target() 
    {
        make_clean
        make_build
    }

   ${MAKE}_$program_type
    
}
#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Not
#	<info>
#-----------------------------------------
function f_chrome()
{

CHROME_URL='https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
CHROME_DIR=${LIB_DIR}${CHROME}
CHROME_PATH=${CHROME_DIR}${SLASH}${CHROME}
CHROME_NAME="google-chrome-stable"

function make_download() 
{
    
    ${BASH_CMD} "${FORCE_MKDIR} ${CHROME_DIR}"
    ${BASH_CMD} "${SUDO} ${WGET_URL} ${CHROME_PATH} ${CHROME_URL}"
}

 make_install() {
    ${BASH_CMD} "${DPKG_INSTALL} ${CHROME_PATH}"
}
 make_clean() {
    
    ${BASH_CMD} "${FORCE_RM} ${CHROME_DIR}"
    ${BASH_CMD} "${APT_PURGE} ${CHROME_NAME}"
}
 make_build() {
    
    make_download
    make_install
    
}
 make_target() {
    
    make_clean
    make_build
    
}
${MAKE}_$program_type

}
#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function f_java()
{

JAVA_APP_REPO='sudo add-apt-repository ppa:linuxuprising/java'
JAVA_INSTALLER='sudo apt install oracle-java13-installer'
JAVA_CONFIGURATION='sudo apt install oracle-java13-set-default'
JAVA_SECURITY_OVERRIDE='echo oracle-java13-installer shared/accepted-oracle-licence-v1-2 boolean true | sudo /usr/bin/debconf-set-selections'

mabkupSteg_031619_23550.jpgke_clean() {
    ${BASH_CMD} "${FORCE_RM} ${JAVA_DIR}"
    ${BASH_CMD} "${APT_PURGE}  ${JAVA_NAME}"
}


make_download() {
    
    ${JAVA_APP_REPO}
    ${APT_UPDATE}
}

make_install() {
    ${BASH_CMD} "${JAVA_SECURITY_OVERRIDE}"
    ${BASH_CMD} "${JAVA_INSTALLER}"
    ${BASH_CMD} "${JAVA_CONFIGURATION}"
}

make_build() {
    make_download 
    make_install
}

make_target() {
    make_clean
    make_build
}
${MAKE}_$program_type
}
#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------

function f_viewer()
{
VIEWER_ANT_DIR=${DEV_JAVA_DIR}${VIEWER}${SLASH}
VIEWER_SRJAR_LOC=${JAR_DIR}${VIEWER}${JAR_EXT}
VIEWER_PROGRAM_LOC=${LIB_DIR}${VIEWER}${SLASH}${VIEWER}${SH_EXT}
VIEWER_JAR_FILE=${LIB_DIR}${VIEWER}${SLASH}${VIEWER}${JAR_EXT}
VIEWER_BIN_LOC=${BIN_DIR}${VIEWER}
VIEWER_LIB_DIR=${LIB_DIR}${VIEWER}${SLASH}

 make_download() {
    
    ${BASH_CMD} "${FORCE_MKDIR} ${VIEWER_LIB_DIR}"
    ${BASH_CMD} "${SUDO} ${ANT_BUILD} ${VIEWER_ANT_DIR}${ANT_COMPILE_NAME}"
    ${BASH_CMD} "${SUDO} ${ANT_BUILD} ${VIEWER_ANT_DIR}${ANT_JAR_NAME}"
    ${BASH_CMD} "${FORCE_CP} ${VIEWER_SRJAR_LOC} ${VIEWER_LIB_DIR}"
    
    ${FORCE_WRITE_FILE} "${ECHO} ${BASH_HEADING} ${CREATE_FILE_FLAG} ${VIEWER_PROGRAM_LOC}"
    line="${JAR_CMD} ${VIEWER_JAR_FILE} ${PARAM_ARRAY}"
    ${FORCE_WRITE_FILE} "${ECHO} '${line}' ${APPEND_FILE_FLAG} ${VIEWER_PROGRAM_LOC}"
    ${BASH_CMD} "${CHMOD_RUNNABLE} ${VIEWER_PROGRAM_LOC}"
    
}

 make_install() {
    ${BASH_CMD} "${SYMBOLIC_LINK} ${VIEWER_PROGRAM_LOC} ${VIEWER_BIN_LOC}"
}
 make_clean() {
    ${BASH_CMD} "${FORCE_RM} ${VIEWER_BIN_LOC}"
    ${BASH_CMD} "${FORCE_RM} ${VIEWER_LIB_DIR}"
}


make_build()
{
    make_download
    make_install

}
 make_target() {
    make_clean
    make_build

}

${MAKE}_$program_type

}

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
BACKUP_ANT_DIR=${DEV_JAVA_DIR}${BACKUP}${SLASH}
BACKUP_SRJAR_LOC=${JAR_DIR}${BACKUP}${JAR_EXT}
BACKUP_PROGRAM_LOC=${LIB_DIR}${BACKUP}${SLASH}${BACKUP}${SH_EXT}
BACKUP_JAR_FILE=${LIB_DIR}${BACKUP}${SLASH}${BACKUP}${JAR_EXT}
BACKUP_BIN_LOC=${BIN_DIR}${BACKUP}
BACKUP_LIB_DIR=${LIB_DIR}${BACKUP}${SLASH}

function f_backup()
{


 make_download() {
    
    ${BASH_CMD} "${FORCE_MKDIR} ${BACKUP_LIB_DIR}"
    ${BASH_CMD} "${SUDO} ${ANT_BUILD} ${BACKUP_ANT_DIR}${ANT_COMPILE_NAME}"
    ${BASH_CMD} "${SUDO} ${ANT_BUILD} ${BACKUP_ANT_DIR}${ANT_JAR_NAME}"
    ${BASH_CMD} "${FORCE_CP} ${BACKUP_SRJAR_LOC} ${BACKUP_LIB_DIR}"
    
    ${FORCE_WRITE_FILE} "${ECHO} ${BASH_HEADING} ${CREATE_FILE_FLAG} ${BACKUP_PROGRAM_LOC}"
    line="${JAR_CMD} ${BACKUP_JAR_FILE} ${PARAM_ARRAY}"
    ${FORCE_WRITE_FILE} "${ECHO} '${line}' ${APPEND_FILE_FLAG} ${BACKUP_PROGRAM_LOC}"
    ${BASH_CMD} "${CHMOD_RUNNABLE} ${BACKUP_PROGRAM_LOC}"
    
}

 make_install() {
    ${BASH_CMD} "${SYMBOLIC_LINK} ${BACKUP_PROGRAM_LOC} ${BACKUP_BIN_LOC}"
}
 make_clean() {
    ${BASH_CMD} "${FORCE_RM} ${BACKUP_BIN_LOC}"
    ${BASH_CMD} "${FORCE_RM} ${BACKUP_LIB_DIR}"
}

 make_build() {
    make_download
    make_install
}
 make_target() {
    make_clean
    make_build
}

${MAKE}_$program_type

}
#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
IMAGETOOLS_ANT_DIR=${DEV_JAVA_DIR}${IMAGE_TOOLS}${SLASH}
IMAGETOOLS_SRJAR_LOC=${JAR_DIR}${IMAGE_TOOLS}${JAR_EXT}
IMAGETOOLS_PROGRAM_LOC=${LIB_DIR}${IMAGE_TOOLS}${SLASH}${IMAGE_TOOLS}${SH_EXT}
IMAGETOOLS_JAR_FILE=${LIB_DIR}${IMAGE_TOOLS}${SLASH}${IMAGE_TOOLS}${JAR_EXT}
IMAGETOOLS_BIN_LOC=${BIN_DIR}${IMAGE_TOOLS}
IMAGETOOLS_LIB_DIR=${LIB_DIR}${IMAGE_TOOLS}${SLASH}


function f_imagetools()
{

make_download() {
    
    ${BASH_CMD} "${FORCE_MKDIR} ${IMAGETOOLS_LIB_DIR}"
    ${BASH_CMD} "${SUDO} ${ANT_BUILD} ${IMAGETOOLS_ANT_DIR}${ANT_COMPILE_NAME}"
    ${BASH_CMD} "${SUDO} ${ANT_BUILD} ${IMAGETOOLS_ANT_DIR}${ANT_JAR_NAME}"
    ${BASH_CMD} "${FORCE_CP} ${IMAGETOOLS_SRJAR_LOC} ${IMAGETOOLS_LIB_DIR}"
    
    ${FORCE_WRITE_FILE} "${ECHO} '${BASH_HEADING}' ${CREATE_FILE_FLAG} ${IMAGETOOLS_PROGRAM_LOC}"
    line="${JAR_CMD} ${IMAGETOOLS_JAR_FILE} ${PARAM_ARRAY}"
    ${FORCE_WRITE_FILE} "${ECHO} '${line}' ${APPEND_FILE_FLAG} ${IMAGETOOLS_PROGRAM_LOC}"
    ${BASH_CMD} "${CHMOD_RUNNABLE} ${IMAGETOOLS_PROGRAM_LOC}"
    
}

 make_install() {
    ${BASH_CMD} "${SYMBOLIC_LINK} ${IMAGETOOLS_PROGRAM_LOC} ${IMAGETOOLS_BIN_LOC}"
}
make_clean() {
    ${BASH_CMD} "${FORCE_RM} ${IMAGETOOLS_BIN_LOC}"
    ${BASH_CMD} "${FORCE_RM} ${IMAGETOOLS_LIB_DIR}"
}

make_build() {
    make_download
    make_install
}
make_target() {
    make_clean
    make_build
}

${MAKE}_$program_type

}
#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------

function f_audiocompressor()
{

AUDIOCOMPRESSOR_ANT_DIR=${DEV_JAVA_DIR}${AUDIO_COMPRESSOR}${SLASH}
AUDIOCOMPRESSOR_SRJAR_LOC=${JAR_DIR}${AUDIO_COMPRESSOR}${JAR_EXT}
AUDIOCOMPRESSOR_PROGRAM_LOC=${LIB_DIR}${AUDIO_COMPRESSOR}${SLASH}${AUDIO_COMPRESSOR}${SH_EXT}
AUDIOCOMPRESSOR_JAR_FILE=${LIB_DIR}${AUDIO_COMPRESSOR}${SLASH}${AUDIO_COMPRESSOR}${JAR_EXT}
AUDIOCOMPRESSOR_BIN_LOC=${BIN_DIR}${AUDIO_COMPRESSOR}
AUDIOCOMPRESSOR_LIB_DIR=${LIB_DIR}${AUDIO_COMPRESSOR}${SLASH}


 make_download() {
    
    ${BASH_CMD} "${FORCE_MKDIR} ${AUDIOCOMPRESSOR_LIB_DIR}"
    ${BASH_CMD} "${SUDO} ${ANT_BUILD} ${AUDIOCOMPRESSOR_ANT_DIR}${ANT_COMPILE_NAME}"
    ${BASH_CMD} "${SUDO} ${ANT_BUILD} ${AUDIOCOMPRESSOR_ANT_DIR}${ANT_JAR_NAME}"
    ${BASH_CMD} "${FORCE_CP} ${AUDIOCOMPRESSOR_SRJAR_LOC} ${AUDIOCOMPRESSOR_LIB_DIR}"
    
    ${FORCE_WRITE_FILE} "${ECHO} '${BASH_HEADING}' ${CREATE_FILE_FLAG} ${AUDIOCOMPRESSOR_PROGRAM_LOC}"
    line="${JAR_CMD} ${AUDIOCOMPRESSOR_JAR_FILE} ${PARAM_ARRAY}"
    ${FORCE_WRITE_FILE} "${ECHO} '${line}' ${APPEND_FILE_FLAG} ${AUDIOCOMPRESSOR_PROGRAM_LOC}"
    ${BASH_CMD} "${CHMOD_RUNNABLE} ${AUDIOCOMPRESSOR_PROGRAM_LOC}"
    
}
make_install()
{
    ${BASH_CMD} "${SYMBOLIC_LINK} ${AUDIOCOMPRESSOR_PROGRAM_LOC} ${AUDIOCOMPRESSOR_BIN_LOC}"
}
 make_clean() {
    ${BASH_CMD} "${FORCE_RM} ${AUDIOCOMPRESSOR_BIN_LOC}"
    ${BASH_CMD} "${FORCE_RM} ${AUDIOCOMPRESSOR_LIB_DIR}"
}

 make_build() {
    make_download
    make_install
}
 make_target() {
    make_clean
    make_build
}

${MAKE}_$program_type
}

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function f_video()
{
    NAME='totem'
    DEPENDENT1='gstreamer1.0-plugins-ugly'
    make_build() {
        ${BASH_CMD} "${APT_INSTALL} ${NAME}"
        ${BASH_CMD} "${APT_INSTALL} ${DEPENDENT1}"

    }
    make_clean() {
        ${BASH_CMD} "${APT_PURGE} ${NAME}"
        ${BASH_CMD} "${APT_PURGE} ${DEPENDENT1}"

    }
    make_target() {
        make_clean
        make_build
    }
    ${MAKE}_$program_type
}

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
NAME='opera'
function f_opera()
{
    make_build() {
        ${BASH_CMD} "${SNAP_INSTALL} ${NAME}"
        ${BASH_CMD} "${SNAP_INSTALL} ${NAME}"

    }
    make_clean() {
        ${BASH_CMD} "${SNAP_REMOVE} ${NAME}"
    }
    make_target() {
        make_clean
        make_build
    }
    ${MAKE}_$program_type
}

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------

function f_code() {
    
    make_build() {
        ${BASH_CMD} "${SNAP_INSTALL} ${CODE}  ${CLASSIC_FLAG}"
        
    }
    make_clean() {
        ${BASH_CMD} "${SNAP_REMOVE} ${CODE}"
    }
    make_target() {
        make_clean
        make_build
    }
    ${MAKE}_$program_type
}

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function f_kazam()
{
    
    make_build() {
        ${BASH_CMD} "${APT_INSTALL} ${KAZAM}"
    }
    
    make_clean() {
        ${BASH_CMD} "${APT_PURGE} ${KAZAM}"
    }
    make_target() {
        make_clean
        make_build
    }
    ${MAKE}_$program_type
}
#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function f_ant()
{
    
    make_build() {
        ${BASH_CMD} "${APT_INSTALL} ${ANT}"
    }
    make_clean() {
        ${BASH_CMD} "${APT_PURGE} ${ANT}"
    }
    
    make_target() {
        make_clean
        make_build
    }
    ${MAKE}_$program_type
}

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------

function f_cmake()
{
    
    make_build() {
        ${BASH_CMD} "${APT_INSTALL} ${CMAKE}"
    }
    make_clean() {
        ${BASH_CMD} "${APT_PURGE} ${CMAKE}"
    }
    make_target() {
        make_clean
        make_build
    }
    ${MAKE}_$program_type
}


#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------

function f_gimp()
{
    
    NAME='gimp;
    make_build() {
        ${BASH_CMD} "${SNAP_INSTALL} ${NAME}"
    }
    make_clean() {
        ${BASH_CMD} "${SNAP_REMOVE} ${NAME}"
    }
    make_target() {
        make_clean
        make_build
    }
    ${MAKE}_$program_type
}
#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#-------------#--------------------------------------------------------------------------------------------------


function f_cmake-gui()
{
    CMAKE_NAME="cmake-qt-gui"
    

    make_build() {
        ${BASH_CMD} "${APT_INSTALL} ${CMAKE_NAME}"
        
    }
    make_clean() {
        ${BASH_CMD} "${APT_PURGE} ${CMAKE_NAME}"
    }

     make_target() {
        make_clean
        make_build
    }
    ${MAKE}_$program_type
}

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function f_cpulimit()
{
    
    make_build() {
        ${BASH_CMD} "${APT_INSTALL} ${CPULIMIT}"
    }
    
    make_clean() {
        ${BASH_CMD} "${APT_PURGE} ${CPULIMIT}"
    }
    make_target() {
        make_clean
        make_build
    }
    ${MAKE}_$program_type
}





#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------

function f_thunderbird()
{
    
    make_build() {
        
        ${BASH_CMD} "${APT_INSTALL} ${THUNDERBIRD}"
    }
    
    make_clean() {
        ${BASH_CMD} "${APT_PURGE} ${THUNDERBIRD}"
    }
    make_target() {
        make_clean
        make_build
    }
    
    ${MAKE}_$program_type
}


#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function f_lame()
{
    
    make_build() {
        ${BASH_CMD} "${APT_INSTALL} ${LAME}"
    }
    
    make_clean() {
        ${BASH_CMD} "${APT_PURGE} ${LAME}"
    }
    
    make_target() {
        make_clean
        make_build
    }
    ${MAKE}_$program_type
}
#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function f_bookmarks()
{
FILE_URL="file://"
BOOKMARK_CONFIG_LOC="${LOGIN_DIR}.config/gtk-3.0/bookmarks"
STEG_DIR="${LOGIN_DIR}.stegnography/"
BASH_DIR="${DEV_DIR}bash/"
TEMPLETE_DIR="${LOGIN_DIR}Templates/"
THEME_DIR="${LOGIN_DIR}.themes/"
ICON_DIR="${LOGIN_DIR}.icons/"
BACKGROUND_DIR="${USR_DIR}shared/backgrounds/"




make_build() {

    pt "Adding configured bookmarks....."
    ${WRITE_FILE} "${ECHO} '${FILE_URL}${DEV_DIR}' ${CREATE_FILE_FLAG} ${BOOKMARK_CONFIG_LOC}"
    ${WRITE_FILE} "${ECHO} '${FILE_URL}${USR_DIR}' ${APPEND_FILE_FLAG} ${BOOKMARK_CONFIG_LOC}"
    ${WRITE_FILE} "${ECHO} '${FILE_URL}${LOCAL_DIR}'${APPEND_FILE_FLAG} ${BOOKMARK_CONFIG_LOC}"
    ${WRITE_FILE} "${ECHO} '${FILE_URL}${LIB_DIR}'  ${APPEND_FILE_FLAG} ${BOOKMARK_CONFIG_LOC}"
    ${WRITE_FILE} "${ECHO} '${FILE_URL}${BIN_DIR}'  ${APPEND_FILE_FLAG} ${BOOKMARK_CONFIG_LOC}"
    ${WRITE_FILE} "${ECHO} '${FILE_URL}${STEG_DIR}' ${APPEND_FILE_FLAG} ${BOOKMARK_CONFIG_LOC}"
    ${WRITE_FILE} "${ECHO} '${FILE_URL}${BASH_DIR}' ${APPEND_FILE_FLAG} ${BOOKMARK_CONFIG_LOC}"
    ${WRITE_FILE} "${ECHO} '${FILE_URL}${TEMPLETE_DIR}' ${APPEND_FILE_FLAG} ${BOOKMARK_CONFIG_LOC}"
    ${WRITE_FILE} "${ECHO} '${FILE_URL}${THEME_DIR}' ${APPEND_FILE_FLAG} ${BOOKMARK_CONFIG_LOC}"
    ${WRITE_FILE} "${ECHO} '${FILE_URL}${ICON_DIR}' ${APPEND_FILE_FLAG} ${BOOKMARK_CONFIG_LOC}"
    ${WRITE_FILE} "${ECHO} '${FILE_URL}${BACKGROUND_DIR}' ${APPEND_FILE_FLAG} ${BOOKMARK_CONFIG_LOC}"

    
}
make_clean() {
    ${BASH_CMD} "${FORCE_RM} ${BOOKMARK_CONFIG_LOC}"
    
}

make_target() {
    make_clean
    make_build
    
}
${MAKE}_$program_type

}


#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>                                                                                                                                                                                                                                                                                       bbbbbbbbbbbn
#	<info>pe
#Notes
#	<info>+
#--------------------------------------------------------------------------------------------------
function avconv()
{
    make_build() {
        ${BASH_CMD} "${APT_INSTALL} ${AVCONV}"
    }
    make_clean() {
        ${BASH_CMD} "${APT_PURGE} ${AVCONV}"
    }
    make_target() {
        make_clean
        makd_build
    }
    ${MAKE}_$program_type
}


#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function f_ffmpeg()
{
    
    make_build()
    {
        ${BASH_CMD} "${APT_INSTALL} ${FFMPEG}"
    }
    
    make_clean()
    {
        ${BASH_CMD} "${APT_PURGE} ${FFMPEG}"
    }
    make_target()
    {
        make_clean
        make_build
    }
    ${MAKE}_$program_type
}

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------

function f_shellcheck()
{
    make_build() {
        
        ${BASH_CMD} "${SNAP_INSTALL} ${SHELLCHECK}"
    }
    
    make_clean_() {
        ${BASH_CMD} "${SNAP_REMOVE} ${SHELLCHECK}"
    }
    make_target() {
        make_clean
        make_build
    }
    ${MAKE}_$program_type
}

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------

function f_sensors()
{
    SENSORS_NAME='lm-sensors'

    make_build() {
        ${BASH_CMD} "${APT_INSTALL} ${SENSORS_NAME}"
    }
    
    make_clean() {
        ${BASH_CMD} "${APT_PURGE} ${SENSORS_NAME}"
    }
    make_target() {
        make_clean
        make_build
        
    }
    ${MAKE}_$program_type
    
}

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function f_lame()
{
    
    make_build() {
        ${BASH_CMD} "${APT_INSTALL} ${LAME}"
    }
    
    make_clean() {
        ${BASH_CMD} "${APT_PURGE} ${LAME}"
    }
    
    make_target() {
        make_clean
        make_build
    }
    ${MAKE}_$program_type
}

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------

function f_make()
{
    make_build() {
        ${BASH_CMD} "${APT_INSTALL} ${MAKE}"
    }
    
    make_clean() {
        ${BASH_CMD} "${APT_PURGE} ${MAKE}"
    }
    make_target() {
        make_clean
        make_build
    }
    ${MAKE}_$program_type
}

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------

function f_maven()
{
    make_build() {
        ${BASH_CMD} "${APT_INSTALL} ${MAVEN}"
        
    }
    make_clean() {
        ${BASH_CMD} "${APT_PURGE} ${MAVEN}"
    }
    make_target() {
        make_clean
        make_build
        
    }
    ${MAKE}_$program_type
}

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function f_snap()
{
    
    make_build() {
        ${BASH_CMD} "${APT_INSTALL} ${SNAP}"
    }
    
    make_clean () {
        
        ${BASH_CMD} "${APT_PURGE} ${SNAP}"
    }
    
    make_target() {
        make_clean
        make_build
        
    }
    ${MAKE}_$program_type
}
#--------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------

function f_apt()
{
APTFIX='sudo apt-get install software-properties-common'
${BASH_CMD} "${APT_FIX}"
}
#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function f_vim()
{
     make_build(){
        ${BASH_CMD} "${APT_INSTALL}  ${VIM}"
    }
    
     make_clean(){
        ${BASH_CMD} "${APT_PURGE} ${VIM}"
    }
     make_target() {
        make_clean
        make_build
    }
    ${MAKE}_${program_type}
}
#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------

function f_vlc()
{
    make_build() 
    {
        ${BASH_CMD} "${APT_INSTALL} ${VLC}"
    }
    
    make_clean() {
        ${BASH_CMD} "${APT_PURGE} ${VLC}"
    }
    make_target() {
        make_clean
        make_build
    }

}
#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function f_git()
{
    make_build() {
        ${BASH_CMD} "${APT_INSTALL} ${GIT}"
    }
    
    make_clean() {
        ${BASH_CMD} "${APT_PURGE} ${GIT}"
    }
    make_target() {
        make_clean
        make_build
    }
    ${MAKE}_$program_type
}



#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------

function f_virtualbox()
{
    make_build() {
        ${BASH_CMD} "${APT_INSTALL} ${VIRTUALBOX}"
    }
    make_clean() {
        ${BASH_CMD} "${APT_PURGE} ${VIRTUALBOX}"
    }
    make_target() {
        make_clean
        make_build
    }
    ${MAKE}_$program_type
}
#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------

function f_python()
{
    
    
    make_build() {
        ${BASH_CMD} "${APT_INSTALL} ${PYTHON}"
    }
    make_clean (){
        ${BASH_CMD} "${APT_PURGE} ${PYTHON}"
        
    }
    make_target() {
        make_clean
        make_build
    }
     ${MAKE}_$program_type
    
    
}
#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function f_firefox()
{
    
    
    make_build() {
        ${BASH_CMD} "${APT_INSTALL} ${FIREFOX}"
    }
    make_clean() {
        ${BASH_CMD} "${APT_PURGE} ${FIREFOX}"
        
    }
    
    make_target() {
        make_clean
        make_build
    }
     ${MAKE}_$program_type
}

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------

function f_nomacs()
{
    
    make_build()
    {
        ${BASH_CMD} "${APT_INSTALL} ${NOMACS}"
    }
    
    make_clean()
    {
        ${BASH_CMD} "${APT_PURGE} ${NOMACS}"
    }
    
    make_target()
    {
        make_clean
        make_build
    }
    ${MAKE}_$program_type
}

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------

function f_gnome_tweaks()
{
    declare GNOME_TWEAKS='gnome-tweaks'
    make_build()
    {
        ${BASH_CMD} "${APT_INSTALL} ${GNOME_TWEAKS}"
    }
    
    make_clean()
    {
        ${BASH_CMD} "${APT_PURGE} ${GNOME_TWEAKS}"
    }
    
    make_target()
    {
        make_clean
        make_build
    }
    ${MAKE}_$program_type
}

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------

function f_scrcpy()
{
    make_build()
    {
        ${BASH_CMD} "${SNAP_INSTALL} ${SCRCPY}"
    }
    
    make_clean()
    {
        ${BASH_CMD} "${SNAP_REMOVE} ${SCRCPY}"
    }
    
    make_target()
    {
        make_clean
        make_build
    }
    ${MAKE}_$program_type
}
#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#--------------------------------------------------------------------------------------------------
function f_system-install() {
    f_update
    f_package-apps
    f_gui-apps
    f_os-apps
    f_linux-apps
    f_java-apps
}

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function cheese(){

    make_clean()
    {
        ${BASH_CMD} "${APT_REMOVE} $CHEESE"
    }
    make_build() {
        ${BASH_CMD} " ${APT_INSTALL} $CHEESE"

    }
    make_target() {
        clean
        build

    }
    ${MAKE}_$program_type
}

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function f_gui-apps() {

    ${EXEC_MAKE} ${THEME}
    ${EXEC_MAKE} ${ICONS}
    ${EXEC_MAKE} ${BACKGROUND}
    ${EXEC_MAKE} ${SCREENSAVER}
    ${EXEC_MAKE} ${LOGINSCREEN}
    ${EXEC_MAKE} ${BOOKMARKS}
    
}

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function f_package-apps() {
    
    
    ${EXEC_MAKE} ${SNAP}
    ${EXEC_MAKE} ${YUM}
    ${EXEC_MAKE} ${GIT}
   
}

#------------}---------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function f_os-apps() {
    ${EXEC_MAKE} ${JAVA}
    ${EXEC_MAKE} ${MAVEN}
    ${EXEC_MAKE} ${ECLIPSE}
    ${EXEC_MAKE} ${MAKE}
    ${EXEC_MAKE} ${CMAKE}
    ${EXEC_MAKE} ${CMAKE_GUI}
    ${EXEC_MAKE} ${CHROME}
    ${EXEC_MAKE} ${LIBREOFFICE}
    ${EXEC_MAKE} ${SKYPE}
    ${EXEC_MAKE} ${VIRTUALBOX}
    ${EXEC_MAKE} ${VIM}
    ${EXEC_MAKE} ${VLC}
    ${EXEC_MAKE} ${PYTHON}
    ${BASH_CMD} "${APT_AUTOREMOVE}"
    
    
}



#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function f_linux-apps() {
    
    ${EXEC_MAKE} ${VIDEO}
    ${EXEC_MAKE} ${CPULIMIT}
    ${EXEC_MAKE} ${FFMPEG}
    ${EXEC_MAKE} ${AVCONV}
    ${EXEC_MAKE} ${GIMP}
    ${EXEC_MAKE} ${HTOP}
    ${EXEC_MAKE} ${LAME}
    ${EXEC_MAKE} ${MEDIA_DL}
    ${EXEC_MAKE} ${KAZAM}
    ${EXEC_MAKE} ${THUNDERBIRD}
    ${EXEC_MAKE} ${CHEESE}
    ${EXEC_MAKE} ${CODE}
    ${EXEC_MAKE} ${SHELLCHECK}
    ${EXEC_MAKE} ${GDRIVE}
    ${EXEC_MAKE} ${NOMACS}
    ${EXEC_MAKE} ${SENSORS}
    ${EXEC_MAKE} ${TEMPERATURE}
    ${EXEC_MAKE} ${GNOME_TWEAKS}
    ${EXEC_MAKE} ${CHEESE}
    ${EXEC_MAKE} ${SCRCPY}
    ${BASH_CMD} ${APT_AUTOREMOVE}


    
}


#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	error calling a function make bash interpretror willl call gcc program make. 
#--------------------------------------------------------------------------------------------------
function f_java-apps() {
    ${EXEC_MAKE}  ${VIEWER}
    ${EXEC_MAKE} ${BACKUP}
    ${EXEC_MAKE} ${IMAGE_TOOLS}
    ${EXEC_MAKE} ${AUDIO_COMPRESSOR}
    ${BASH_CMD} "${APT_AUTOREMOVE}"
    
}

########################################################################################################
# 			                   	SYSTEM FUN
########################################################################################################

function cloud() {

    connect() 
    {
        ${BASH_CMD} "${MK_DIR} ${cloud_dir}"
        ${BASH_CMD} "${GDRIVE_UNMOUNT} ${cloud_dir}"
        ${BASH_CMD} "${GDRIVE_MOUNT} ${cloud_dir}"
    }
    
    disconnect()
    {
       ${BASH_CMD} "${GDRIVE_UNMOUNT} ${cloud_dir}"
    }
        function list()
    {
        connect
     declare -a arrayName=("$(ls -t ${cloud_dir}*)")
     for file in "${arrayName[@]}"
    do  
        ${BASH_CMD} "echo $file"
    done
    disconnect
    }

   readonly cloud_dir="/home/r4770/gdrive/"
   $parameter2



    
   

}

#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
function update() {
    
    ${BASH_CMD} "${APT_UPDATE}"
    ${BASH_CMD} "${APT_UPGRADE}"
    ${BASH_CMD} "${APT_AUTOREMOVE}"
    ${BASH_CMD} "${APT_AUTOCLEAN}"
    
}


#---------------------------------------------------------------------------------------------------
#Script Description- <name>
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#--------------------------------------------------------------------------------------------------
#Lock path defintions
PATH_TO_LOCK='/var/lib/dpkg/lock'
PATH_TO_FRONTLOCK='/var/lib/dpkg/lock-frontend'
PATH_TO_CACHELOCK='/var/cache/apt/archives/lock'
PATH_TO_ARCHIVELOCK='/var/cache/apt/archives/lock'
PATH_TO_LISTLOCK=' /var/lib/apt/lists/lock'

releaselocks() {
    ${FORCE_RM} "${PATH_TO_LOCK}"
    ${FORCE_RM} "${PATH_TO_FRONTLOCK}"
    ${FORCE_RM} "${PATH_TO_CACHELOCK}"
    ${FORCE_RM} "${PATH_TO_ARCHIVELOCK}"
    ${FORCE_RM} "${PATH_TO_LISTLOCK}"
    
}

#---------------------------------------------------------------------------------------
#Script Description-
#Program Description:
#	<info>
#Post Triggers
#	<info>
#Notes
#	<info>
#---------------------------------------------------------------------------------------
function destegnogify() {
    USR_INPUT=$1
    if [ "$2" == "" ]; then 
        TAR_NUMBER=3
    else
        TAR_NUMBER=$2
    fi
    INPUT_DIRECTORY=${USR_INPUT%/*}/
    TEMP="${USR_INPUT##*/}"
    INPUT_FILE=${TEMP::-4}
    JPG_FILE="${INPUT_DIRECTORY}${INPUT_FILE}.jpg"
    ZIP_FILE="${INPUT_DIRECTORY}${INPUT_FILE}.zip"
    TAR_FILE="${INPUT_DIRECTORY}${INPUT_FILE}.tar"
    EXTRACT_DIR="${INPUT_DIRECTORY}${INPUT_FILE}/"
    ${BASH_CMD} "cp ${JPG_FILE} ${ZIP_FILE}"
    ${BASH_CMD} "unzip -j -d $INPUT_DIRECTORY ${ZIP_FILE}"
    ${BASH_CMD} "tar -C ${INPUT_DIRECTORY} -xvf ${TAR_FILE} --strip=$TAR_NUMBER"

}


function stegnogify() {
    USR_INPUT=$1
    IMAGE_LOCATION=$2
    PARENT_DIRECTORY=${USR_INPUT%/*}/
    PARENT_DIRECTORY=${PARENT_DIRECTORY::-1}
    INPUT_DIRECTORY="${USR_INPUT##*/}"
    TAR_FILE="${PARENT_DIRECTORY}${INPUT_DIRECTORY}.tar"
    ZIP_FILE="${PARENT_DIRECTORY}${INPUT_DIRECTORY}.zip"
    JPG_FILE="${PARENT_DIRECTORY}${INPUT_DIRECTORY}.jpg"
    
    pt "$USR_INPUT"
    pt "${INPUT_FILE}"
    pt "$TAR_FILE"
    pt "$ZIP_FILE"
    pt "$JPG_FILE"
    
    tar -C ${PARENT_DIRECTORY} -cvf ${TAR_FILE} ${USR_INPUT}
    zip $ZIP_FILE $IMAGE_LOCATION $TAR_FILE
    cat $IMAGE_LOCATION $ZIP_FILE > $JPG_FILE
}



function f_admin()
{
    #Admin function paths
    
    PROGRAM_SRC_DIR=${BASH_DIR}${PROGRAM_NAME}${SLASH}
    PROGRAM_VERSION_DIR=${PROGRAM_SRC_DIR}${VERSION}${SLASH}
    PROGRAM_SRC_PATH=${PROGRAM_SRC_DIR}${PROGRAM_NAME}${SH_EXT}
    PROGRAM_BIN_PATH=${BIN_DIR}${PROGRAM_NAME}
    PROGRAM_DEPLOY_DIR=${LOGIN_DIR}${GDRIVE}${SLASH}
    PROGRAM_DEPLOY_PATH=${PROGRAM_DEPLOY_DIR}${PROGRAM_NAME}
    VERSION_FILE_PATH=${PROGRAM_VERSION_DIR}${PROGRAM_NAME}${EPOCH_TIME}${BKUP_EXT}
    
    
    make_version() 
    {
        
        ${BASH_CMD} "${MK_DIR} ${PROGRAM_VERSION_DIR}"
        ${BASH_CMD} "${FORCE_CP} ${PROGRAM_SRC_PATH} ${VERSION_FILE_PATH}"
        ${BASH_CMD} "${CHMOD_NONRUNNABLE} ${VERSION_FILE_PATH}"
        ${BASH_CMD} "${CHMOD_READONLY} ${VERSION_FILE_PATH}"
        
    }
    
  
    make_install() {
        make_version
        ${BASH_CMD} "${FORCE_CP} ${PROGRAM_SRC_PATH} ${PROGRAM_BIN_PATH}"
        ${BASH_CMD} "${CHMOD_RUNNABLE} ${PROGRAM_BIN_PATH}"
        ${BASH_CMD} "${CHMOD_READONLY}  ${PROGRAM_BIN_PATH}"
    }
    
    
    
    make_deploy() {
        make_install
        ${BASH_CMD} "${CP} ${PROGRAM_SRC_PATH} ${PROGRAM_NAME}"
        ${BASH_CMD} "${CHMOD_READONLY} ${PROGRAM_NAME}"
        ${BASH_CMD} "${CHMOD_NONRUNNABLE} ${PROGRAM_NAME}"
        
        ${BASH_CMD} "${FORCE_RM} ${PROGRAM_DEPLOY_DIR}"
        ${BASH_CMD} "${MK_DIR} ${PROGRAM_DEPLOY_DIR}"
        ${BASH_CMD} " ${GDRIVE_MOUNT} ${PROGRAM_DEPLOY_DIR}"
        ${BASH_CMD} "${CP} ${PROGRAM_SRC_PATH} ${PROGRAM_DEPLOY_PATH}"
        ${BASH_CMD} "${GDRIVE_UNMOUNT} ${PROGRAM_DEPLOY_DIR}"
        ${BASH_CMD} "${FORCE_RM} ${PROGRAM_DEPLOY_DIR}"
        ${BASH_CMD} "${FORCE_RM} ${PROGRAM_NAME}"
    }
    ${MAKE}_$program_type



}

function f_help()
{
    
    my_array=( `grep "^function" $0` )
    my_array_length=${#my_array[@]}
    pt $my_array_length
    
    for element in "${my_array[@]}"
    do
        if [[ "$element" == *"("* ]]; then
            pt "public ${element}"
        fi
        if [[ "$element" == *"f_"* ]]; then 
            pt  "private ${element}"
        fi 
    done
}


UPDATE='update'
HELP='help'
RELASELOCKS="releaselocks"

parse_parameters() {
    
 
    pt "Program Running: $0 "
    pt "Input Parameters: p1: $parameter1 | p2: $parameter2 p3: $parameter3"
    pt "$DDASH"


            
    if [ "$parameter1" == "" ]; then
        f_help
     elif [ "$parameter1" == "${HELP}" ] || [ "${parameter1}" == "${RELASELOCKS}"  ] || [ "${parameter1}" == "${STEGNOGIFY}" ] || [ "${parameter1}" == "${DESTEGNOGIFY}" ] || [ "$parameter1" == "${UPDATE}" ]; then 
          echo "Legacy System Command detected"
          LEGACY_CMD_FLAG=true; 
           program_name="$parameter1"

     elif [ "$parameter1" == "$LINUX_APPS" ] || [ "$parameter1" == "$OS_APPS" ] || [ "$parameter1" == "$JAVA_APPS" ] || [ "$parameter1" == "$GUI_APPS" ] || [ "$parameter1" == "$PACKAGE_APPS" ] || [ "$parameter1" == "$SYSTEM_APPS" ] || [ "$parameter1" == "$ADMIN" ]; then      
           echo "Multidiemensonal buiild command detected"
            program_name="$parameter1"
            program_type="$parameter2"
            BUILD_CMD_FLAG=true; 
            build_name=${program_name}

     elif [ "$parameter2" == "$LINUX_APPS" ] || [ "$parameter2" == "$OS_APPS" ] || [ "$parameter2" == "$JAVA_APPS" ] || [ "$parameter2" == "$GUI_APPS" ] || [ "$parameter2" == "$PACKAGE_APPS" ]  || [ "$parameter2" == "$SYSTEM_APPS" ] || [ "$parameter2" == "$ADMIN" ]; then
          echo "Multidiemensonal buiild command detected"

            program_name="$parameter2"
            program_type="$parameter1"
            BUILD_CMD_FLAG=true; 
            build_name=${program_name}

        elif [ "$parameter1" == "$TARGET" ] || [ "$parameter1" == "${DOWNLOAD}" ] ||  [ "$parameter1" == "${INSTALL}" ] || [ "$parameter1" == "${BUILD}" ] || [ "$parameter1" == "${CLEAN}" ] || [ "$parameter1" == "${INFO}" ]; then
           
           echo "make command detected"
            program_type="$parameter1"   
            program_name="$parameter2"
            MAKE_CMD_FLAG=true;

        elif [ "$parameter2" == "$TARGET" ] || [ "$parameter2" == "${DOWNLOAD}" ]  || [ "$parameter2" == "${INSTALL}" ] || [ "$parameter2" == "${BUILD}" ] || [ "$parameter2" == "${CLEAN}" ] || [ "$parameter1" == "${INFO}" ]; then
                      echo "make command detected"

            program_type="$parameter2"
            program_name="$parameter1"
            MAKE_CMD_FLAG=true; 

    else
            program_name="$parameter2"
            program_type="${parameter2}"
            BASH_CMD_FLAG=true; 

    fi
    pt "Parsed parameters"
    pt "Program Name: $program_name | Program Type: $program_type | Build name $build_name"
    pt
    pt "$STARS"
}




#main executable program
echo "$STARS"
echo "                               Make Program "
echo "                              Date : $(date)"
echo "                             Linux Ubuntu 19.10" 

echo "$STARS"
parameter1=$1 parameter2=$2 parameter3=$3
#parse_parameters

#if [ "$LEGACY_CMD_FLAG" == "true" ]; then 
 #      exec_legacy "$parameter1 $parameter2 $parameter3"
#elif [ "$BASH_CMD_FLAG" == "true " ]; then
 #       exec_bash "$parameter1 $parameter2 $parameter3"
#elif [ "$MAKE_CMD_FLAG" == "true" ] ; then
        exec_make "${parameter1} ${parameter2}"
#elif [ $BUILD_CMD_FLAG == "true" ] ; then
 #       exec_build "${program_name}"
# else
  #      er "Invalid bash command"
 #       
#fi       
