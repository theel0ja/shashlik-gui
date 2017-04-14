#!/bin/sh
# shashlik-gui 1.0
#
# Copyright (c) 2017 Elias Ojala
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# https://github.com/theel0ja/shashlik-gui

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
