@echo off
setlocal enabledelayedexpansion

:: ============================================
::  KONFIGURASI - sesuaikan kalau perlu
:: ============================================
set "ROOT=%~dp0"
set "PGBIN=%ROOT%pgsql\bin"
set "PGDATA=%ROOT%data"
set "PHPDIR=%ROOT%php"
set "APPDIR=%ROOT%www\perpuskota"
set "SEEDFILE=%ROOT%db-seed.sql"
set "PGPORT=5435"
set "PGUSER=postgres"
set "DBNAME=perpuskota"

echo ============================================
echo   PerpusKota Portable
echo ============================================
echo.

:: ============================================
:: Cek apakah ini pertama kali dijalankan
:: ============================================
if not exist "%PGDATA%\PG_VERSION" (
    echo [1/5] Inisialisasi database ^(hanya terjadi sekali^)...
    "%PGBIN%\initdb.exe" -D "%PGDATA%" -U %PGUSER% -A trust -E UTF8
    if errorlevel 1 (
        echo GAGAL inisialisasi database.
        pause
        exit /b 1
    )

    echo [2/5] Menyalakan PostgreSQL di port %PGPORT%...
    "%PGBIN%\pg_ctl.exe" -D "%PGDATA%" -o "-p %PGPORT%" -l "%ROOT%pgsql.log" start
    timeout /t 5 /nobreak >nul

    echo [3/5] Verifikasi PostgreSQL jalan...
    "%PGBIN%\pg_isready.exe" -h 127.0.0.1 -p %PGPORT%
    if errorlevel 1 (
        echo GAGAL: PostgreSQL tidak respond. Cek %ROOT%pgsql.log
        pause
        exit /b 1
    )

    echo [4/5] Membuat database...
    "%PGBIN%\createdb.exe" -U %PGUSER% -p %PGPORT% %DBNAME%
    if errorlevel 1 (
        echo GAGAL membuat database.
    )

    echo [5/5] Mengisi data awal dari db-seed.sql...
    "%PGBIN%\psql.exe" -U %PGUSER% -p %PGPORT% -d %DBNAME% -f "%SEEDFILE%"
    if errorlevel 1 (
        echo GAGAL import database.
        pause
        exit /b 1
    )

) else (
    echo [1/2] Menyalakan PostgreSQL di port %PGPORT%...
    "%PGBIN%\pg_ctl.exe" -D "%PGDATA%" -o "-p %PGPORT%" -l "%ROOT%pgsql.log" start
    timeout /t 5 /nobreak >nul

    echo [2/2] Verifikasi PostgreSQL jalan...
    "%PGBIN%\pg_isready.exe" -h 127.0.0.1 -p %PGPORT%
    if errorlevel 1 (
        echo GAGAL: PostgreSQL tidak respond. Cek %ROOT%pgsql.log
        pause
        exit /b 1
    )
)

:: ============================================
:: Jalankan Laravel
:: ============================================
echo.
echo Menyalakan Laravel di http://127.0.0.1:8000...
cd /d "%APPDIR%"

start "PerpusKota Server" cmd /k "%PHPDIR%\php.exe artisan serve --host=0.0.0.0 --port=8000"

timeout /t 2 /nobreak >nul

echo.
echo ============================================
echo  PerpusKota jalan di: http://127.0.0.1:8000
echo ============================================
echo.
pause