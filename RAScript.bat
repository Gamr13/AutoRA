echo "Git cloning RetroArch & old cores..."
git clone --recurse-submodules -j8 https://github.com/libretro/RetroArch.git
git clone https://github.com/Gamr13/old_cores.git
git clone https://gitlab.com/Gamr13/old_cores1.git

echo "Downloading RetroArch cores..."
curl "https://buildbot.libretro.com/nightly/windows/x86_64/RetroArch_cores.7z" --Output cores.7z
curl "http://195.90.212.190/Files/Angle%%20Cores/mupen64plus_next_libretro.dll" --Output mupen64plus_next_libretro.dll
curl "http://195.90.212.190/Files/Angle%%20Cores/parallel_n64_libretro.dll" --Output parallel_n64_libretro.dll
curl "http://195.90.212.190/Files/Angle%%20Cores/yabasanshiro_libretro.dll" --Output yabasanshiro_libretro.dll

echo "Extracting Files..."
"C:\Program Files\7-Zip\7z.exe" x "cores.7z" -aoa -o".\cores"
move /Y ".\cores\RetroArch-Win64\cores\*" "%~dp0RetroArch\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\cores"
"C:\Program Files\7-Zip\7z.exe" x ".\old_cores\old_cores.7z" -aoa -o"%~dp0RetroArch\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\cores"
"C:\Program Files\7-Zip\7z.exe" x ".\old_cores\m2014.7z" -aoa -o"%~dp0RetroArch\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\cores"
"C:\Program Files\7-Zip\7z.exe" x ".\old_cores\m2015.7z" -aoa -o"%~dp0RetroArch\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\cores"
"C:\Program Files\7-Zip\7z.exe" x ".\old_cores1\m2016.7z" -aoa -o"%~dp0RetroArch\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\cores"
"C:\Program Files\7-Zip\7z.exe" x ".\old_cores\ADLLS.7z" -aoa -o"%~dp0RetroArch\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64"
"C:\Program Files\7-Zip\7z.exe" x ".\old_cores\ADLLS2.7z" -aoa -o"%~dp0RetroArch\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64"

echo "Deleting non-ANGLE core files..."
del "RetroArch\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\cores\mupen64plus_next_libretro.dll"
del "RetroArch\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\cores\parallel_n64_libretro.dll"
del "RetroArch\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\cores\yabasanshiro_libretro.dll"

echo "Moving ANGLE cores..."
move /Y "mupen64plus_next_libretro.dll" "RetroArch\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\cores\"
move /Y "parallel_n64_libretro.dll" "RetroArch\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\cores\"
move /Y "yabasanshiro_libretro.dll" "RetroArch\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\cores\"

echo "Cleaning up files..."
del *.7z *.dll 
echo Y|rmdir /s ".\cores"
echo Y|rmdir /s ".\old_cores"
echo Y|rmdir /s ".\old_cores1"
echo Y|rmdir /s ".\ADLLS"

echo "Deleting broken RetroArch cores..."
cd "RetroArch\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\cores\"
del .empty bk_*.dll craft*.dll easyrpg*.dll mednafen_psx_hw*.dll mednafen_snes*.dll mednafen_gba*.dll bsnes_mer*.dll bsnes2*.dll mesen-s*.dll minivm*.dll arduous*.dll boom3*.dll boom3*.dll citra*.dll crocods*.dll frodo*.dll gong*.dll jaxe*.dll jumpnbump*.dll mrboom*.dll mu_*.dll nekop2*.dll oberon*.dll play_*.dll race*.dll sameduck*.dll snes9x2*.dll squirreljme*.dll stella2*.dll tyrquake*.dll vitaquake2*.dll wasm4*.dll                    							
pause 
