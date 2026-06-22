@echo off
set "ROOT=%~dp0"
set "PGBIN=%ROOT%pgsql\bin"
set "PGDATA=%ROOT%data"

echo Mematikan PostgreSQL...
"%PGBIN%\pg_ctl.exe" -D "%PGDATA%" stop -m fast

if errorlevel 1 (
    echo PostgreSQL mungkin sudah tidak jalan, atau gagal dimatikan.
) else (
    echo Selesai. Sekarang aman untuk menutup folder/USB ini.
)
pause