echo "Git cloning RetroArch & old cores..."
git clone --recurse-submodules -j8 https://github.com/libretro/RetroArch.git
git clone https://github.com/Gamr13/old_cores.git

echo "Downloading RetroArch cores..."
curl "https://buildbot.libretro.com/nightly/windows/x86_64/RetroArch_cores.7z" --Output cores.7z
curl "http://195.90.212.190/Files/Angle%%20Cores/mupen64plus_next_libretro.dll" --Output mupen64plus_next_libretro.dll
curl "http://195.90.212.190/Files/Angle%%20Cores/parallel_n64_libretro.dll" --Output parallel_n64_libretro.dll
curl "http://195.90.212.190/Files/Angle%%20Cores/yabasanshiro_libretro.dll" --Output yabasanshiro_libretro.dll

echo "Extracting Files..."
"C:\Program Files\7-Zip\7z.exe" x cores.7z -aoa -o".\cores"
"C:\Program Files\7-Zip\7z.exe" x ".\old_cores\old_cores.7z -aoa -o".\RetroArch\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\cores\"
"C:\Program Files\7-Zip\7z.exe" x ".\old_cores\ADLLS.7z" -aoa -o".\ADLLS"
"C:\Program Files\7-Zip\7z.exe" x ".\old_cores\ADLLS2.7z" -aoa -o".\ADLLS"

echo "Moving core dependencies..."
move /Y ".\ADLLS\*" "RetroArch\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\"

echo "Moving core files..."
move /Y ".\cores\RetroArch-Win64\cores\*" "RetroArch\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\cores\"

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
echo y|rmdir /s ".\cores" ".\old_cores"
echo y|rmdir /s ".\old_cores"
echo y|rmdir /s ".\ADLLS"

echo "Deleting broken RetroArch cores..."
cd "RetroArch\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\cores\"
del .empty 81_*.dll bk_*.dll chailove*.dll craft*.dll easyrpg*.dll fuse*.dll mednafen_psx_hw*.dll fbalpha*.dll mednafen_snes*.dll mednafen_gba*.dll hatari*.dll x1*.dll bsnes_mer*.dll bsnes2*.dll mesen-s*.dll minivm*.dll 2048*.dll arduous*.dll blastem*.dll boom3*.dll boom3*.dll cannonball_*.dll citra*.dll crocods*.dll dinothawr_*.dll ecwolf*.dll frodo*.dll gong*.dll jaxe*.dll jumpnbump*.dll lowresnx*.dll lutro*.dll mrboom*.dll mu*.dll nekop2*.dll nxengine*.dll oberon*.dll play_*.dll prboom*.dll race*.dll reminiscence*.dll retro8*.dll sameduck*.dll snes9x2*.dll squirreljme*.dll stella2*.dll tgbdual*.dll thepowdertoy*.dll tic80*.dll tyrquake*.dll uzem*.dll vitaquake2*.dll vemulator*.dll wasm4*.dll xrick*.dll                    							
pause 

