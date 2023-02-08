@echo off
mkdir tmp
for %%i in (*.avi *.wmv *.mp4 *.mov *.mpeg *.mpg) do COPY "%%i" "%CD%/tmp/%%i"

cd tmp
for %%i in (*.avi *.wmv *.mp4 *.mov *.mpeg *.mpg) do ffmpeg -i "%%i" -ar 8000 -ac 1 "8k_%%~ni.mp4"
for %%i in (*8k*) do ffmpeg -i "%%i" -s 176x144 "resize_%%~ni.mp4"
for %%i in (*resize*) do ffmpeg -i "%%i" "Out_%%~ni.3gp"
for %%i in (*.3gp) do ffmpeg -i "%%i" "Final_%%~ni.mp4"
for %%i in (*Final*) do COPY "%%i" "../%%i"
cd ..
echo Epicduck wuz here
rmdir /s /q "%cd%/tmp"