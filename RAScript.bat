@echo off
SETLOCAL EnableExtensions DisableDelayedExpansion
for /F %%a in ('echo prompt $E ^| cmd') do (
  set "ESC=%%a"
)
SETLOCAL EnableDelayedExpansion

echo !ESC![101;93m Git cloning RetroArch and old cores !ESC![0m
git clone --recurse-submodules -j8 https://github.com/libretro/RetroArch.git
git clone https://github.com/Gamr13/old_cores.git
git clone https://gitlab.com/Gamr13/old_cores1.git

echo !ESC![101;93m Downloading cores... !ESC![0m
curl "https://buildbot.libretro.com/nightly/windows/x86_64/RetroArch_cores.7z" --Output cores.7z

echo !ESC![101;93m Extracting files... !ESC![0m
"C:\Program Files\7-Zip\7z.exe" x "cores.7z" -aoa -o".\cores"
move /Y ".\cores\RetroArch-Win64\cores\*" "%~dp0RetroArch\pkg\msvc-uwp\RetroArch-msvcUWP\cores\x64\cores"
"C:\Program Files\7-Zip\7z.exe" x ".\old_cores\old_cores.7z" -aoa -o"%~dp0RetroArch\pkg\msvc-uwp\RetroArch-msvcUWP\cores\x64\cores"
"C:\Program Files\7-Zip\7z.exe" x ".\old_cores\m2014.7z" -aoa -o"%~dp0RetroArch\pkg\msvc-uwp\RetroArch-msvcUWP\cores\x64\cores"
"C:\Program Files\7-Zip\7z.exe" x ".\old_cores\m2015.7z" -aoa -o"%~dp0RetroArch\pkg\msvc-uwp\RetroArch-msvcUWP\cores\x64\cores"
"C:\Program Files\7-Zip\7z.exe" x ".\old_cores1\m2016.7z" -aoa -o"%~dp0RetroArch\pkg\msvc-uwp\RetroArch-msvcUWP\cores\x64\cores"
"C:\Program Files\7-Zip\7z.exe" x ".\old_cores\ADLLS.7z" -aoa -o"%~dp0RetroArch\pkg\msvc-uwp\RetroArch-msvcUWP\cores\x64"
"C:\Program Files\7-Zip\7z.exe" x ".\old_cores\ADLLS2.7z" -aoa -o"%~dp0RetroArch\pkg\msvc-uwp\RetroArch-msvcUWP\cores\x64"

echo !ESC![101;93m Cleaning up files... !ESC![0m
del *.7z *.dll 
echo Y|rmdir /s ".\cores"
echo Y|rmdir /s ".\old_cores"
echo Y|rmdir /s ".\old_cores1"

echo !ESC![101;93m Deleting known broken cores... !ESC![0m
cd "RetroArch\pkg\msvc-uwp\RetroArch-msvcUWP\cores\x64\cores\"
del .empty mednafen_psx_hw*.dll citra*.dll play_libretro.dll 
echo "Deleted .empty, mednafen_psx_hw, citra, play!"                  							
pause 
