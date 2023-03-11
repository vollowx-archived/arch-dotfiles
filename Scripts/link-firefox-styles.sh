if [ -z ${FIREFOX_PROFILE_FOLDER+x} ]; then
	echo "Need to set the variable FIREFOX_PROFILE_FOLDER"
else
	export REAL_UC_FOLDER=~/.config/firefox-chrome
	export FIREFOX_UC_FOLDER=${FIREFOX_PROFILE_FOLDER}/chrome
	ln -sf $REAL_UC_FOLDER $FIREFOX_UC_FOLDER
	unset REAL_UC_FOLDER
	unset FIREFOX_UC_FOLDER
fi
