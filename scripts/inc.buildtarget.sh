#This file is part of The Open GApps script of @mfonville.
#
#    The Open GApps scripts are free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    These scripts are distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
buildtarget() {
clean
#####---------FIRST THE SPECIAL CASES---------
builddpiapp "com.google.android.gms" "GMSCore" "priv-app/PrebuiltGmsCore"
case "$gapps" in
	*messenger*) builddpiapp "com.google.android.apps.messaging" "Messenger" "app/PrebuiltBugle";;
esac
case "$gapps" in
	*playgames*) builddpiapp "com.google.android.play.games" "PlayGames" "app/PlayGames";;
esac
if [ "$API" -gt "19" ]; then
	#Keyboard Lib
	buildfile "$LIBFOLDER/libjni_latinimegoogle.so" "Optional/keybd_lib/$LIBFOLDER/"
fi
#####---------CORE APPLICATIONS---------
buildfile "etc/" "Core/required/etc/"
buildfile "framework" "Core/required/framework/"
buildapp "com.google.android.syncadapters.contacts" "Core/required/app/GoogleContactsSyncAdapter"
buildapp "com.google.android.backuptransport" "Core/required/priv-app/GoogleBackupTransport"
buildapp "com.google.android.feedback" "Core/required/priv-app/GoogleFeedback"
buildapp "com.google.android.gsf" "Core/required/priv-app/GoogleServicesFramework"
buildapp "com.google.android.gsf.login" "Core/required/priv-app/GoogleLoginService"
buildapp "com.google.android.onetimeinitializer" "Core/required/priv-app/GoogleOneTimeInitializer"
buildapp "com.google.android.partnersetup" "Core/required/priv-app/GooglePartnerSetup"
buildapp "com.google.android.setupwizard" "Core/required/priv-app/SetupWizard"
buildapp "com.android.vending" "Core/required/priv-app/Phonesky"

#####---------GENERIC PACKAGES---------
case "$gapps" in
	*books*) buildapp "com.google.android.apps.books" "GApps/books/app/Books";;
esac
case "$gapps" in
	*calendargoogle*)	buildapp "com.google.android.calendar" "GApps/calendargoogle/app/CalendarGooglePrebuilt";;
esac
case "$gapps" in
	*calsync*)	buildapp "com.google.android.syncadapters.calendar" "GApps/calsync/app/GoogleCalendarSyncAdapter";;
esac
case "$gapps" in
	*cameragoogle*)	buildapp "com.google.android.googlecamera" "GApps/cameragoogle/app/GoogleCamera";;
esac
case "$gapps" in
	*chrome*)	buildapp "com.android.chrome" "GApps/chrome/app/Chrome";;
esac
case "$gapps" in
	*clockgoogle*)	buildapp "com.google.android.deskclock" "GApps/clockgoogle/app/DeskClockGoogle";;
esac
case "$gapps" in
	*cloudprint*)	buildapp "com.google.android.apps.cloudprint" "GApps/cloudprint/app/CloudPrint2";;
esac
case "$gapps" in
	*docs*)	buildapp "com.google.android.apps.docs.editors.docs" "GApps/docs/app/EditorsDocs";;
esac
case "$gapps" in
	*drive*)	buildapp "com.google.android.apps.docs" "GApps/drive/app/Drive";;
esac
case "$gapps" in
	*ears*)	buildapp "com.google.android.ears" "GApps/ears/app/GoogleEars";;
esac
case "$gapps" in
	*earth*)	buildapp "com.google.earth" "GApps/earth/app/GoogleEarth";;
esac
case "$gapps" in
	*exchangegoogle*)	buildapp "com.google.android.gm.exchange" "GApps/exchangegoogle/app/PrebuiltExchange3Google";;
esac
case "$gapps" in
	*faceunlock*)	buildfile "$LIBFOLDER/libfacelock_jni.so" "GApps/faceunlock/$LIBFOLDER/"
			buildfile "$LIBFOLDER/libfilterpack_facedetect.so" "GApps/faceunlock/$LIBFOLDER/"
			if [ "$FALLBACKARCH" != "$ARCH" ]; then
				buildfile "lib/libfilterpack_facedetect.so" "GApps/faceunlock/lib/" #on 64 bit, we also need the 32 bit file
			fi
			buildfile "vendor/pittpatt/" "GApps/faceunlock/vendor/pittpatt/"
			buildapp "com.android.facelock" "GApps/faceunlock/app/FaceLock";;
esac
case "$gapps" in
	*fitness*)	buildapp "com.google.android.apps.fitness" "GApps/fitness/app/FitnessPrebuilt";;
esac
case "$gapps" in
	*gmail*)	buildapp "com.google.android.gm" "GApps/gmail/app/PrebuiltGmail";;
esac
case "$gapps" in
	*googlenow*)	buildapp "com.google.android.launcher" "GApps/googlenow/priv-app/GoogleHome";; #moves in android M to /app/
esac
case "$gapps" in
	*photos*)	buildapp "com.google.android.apps.photos" "GApps/photos/app/Photos";;
esac
case "$gapps" in
	*googleplus*)	buildapp "com.google.android.apps.plus" "GApps/googleplus/app/PlusOne";;
esac
case "$gapps" in
	*googletts*)	buildapp "com.google.android.tts" "GApps/googletts/app/GoogleTTS";;
esac
case "$gapps" in
	*hangouts*)	buildapp "com.google.android.talk" "GApps/hangouts/priv-app/Hangouts";;
esac
case "$gapps" in
	*keep*)	buildapp "com.google.android.keep" "GApps/keep/app/PrebuiltKeep";;
esac
case "$gapps" in
	*keyboardgoogle*)	buildapp "com.google.android.inputmethod.latin" "GApps/keyboardgoogle/app/LatinImeGoogle";;
esac
case "$gapps" in
	*maps*)	buildapp "com.google.android.apps.maps" "GApps/maps/app/Maps";;
esac
case "$gapps" in
	*movies*)	buildapp "com.google.android.videos" "GApps/movies/app/Videos";;
esac
case "$gapps" in
	*music*)	buildapp "com.google.android.music" "GApps/music/app/Music2";;
esac
case "$gapps" in
	*newsstand*)	buildapp "com.google.android.apps.magazines" "GApps/newsstand/app/Newsstand";;
esac
case "$gapps" in
	*newswidget*)	buildapp "com.google.android.apps.genie.geniewidget" "GApps/newswidget/app/PrebuiltNewsWeather";;
esac
case "$gapps" in
	*search*)	buildapp "com.google.android.googlequicksearchbox" "GApps/search/priv-app/Velvet";;
esac
case "$gapps" in
	*sheets*)	buildapp "com.google.android.apps.docs.editors.sheets" "GApps/sheets/app/EditorsSheets";;
esac
case "$gapps" in
	*slides*)	buildapp "com.google.android.apps.docs.editors.slides" "GApps/slides/app/EditorsSlides";;
esac
case "$gapps" in
	*speech*)	buildfile "usr/srec/" "GApps/speech/usr/srec/";;
esac
case "$gapps" in
	*street*)	buildapp "com.google.android.street" "GApps/street/app/Street";;
esac
case "$gapps" in
	*talkback*)	buildapp "com.google.android.marvin.talkback" "GApps/talkback/app/talkback";;
esac
case "$gapps" in
	*wallet*)	buildapp "com.google.android.apps.walletnfcrel" "GApps/wallet/priv-app/Wallet";;
esac
if [ "$API" -gt "19" ]; then
	case "$gapps" in
		*webview*)	buildapp "com.google.android.webview" "GApps/webviewgoogle/app/WebViewGoogle";;
	esac
fi
case "$gapps" in
	*youtube*)	buildapp "com.google.android.youtube" "GApps/youtube/app/YouTube";;
esac
}
