@ECHO OFF
:: set title of cmd interface
title Spotlite to Wallpaper
:: set locations of source & destination
set from= "%localappdata%\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets"
set to= "H:\walpaper\x"
:: copy from souce to destination
ROBOCOPY %from% %to% /MIN:200000 /MAXAGE:3 
:: rename copied files to image format
cd %to% & ren *.* *.jpg
::pause