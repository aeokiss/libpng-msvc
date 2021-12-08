@echo off

@call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x86_arm64

@set SrcDir=libpng
@set ResDir=res

del /Q %ResDir%\pnglibconf.h
copy %SrcDir%\scripts\pnglibconf.h.prebuilt %ResDir%\pnglibconf.h

cd %SrcDir%

nmake -f ..\%ResDir%\Makefile.msvc clean
nmake -f ..\%ResDir%\Makefile.msvc NO_NLS=1 MFLAGS=-MTd DEBUG=1

cd ..

@set OutputLibDir=build\vs2022\ARM64\Debug

rmdir /S /Q %OutputLibDir%
mkdir %OutputLibDir%

copy %SrcDir%\libpng.lib %OutputLibDir%
copy %SrcDir%\png.h %OutputLibDir%
copy %SrcDir%\pngconf.h %OutputLibDir%
copy %SrcDir%\pngdebug.h %OutputLibDir%
copy %SrcDir%\pnginfo.h %OutputLibDir%
copy %SrcDir%\pnglibconf.h %OutputLibDir%
copy %SrcDir%\pngpriv.h %OutputLibDir%
copy %SrcDir%\pngstruct.h %OutputLibDir%
copy %SrcDir%\pngtest.exe %OutputLibDir%
copy %SrcDir%\*.pdb %OutputLibDir%
copy %SrcDir%\scripts\pnglibconf.h.prebuilt %OutputLibDir%\pnglibconf.h

cd %SrcDir%

nmake -f ..\%ResDir%\Makefile.msvc clean
nmake -f ..\%ResDir%\Makefile.msvc NO_NLS=1 MFLAGS=-MT

cd ..

@set OutputLibDir=build\vs2022\ARM64\Release

rmdir /S /Q %OutputLibDir%
mkdir %OutputLibDir%

copy %SrcDir%\libpng.lib %OutputLibDir%
copy %SrcDir%\png.h %OutputLibDir%
copy %SrcDir%\pngconf.h %OutputLibDir%
copy %SrcDir%\pngdebug.h %OutputLibDir%
copy %SrcDir%\pnginfo.h %OutputLibDir%
copy %SrcDir%\pnglibconf.h %OutputLibDir%
copy %SrcDir%\pngpriv.h %OutputLibDir%
copy %SrcDir%\pngstruct.h %OutputLibDir%
copy %SrcDir%\pngtest.exe %OutputLibDir%
copy %SrcDir%\*.pdb %OutputLibDir%
copy %SrcDir%\scripts\pnglibconf.h.prebuilt %OutputLibDir%\pnglibconf.h

del /Q %ResDir%\pnglibconf.h

pause
