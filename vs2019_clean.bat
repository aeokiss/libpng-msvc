@echo off

@call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars32.bat"

cd libpng

nmake -f ..\res\Makefile.msvc clean

cd ..

pause
