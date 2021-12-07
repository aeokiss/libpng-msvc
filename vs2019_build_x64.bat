@echo off

@call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

del /Q res\pnglibconf.h
copy libpng\scripts\pnglibconf.h.prebuilt res\pnglibconf.h

cd libpng

nmake -f ..\res\Makefile.msvc clean
nmake -f ..\res\Makefile.msvc NO_NLS=1 MFLAGS=-MTd DEBUG=1

cd ..

@set OutputLibDir=build\vs2019\x64\Debug

rmdir /S /Q %OutputLibDir%
mkdir %OutputLibDir%

copy libpng\libpng.lib %OutputLibDir%
copy libpng\png.h %OutputLibDir%
copy libpng\pngconf.h %OutputLibDir%
copy libpng\pngdebug.h %OutputLibDir%
copy libpng\pnginfo.h %OutputLibDir%
copy libpng\pnglibconf.h %OutputLibDir%
copy libpng\pngpriv.h %OutputLibDir%
copy libpng\pngstruct.h %OutputLibDir%
copy libpng\pngtest.exe %OutputLibDir%
copy libpng\*.pdb %OutputLibDir%

cd libpng

nmake -f ..\res\Makefile.msvc clean
nmake -f ..\res\Makefile.msvc NO_NLS=1 MFLAGS=-MT

cd ..

@set OutputLibDir=build\vs2019\x64\Release

rmdir /S /Q %OutputLibDir%
mkdir %OutputLibDir%

copy libpng\libpng.lib %OutputLibDir%
copy libpng\png.h %OutputLibDir%
copy libpng\pngconf.h %OutputLibDir%
copy libpng\pngdebug.h %OutputLibDir%
copy libpng\pnginfo.h %OutputLibDir%
copy libpng\pnglibconf.h %OutputLibDir%
copy libpng\pngpriv.h %OutputLibDir%
copy libpng\pngstruct.h %OutputLibDir%
copy libpng\pngtest.exe %OutputLibDir%
copy libpng\*.pdb %OutputLibDir%

del /Q res\pnglibconf.h

pause
