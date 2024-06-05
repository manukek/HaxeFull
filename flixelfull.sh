#!/bin/bash

echo   '  __ __              ____     ____  '
echo '  / // /__ ___ _____ / __/_ __/ / /  '
echo ' / _  / _ `/\ \ / -_) _// // / / /  '
echo '/_//_/\_,_//_\_\\__/_/  \_,_/_/_/   '
echo '                                   '
             

if ! hash haxe 2>/dev/null; then
    echo "Download Haxe here https://haxe.org/"
else
    echo "Haxe has already downloaded!"
fi

echo "Downloading/Updating HaxeFlixel and other libraries..."
libraries=(flixel openfl flixel-addons flixel-ui hscript actuate format lime openfl SScript tjson flixel-tools)

for lib in "${libraries[@]}"; do
    if haxelib list | grep -q $lib; then
        echo "lib $lib has already downloaded. Updating..."
        haxelib upgrade $lib
    else
        echo "Downloading $lib..."
        haxelib install $lib
    fi
done

echo "Downloading over! Enjoy!"