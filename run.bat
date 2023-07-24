@echo off

if "%1"=="api" call node api/server.js
if "%1"=="folga" call elm-live src/Main.elm --open
if "%1"=="format" call elm-format src/ --yes