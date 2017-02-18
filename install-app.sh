#!/bin/sh
# shashlik-gui 1.0
# Copyright 2016, Elias Ojala
# https://github.com/theel0ja/shashlik-gui
# MIT Licensed

FILE=`zenity --file-selection --title="Select a .apk-file that you want to install"`
case $? in
         0)
                case "${FILE##*.}" in
                                   apk)
                                        zenity --question --text="Do you want to install $FILE?"
                                        case $? in
                                                 0)
                                                    /opt/shashlik/bin/shashlik-install $FILE
                                                 ;;     
                                                 1)
                                                    zenity --warning --text="Application not installed.";;
                                                -1)
                                                    zenity --error --text="An unexpected error has occurred.";;
                                        esac
                                        ;;
                                   *)
                                        zenity --error --text="Invalid file type.";;
                esac
            ;;
         1)
                zenity --error --text="No file selected.";;
        -1)
                zenity --error --text="An unexpected error has occurred.";;
esac
