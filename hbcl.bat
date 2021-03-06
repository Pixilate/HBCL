@echo off
:TYPE
Title = HB/CFW/LIB Compiler ...
cls
ECHO ..................................
ECHO . 3DS Homebrew/Lib/CFW Compiler Main Menu .
ECHO ..................................
ECHO.
ECHO A - Arm9loaderhax Menu
ECHO B - Custom Firmware Menu
ECHO C - Homebrew Menu
ECHO D - LIBs Menu
ECHO E - EXIT Program
ECHO.
choice /C ABCDE /M "Enter the letter of your choice:"
IF ERRORLEVEL 5 exit
IF ERRORLEVEL 4 GOTO LIBS
IF ERRORLEVEL 3 GOTO HB
IF ERRORLEVEL 2 GOTO CFW
IF ERRORLEVEL 1 GOTO A9LH

:A9LH
Title = A9LH ...
cls
ECHO .......................................................
ECHO . ARM9LOADERHAX Build Menu. Choose a fork to compile: .
ECHO .......................................................
ECHO.
ECHO A - Build Aurora's Fork
ECHO B - Build BootAnim9
ECHO C - Build BootCTR9
ECHO D - Build Delebile's Fork
ECHO E - Build Dark Samus's Fork
ECHO F - Build SafeA9LH
ECHO G - Return to Main Menu
ECHO H - EXIT Program
ECHO.
choice /C ABCDEFGH /M "Enter the letter of your choice:"
IF ERRORLEVEL 8 exit
IF ERRORLEVEL 7 GOTO TYPE
IF ERRORLEVEL 6 GOTO SAFE
IF ERRORLEVEL 5 GOTO SAMUS
IF ERRORLEVEL 4 GOTO DELEB
IF ERRORLEVEL 3 GOTO CTR9
IF ERRORLEVEL 2 GOTO ANIM9
IF ERRORLEVEL 1 GOTO AURORA

:CFW
Title = CFW ...
cls
ECHO ........................................................
ECHO . Custom Firmware Build Menu. Choose a CFW to compile: .
ECHO ........................................................
ECHO.
ECHO A - Build Cakes
ECHO B - Build Corbenik
ECHO C - Build Cosmo3DS
ECHO D - Build Luma3DS
ECHO E - Build r3Tools
ECHO F - Build ReiNAND
ECHO G - Build rxTools
ECHO H - Build SaltFW
ECHO I - Return to Main Menu
ECHO J - EXIT Program
ECHO.
choice /C ABCDEFGHIJ /M "Enter the letter of your choice:"
IF ERRORLEVEL 10 exit
IF ERRORLEVEL 9 GOTO TYPE
IF ERRORLEVEL 8 GOTO SALT
IF ERRORLEVEL 7 GOTO RXT
IF ERRORLEVEL 6 GOTO REI
IF ERRORLEVEL 5 GOTO R3T
IF ERRORLEVEL 4 GOTO LUMA
IF ERRORLEVEL 3 GOTO COSMO
IF ERRORLEVEL 2 GOTO CORBE
IF ERRORLEVEL 1 GOTO CAKES

:HB
Title = Homebrew ...
cls
ECHO ....................................................
ECHO . Homebrew Build Menu. Choose a source to compile: .
ECHO ....................................................
ECHO.
ECHO A - Build A9NC
ECHO B -Build Homebrew Launcher
ECHO C - Build CtrBootManager9
ECHO D - Build CIAngel
ECHO E - Build CTRXplorer
ECHO F - Build Decrypt9
ECHO G - Build Decrypt9UI
ECHO H - Build EmuNAND9
ECHO I - Build EmuNAND9UI
ECHO J - Build FBI
ECHO K - Build FTPD
ECHO L - Build GodMode9
ECHO M - Build Hourglass9
ECHO N - Build JK's Save Manager
ECHO O - Build OTPHelper
ECHO P - Build TIKdevil
ECHO Q - Return to Main Menu
ECHO R - EXIT Program
ECHO.
choice /C ABCDEFGHIJKLMNOPQ /M "Enter the letter of your choice:"
IF ERRORLEVEL 18 exit
IF ERRORLEVEL 17 GOTO TYPE
IF ERRORLEVEL 16 GOTO TIK
IF ERRORLEVEL 15 GOTO OTPH
IF ERRORLEVEL 14 GOTO JKSM
IF ERRORLEVEL 13 GOTO HG9
IF ERRORLEVEL 12 GOTO GM9
IF ERRORLEVEL 11 GOTO FTPD
IF ERRORLEVEL 10 GOTO FBI
IF ERRORLEVEL 9  GOTO E9UI
IF ERRORLEVEL 8  GOTO E9
IF ERRORLEVEL 7  GOTO D9UI
IF ERRORLEVEL 6  GOTO D9WIP
IF ERRORLEVEL 5  GOTO CTRX
IF ERRORLEVEL 4  GOTO ANGEL
IF ERRORLEVEL 3  GOTO CBM9
IF ERRORLEVEL 2  GOTO HBL
IF ERRORLEVEL 1  GOTO A9NC

:LIBS
Title =Libs ...
cls
ECHO ...............................................
ECHO . 3DS Library Build Menu. Choose a LIB build: .
ECHO ...............................................
ECHO.
ECHO A - Build Citro3D
ECHO B - Build Citrus
ECHO C - Build Libctru
ECHO D - Build Portlibs
ECHO E - Build Sf2dlib
ECHO F - Build Sftdlib
ECHO G - Return to Main Menu
ECHO H - EXIT Program
ECHO.
choice /C ABCDEFGH /M "Enter the letter of your choice:"
IF ERRORLEVEL 8 exit
IF ERRORLEVEL 7 GOTO TYPE
IF ERRORLEVEL 6 GOTO SFTDLIB
IF ERRORLEVEL 5 GOTO SF2DLIB
IF ERRORLEVEL 4 GOTO PORTLIB
IF ERRORLEVEL 3 GOTO LCTRU
IF ERRORLEVEL 2 GOTO CITRUS
IF ERRORLEVEL 1 GOTO CITRO3D

:AURORA
cls
Title = Building arm9loaderhax...
ECHO ...........................................................
ECHO . Aurora's A9LH Menu. Which Build do you want to compile? .
ECHO ...........................................................
ECHO.
ECHO A - Screeninit
ECHO B - No Screeninit
ECHO C - Return to Arm9loaderhax Menu
ECHO D - Return to Main Menu
ECHO E - EXIT Program
ECHO.
choice /C ABCDE /M "Enter the letter of your choice:"
IF ERRORLEVEL 5 exit
IF ERRORLEVEL 4 GOTO TYPE
IF ERRORLEVEL 3 GOTO A9LH
IF ERRORLEVEL 2 GOTO NOINIT
IF ERRORLEVEL 1 GOTO INIT

:INIT
cls
if exist "A9LH-AUR-init" (
	echo Making a backup of your current A9LH-AUR-init folder
	xcopy "A9LH-AUR-init\*" "Backups_Compiles\Backup_A9LH-AUR-init" /e /i /y >nul
	Timeout /t 1 /nobreak >nul
	ren A9LH-AUR-init arm9loaderhax
    cd arm9loaderhax
    Title = Building A9LH-AUR-init ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building A9LH-AUR-init ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/AuroraWright/arm9loaderhax.git
    cd arm9loaderhax
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building A9LH-AUR-init ^(Clean^)...
make clean
Title = Building A9LH-AUR-init ^(Release^)...
make
Title = Building A9LH-AUR-init ^(Done^)
echo.
echo ##################################################
color A
cd ..
ren arm9loaderhax A9LH-AUR-init
echo Done. Files are in the "A9LH-AUR-init/out" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:NOINIT
cls
if exist "A9LH-AUR-noinit" (
	echo Making a backup of your current arm9loaderhax folder
	xcopy "A9LH-AUR-noinit\*" "Backups_Compiles\Backup_A9LH-AUR-noinit" /e /i /y >nul
	Timeout /t 1 /nobreak >nul
	ren A9LH-AUR-noinit arm9loaderhax
    cd arm9loaderhax
    Title = Building A9LH-AUR-noinit ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building A9LH-AUR-noinit ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/AuroraWright/arm9loaderhax.git -b noscreeninit
    cd arm9loaderhax
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building A9LH-AUR-noinit ^(Clean^)...
make clean
Title = Building A9LH-AUR-noinit ^(Release^)...
make
Title = Building A9LH-AUR-noinit ^(Done^)
echo.
echo ####################################################
color A
cd ..
ren arm9loaderhax A9LH-AUR-noinit
echo Done. Files are in the "A9LH-AUR-noinit/out" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:ANIM9
cls
Title = Building BootAnim9...
if exist "BootAnim9" (
	echo Making a backup of your current BootAnim9 folder
	xcopy "BootAnim9\*" "Backups_Compiles\Backup_BootAnim9" /e /i /y >nul
    cd BootAnim9
    Title = Building BootAnim9 ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building BootAnim9 ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/Wolfvak/BootAnim9.git
    cd BootAnim9
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building BootAnim9 ^(Clean^)...
make clean
Title = Building BootAnim9 ^(Release^)...
make
Title = Building BootAnim9 ^(Done^)
echo.
echo #################################################
color A
cd ..
echo Done. arm9loaderhax is inside "BootAnim9" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:CTR9
cls
Title = Building BootCtr9...
if exist "BootCtr9" (
	echo Making a backup of your current BootCtr9 folder
	xcopy "BootCtr9\*" "Backups_Compiles\Backup_BootCtr9" /e /i /y >nul
    cd BootCtr9
    Title = Building BootCtr9 ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building BootCtr9 ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/hartmannaf/BootCtr9.git
    cd BootCtr9
)
:A9FCHECK1
Title = Building arm9loaderhax ^(Requirements^)...
cls
echo Please copy the following files to BootCtr9/data_input folder: && echo [new3ds10.firm] && echo [new3ds90.firm] && echo [secret_sector.bin] && echo [OTP.bin] && echo. && echo Press "Enter" to continue ...
Pause >nul
cls
echo Checking files.....
Timeout /t 1 /nobreak >nul
if exist data_input/new3ds10.firm (
echo new3ds10.firm file found
) else (
echo new3ds10.firm doesn't exist. && echo Please copy [new3ds10.firm] to BootCtr9/data_input folder. && echo Press "Enter" to continue ...
Pause >nul
GOTO A9FCHECK1
)
Timeout /t 1 /nobreak >nul
if exist data_input/new3ds90.firm (
echo new3ds90.firm file found
) else (
echo new3ds90.firm doesn't exist. && echo Please copy [new3ds90.firm] to BootCtr9/data_input folder. && echo Press "Enter" to continue ...
Pause >nul
GOTO A9FCHECK1
)
Timeout /t 1 /nobreak >nul
if exist data_input/secret_sector.bin (
echo secret_sector.bin file found
) else (
echo secret_sector.bin doesn't exist. && echo Please copy [secret_sector.bin] to BootCtr9/data_input folder. && echo Press "Enter" to continue ...
Pause >nul
GOTO A9FCHECK1
)
Timeout /t 1 /nobreak >nul
if exist data_input/OTP.bin (
echo OTP.bin file found
) else (
echo OTP.bin doesn't exist. && echo Please copy [OTP.bin] to BootCtr9/data_input folder. && echo Press "Enter" to continue ...
Pause >nul
GOTO A9FCHECK1
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building BootCtr9 ^(Clean^)...
make clean
Title = Building BootCtr9 ^(Release^)...
make
Title = Building BootCtr9 ^(Done^)
echo.
echo #####################################################
color A
cd ..
echo Done. Files are in the "BootCtr9/data_output" folder. && echo Press "Enter" to continue ...
Pause >nul
GOTO END

:DELEB
cls
Title = Building arm9loaderhax...
if exist "Delebile-A9LH" (
	echo Making a backup of your current Delebile-A9LH folder
	xcopy "Delebile-A9LH\*" "Backups_Compiles\Backup_Delebile-A9LH" /e /i /y >nul
	Timeout /t 1 /nobreak >nul
	ren Delebile-A9LH arm9loaderhax
    cd arm9loaderhax
    Title = Building arm9loaderhax ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building arm9loaderhax ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/delebile/arm9loaderhax.git
    cd arm9loaderhax
)
:A9FCHECK2
Title = Building arm9loaderhax ^(Requirements^)...
cls
echo Please copy the following files to arm9loaderhax/data_input folder: && echo [new3ds10.firm] && echo [new3ds90.firm] && echo [secret_sector.bin] && echo [OTP.bin] && echo. && echo Press "Enter" to continue ...
Pause >nul
cls
echo Checking files.....
Timeout /t 1 /nobreak >nul
if exist data_input/new3ds10.firm (
echo new3ds10.firm file found
) else (
echo new3ds10.firm doesn't exist. && echo Please copy [new3ds10.firm] to arm9loaderhax/data_input folder. && echo Press "Enter" to continue ...
Pause >nul
GOTO A9FCHECK2
)
Timeout /t 1 /nobreak >nul
if exist data_input/new3ds90.firm (
echo new3ds90.firm file found
) else (
echo new3ds90.firm doesn't exist. && echo Please copy [new3ds90.firm] to arm9loaderhax/data_input folder. && echo Press "Enter" to continue ...
Pause >nul
GOTO A9FCHECK2
)
Timeout /t 1 /nobreak >nul
if exist data_input/secret_sector.bin (
echo secret_sector.bin file found
) else (
echo secret_sector.bin doesn't exist. && echo Please copy [secret_sector.bin] to arm9loaderhax/data_input folder. && echo Press "Enter" to continue ...
Pause >nul
GOTO A9FCHECK2
)
Timeout /t 1 /nobreak >nul
if exist data_input/OTP.bin (
echo OTP.bin file found
) else (
echo OTP.bin doesn't exist. && echo Please copy [OTP.bin] to arm9loaderhax/data_input folder. && echo Press "Enter" to continue ...
Pause >nul
GOTO A9FCHECK2
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building arm9loaderhax ^(Clean^)...
make clean
Title = Building arm9loaderhax ^(Release^)...
make
Title = Building arm9loaderhax ^(Done^)
echo.
echo ##########################################################
color A
cd ..
ren arm9loaderhax Delebile-A9LH
echo Done. Files are in the "Delebile-A9LH/data_output" folder.
Pause >nul
GOTO END

:SAMUS
cls
Title = Building Samus-A9LH...
if exist "Samus-A9LH" (
	echo Making a backup of your current Samus-A9LH folder
	xcopy "Samus-A9LH\*" "Backups_Compiles\Backup_Samus-A9LH" /e /i /y >nul
	Timeout /t 1 /nobreak >nul
	ren Samus-A9LH arm9loaderhax
    cd arm9loaderhax
    Title = Building arm9loaderhax ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building arm9loaderhax ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/dark-samus/arm9loaderhax
    cd arm9loaderhax
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building arm9loaderhax ^(Clean^)...
make clean
Title = Building arm9loaderhax ^(Release^)...
make
Title = Building arm9loaderhax ^(Done^)
echo.
echo #######################################################
color A
cd ..
ren arm9loaderhax Samus-A9LH
echo Done. Files are in the "Samus-A9LH/data_output" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:SAFE
cls
Title = Building SafeA9LHInstaller...
if exist "SafeA9LHInstaller" (
	echo Making a backup of your current SafeA9LHInstaller folder
	xcopy "SafeA9LHInstaller\*" "Backups_Compiles\Backup_SafeA9LHInstaller" /e /i /y >nul
    cd SafeA9LHInstaller
    Title = Building SafeA9LHInstaller ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building SafeA9LHInstaller ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/AuroraWright/SafeA9LHInstaller
    cd SafeA9LHInstaller
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building SafeA9LHInstaller ^(Clean^)...
make clean
Title = Building SafeA9LHInstaller ^(Release^)...
make
Title = Building SafeA9LHInstaller ^(Done^)
echo.
echo ######################################################
color A
cd ..
echo Done. Files are in the "SafeA9LHInstaller/out" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:CAKES
cls
Title = Building Cakes...
if exist "CakesForeveryWan" (
	echo Making a backup of your current CakesForeveryWan folder
	xcopy "CakesForeveryWan\*" "Backups_Compiles\Backup_Cakes" /e /i /y >nul
    cd CakesForeveryWan
    Title = Building Cakes ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building Cakes ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/mid-kid/CakesForeveryWan.git
    cd CakesForeveryWan
)
set PATH=c:\Python3\;%PATH%
echo Building...
Title = Building Cakes ^(Clean^)...
make clean
Title = Building Cakes ^(Release^)...
make release
Title = Building Cakes ^(Done^)
echo.
echo #####################################################
color A
copy build\main.bin out\
ren out\main.bin arm9loaderhax.bin
cd ..
echo Done. Files are in the "CakesForeveryWan/out" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:CORBE
cls
Title = Building corbenik...
if exist "corbenik" (
	echo Making a backup of your current corbenik folder
	xcopy "corbenik\*" "Backups_Compiles\Backup_corbenik" /e /i /y >nul
    cd corbenik
    Title = Building corbenik ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building corbenik ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/chaoskagami/corbenik.git
    cd corbenik
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building corbenik ^(Clean^)...
make clean
Title = Building corbenik ^(Release^)...
make
Title = Building corbenik ^(Done^)
echo.
echo #############################################
color A
cd ..
echo Done. Files are in the "corbenik/out" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:COSMO
cls
Title = Building Cosmo3DS...
if exist "Cosmo3DS" (
	echo Making a backup of your current Cosmo3DS folder
	xcopy "Cosmo3DS\*" "Backups_Compiles\Backup_Cosmo3DS" /e /i /y >nul
    cd Cosmo3DS
    Title = Building Cosmo3DS ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building Cosmo3DS ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/yifanlu/Cosmo3DS.git
    cd Cosmo3DS
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building Cosmo3DS ^(Clean^)...
make clean
Title = Building Cosmo3DS ^(Release^)...
make
Title = Building Cosmo3DS ^(Done^)
echo.
echo #############################################
color A
cd ..
echo Done. Files are in the "Cosmo3DS/out" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:LUMA
cls
Title = Building Luma3DS...
ECHO ..........................................................
ECHO . Luma3DS CFW Menu. Which branch do you want to compile? .
ECHO ..........................................................
ECHO.
ECHO A - User
ECHO B - Dev
ECHO C - Return to Custom Firmware Menu
ECHO D - Return to Main Menu
ECHO E - EXIT Program
ECHO.
choice /C ABCDE /M "Enter the letter of your choice:"
IF ERRORLEVEL 5 exit
IF ERRORLEVEL 4 GOTO TYPE
IF ERRORLEVEL 3 GOTO CFW
IF ERRORLEVEL 2 GOTO LUMADEV
IF ERRORLEVEL 1 GOTO LUMAUSER

:LUMAUSER
cls
if exist "Luma3DS-USER" (
	echo Making a backup of your current Luma3DS-USER folder
	xcopy "Luma3DS-USER\*" "Backups_Compiles\Backup_Luma3DS-USER" /e /i /y >nul
	Timeout /t 1 /nobreak >nul
	ren Luma3DS-USER Luma3DS
    cd Luma3DS
    Title = Building Luma3DS-USER ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building Luma3DS-USER ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/AuroraWright/Luma3DS.git
    cd Luma3DS
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building Luma3DS-USER ^(Clean^)...
make clean
Title = Building Luma3DS-USER ^(Release^)...
make release
Title = Building Luma3DS-USER ^(Done^)
echo.
echo #################################################
color A
cd ..
ren Luma3DS Luma3DS-USER
echo Done. Files are in the "Luma3DS-USER/out" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:LUMADEV
cls
if exist "Luma3DS-DEV" (
	echo Making a backup of your current Luma3DS-DEV folder
	xcopy "Luma3DS-DEV\*" "Backups_Compiles\Backup_Luma3DS-DEV" /e /i /y >nul
	Timeout /t 1 /nobreak >nul
	ren Luma3DS-DEV Luma3DS
    cd Luma3DS
    Title = Building Luma3DS-DEV ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building Luma3DS-DEV ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/AuroraWright/Luma3DS.git
    cd Luma3DS
    git checkout developer
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building Luma3DS-DEV ^(Clean^)...
make clean
Title = Building Luma3DS-DEV ^(Release^)...
make release
Title = Building Luma3DS-DEV ^(Done^)
echo.
echo ################################################
color A
cd ..
ren Luma3DS Luma3DS-DEV
echo Done. Files are in the "Luma3DS-DEV/out" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:R3T
cls
Title = Building r3Tools...
if exist "r3Tools" (
	echo Making a backup of your current r3Tools folder
	xcopy "r3Tools\*" "Backups_Compiles\Backup_r3Tools" /e /i /y >nul
    cd r3Tools
    Title = Building r3Tools ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building r3Tools ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/173210/r3Tools.git
    cd r3Tools
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building r3Tools ^(Clean^)...
make clean
Title = Building r3Tools ^(Release^)...
make release
Title = Building r3Tools ^(Done^)
echo.
echo ################################################
color A
cd ..
echo Done. Files are in the "r3Tools/release" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:REI
cls
Title = Building ReiNand...
ECHO ..........................................................
ECHO . ReiNand CFW Menu. Which branch do you want to compile? .
ECHO ..........................................................
ECHO.
ECHO A - O3DS
ECHO B - N3DS
ECHO C - Return to Custom Firmware Menu
ECHO D - Return to Main Menu
ECHO E - EXIT Program
ECHO.
choice /C ABCDE /M "Enter the letter of your choice:"
IF ERRORLEVEL 5 exit
IF ERRORLEVEL 4 GOTO TYPE
IF ERRORLEVEL 3 GOTO CFW
IF ERRORLEVEL 2 GOTO REIN3DS
IF ERRORLEVEL 1 GOTO REIO3DS

:REIO3DS
cls
if exist "ReiNand-O3DS" (
	echo Making a backup of your current ReiNand-O3DS folder
	xcopy "ReiNand-O3DS\*" "Backups_Compiles\Backup_ReiNand-O3DS" /e /i /y >nul
	Timeout /t 1 /nobreak >nul
	ren ReiNand-O3DS ReiNand
    cd ReiNand
    Title = Building ReiNand-O3DS ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building ReiNand-O3DS ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/Reisyukaku/ReiNand.git
    cd ReiNand
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building ReiNand-O3DS ^(Clean^)...
make clean
Title = Building ReiNand-O3DS ^(Release^)...
make cons=o3ds
Title = Building ReiNand-O3DS ^(Done^)
echo.
echo #################################################
color A
cd ..
ren ReiNand ReiNand-O3DS
echo Done. Files are in the "ReiNand-O3DS/out" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:REIN3DS
cls
if exist "ReiNand-N3DS" (
	echo Making a backup of your current ReiNand-N3DS folder
	xcopy "ReiNand-N3DS\*" "Backups_Compiles\Backup_ReiNand-N3DS" /e /i /y >nul
	Timeout /t 1 /nobreak >nul
	ren ReiNand-N3DS ReiNand
    cd ReiNand
    Title = Building ReiNand-N3DS ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building ReiNand-N3DS ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/Reisyukaku/ReiNand.git
    cd ReiNand
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building ReiNand-N3DS ^(Clean^)...
make clean
Title = Building ReiNand-N3DS ^(Release^)...
make cons=n3ds
Title = Building ReiNand-N3DS ^(Done^)
echo.
echo #################################################
color A
cd ..
ren ReiNand ReiNand-N3DS
echo Done. Files are in the "ReiNand-N3DS/out" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:RXT
cls
Title = Building rxTools...
ECHO .........................................................
ECHO . rxTools CFW Menu. Which build do you want to compile? .
ECHO .........................................................
ECHO.
ECHO A - Main Build
ECHO B - A9LH Build
ECHO C - duke_srg's Fork
ECHO D - Return to Custom Firmware Menu
ECHO E - Return to Main Menu
ECHO F - EXIT Program
ECHO.
choice /C ABCDEF /M "Enter the letter of your choice:"
IF ERRORLEVEL 6 exit
IF ERRORLEVEL 5 GOTO TYPE
IF ERRORLEVEL 4 GOTO CFW
IF ERRORLEVEL 3 GOTO RXDUKESRG
IF ERRORLEVEL 2 GOTO RXA9LH
IF ERRORLEVEL 1 GOTO RXMAIN

:RXMAIN
cls
if exist "rxTools-Main" (
	echo Making a backup of your current rxTools-Main folder
	xcopy "rxTools-Main\*" "Backups_Compiles\Backup_rxTools-Main" /e /i /y >nul
	Timeout /t 2 /nobreak >nul
	ren rxTools-Main rxTools
    cd rxTools
    Title = Building rxTools-Main ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building rxTools-Main ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/roxas75/rxTools
    cd rxTools
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building rxTools-Main ^(Clean^)...
make clean
Title = Building rxTools-Main ^(Release^)...
make release
Title = Building rxTools-Main ^(Done^)
echo.
echo #####################################################
color A
cd ..
ren rxTools rxTools-Main
echo Done. Files are in the "rxTools-Main/release" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:RXA9LH
cls
if exist "rxTools-A9LH" (
	echo Making a backup of your current rxTools-A9LH folder
	xcopy "rxTools-A9LH\*" "Backups_Compiles\Backup_rxTools-A9LH" /e /i /y >nul
	Timeout /t 2 /nobreak >nul
	ren rxTools-A9LH rxTools
    cd rxTools
    Title = Building rxTools-A9LH ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building rxTools-A9LH ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/roxas75/rxTools.git -b arm9loaderhax
    cd rxTools
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building rxTools-A9LH ^(Clean^)...
make clean
Title = Building rxTools-A9LH ^(Release^)...
make release
Title = Building rxTools-A9LH ^(Done^)
echo.
echo #####################################################
color A
cd ..
ren rxTools rxTools-A9LH
echo Done. Files are in the "rxTools-A9LH/release" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:RXDUKESRG
cls
if exist "rxTools-DUKESRG" (
	echo Making a backup of your current rxTools-DUKESRG folder
	xcopy "rxTools-DUKESRG\*" "Backups_Compiles\Backup_rxTools-DUKESRG" /e /i /y >nul
	Timeout /t 2 /nobreak >nul
	ren rxTools-DUKESRG rxTools
    cd rxTools
    Title = Building rxTools-DUKESRG ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building rxTools-DUKESRG ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/dukesrg/rxTools.git
    cd rxTools
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building rxTools-DUKESRG ^(Clean^)...
make clean
Title = Building rxTools-DUKESRG ^(Release^)...
make release
Title = Building rxTools-DUKESRG ^(Done^)
echo.
echo ########################################################
color A
cd ..
ren rxTools rxTools-DUKESRG
echo Done. Files are in the "rxTools-DUKESRG/release" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:SALT
cls
Title = Building SaltFW...
if exist "SaltFW" (
	echo Making a backup of your current SaltFW folder
	xcopy "SaltFW\*" "Backups_Compiles\Backup_SaltFW" /e /i /y >nul
    cd SaltFW
    Title = Building SaltFW ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building SaltFW ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/RShadowhand/SaltFW.git
    cd SaltFW
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building SaltFW ^(Clean^)...
make clean
Title = Building SaltFW ^(Release^)...
make
Title = Building SaltFW ^(Done^)
echo.
echo ###########################################
color A
cd ..
echo Done. Files are in the "SaltFW/out" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:A9NC
cls
Title = Building A9NC...
if exist "A9NC" (
	echo Making a backup of your current A9NC folder
	xcopy "A9NC\*" "Backups_Compiles\Backup_A9NC" /e /i /y >nul
    cd A9NC
    Title = Building A9NC ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building A9NC ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/d0k3/A9NC.git
    cd A9NC
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building A9NC ^(Clean^)...
make clean
Title = Building A9NC ^(Release^)...
make
Title = Building A9NC ^(Done^)
echo.
echo ############################################
color A
cd ..
echo Done. Files are in the "A9NC/output" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:CBM9
cls
Title = Building CtrBootManager...
if exist "CtrBootManager" (
	echo Making a backup of your current CtrBootManager folder
	xcopy "CtrBootManager\*" "Backups_Compiles\Backup_CtrBootManager" /e /i /y >nul
    cd CtrBootManager
    Title = Building CtrBootManager ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building CtrBootManager ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/Cpasjuste/CtrBootManager.git -b a9lh
    cd CtrBootManager
)
mkdir build release
cd build
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building CtrBootManager ^(Clean^)...
make clean
Title = Building CtrBootManager ^(Stage 1^)...
cmake -DCMAKE_TOOLCHAIN_FILE=../DevkitARM3DS.cmake ../ -G "MSYS Makefiles"
Title = Building CtrBootManager ^(Stage 2^)...
cmake -DCMAKE_TOOLCHAIN_FILE=../DevkitARM3DS.cmake ../ -G "MSYS Makefiles"
Title = Building CtrBootManager ^(Stage 3^)...
cmake --build . --target CtrBootManager_a9lh
Title = Building CtrBootManager ^(Done^)
echo.
echo #######################################################
color A
cd ..
copy data\a9lh.cfg release\
copy build\CtrBootManager9.bin release\
ren release\CtrBootManager9.bin arm9loaderhax.bin
cd ..
echo Done. Files are in the "CtrBootManager/release" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:ANGEL
cls
Title = Building CIAngel...
if exist "CIAngel" (
	echo Making a backup of your current CIAngel source folder
	xcopy "CIAngel\*" "Backups_Compiles\Backup_CIAngel" /e /i /y >nul
    cd CIAngel
    Title = Building CIAngel ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building CIAngel ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/llakssz/CIAngel.git
    cd CIAngel
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building CIAngel ^(Clean^)...
make clean
Title = Building CIAngel ^(Release^)...
make
Title = Building CIAngel ^(Done^)
echo.
echo ###############################################
color A
cd ..
echo Done. Files are in the "CIAngel/output" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:CTRX
cls
Title = Building CTRXplorer...
if exist "CTRXplorer" (
	echo Making a backup of your current CTRXplorer folder
	xcopy "CTRXplorer\*" "Backups_Compiles\Backup_CTRXplorer" /e /i /y >nul
    cd CTRXplorer
    Title = Building CTRXplorer ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building CTRXplorer ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/d0k3/CTRXplorer.git
    cd CTRXplorer
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building CTRXplorer ^(Clean^)...
make clean
Title = Building CTRXplorer ^(Release^)...
make
Title = Building CTRXplorer ^(Done^)
echo.
echo ##################################################
color A
cd ..
echo Done. Files are in the "CTRXplorer/output" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:D9WIP
cls
Title = Building Decrypt9WIP...
if exist "Decrypt9WIP" (
	echo Making a backup of your current Decrypt9WIP folder
	xcopy "Decrypt9WIP\*" "Backups_Compiles\Backup_Decrypt9WIP" /e /i /y >nul
    cd Decrypt9WIP
    Title = Building Decrypt9WIP ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building Decrypt9WIP ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/d0k3/Decrypt9WIP.git
    cd Decrypt9WIP
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building Decrypt9WIP ^(Clean^)...
make clean
Title = Building Decrypt9WIP ^(Release^)...
make release
Title = Building Decrypt9WIP ^(Done^)
echo.
echo ####################################################
color A
cd ..
echo Done. Files are in the "Decrypt9WIP/release" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:D9UI
cls
Title = Building Decrypt9UI...
if exist "Decrypt9UI" (
	echo Making a backup of your current Decrypt9 folder
	xcopy "Decrypt9UI\*" "Backups_Compiles\Backup_Decrypt9UI" /e /i /y >nul
	Timeout /t 1 /nobreak >nul
	ren Decrypt9UI Decrypt9
    cd Decrypt9
    Title = Building Decrypt9UI ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building Decrypt9UI ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/Shadowtrance/Decrypt9.git
    cd Decrypt9
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building Decrypt9UI ^(Clean^)...
make clean
Title = Building Decrypt9UI ^(Release^)...
make release
Title = Building Decrypt9UI ^(Done^)
echo.
echo ###################################################
color A
cd ..
ren Decrypt9 Decrypt9UI
echo Done. Files are in the "Decrypt9UI/release" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:E9
cls
Title = Building EmuNAND-9...
if exist "EmuNAND-9" (
	echo Making a backup of your current EmuNAND-9 folder
	xcopy "EmuNAND-9\*" "Backups_Compiles\Backup_EmuNAND-9" /e /i /y >nul
	Timeout /t 1 /nobreak >nul
	ren EmuNAND-9 EmuNAND9
    cd EmuNAND9
    Title = Building EmuNAND-9 ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building EmuNAND-9 ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/d0k3/EmuNAND9.git
    cd EmuNAND9
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building EmuNAND-9 ^(Clean^)...
make clean
Title = Building EmuNAND-9 ^(Release^)...
make release
Title = Building EmuNAND-9 ^(Done^)
echo.
echo #################################################
color A
cd ..
ren EmuNAND9 EmuNAND-9
echo Done. Files are in the "EmuNAND-9/release" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:E9UI
cls
Title = Building EmuNAND9UI...
if exist "EmuNAND9UI" (
	echo Making a backup of your current EmuNAND9UI folder
	xcopy "EmuNAND9UI\*" "Backups_Compiles\Backup_EmuNAND9UI" /e /i /y >nul
	Timeout /t 1 /nobreak >nul
	ren EmuNAND9UI EmuNAND9
    cd EmuNAND9
    Title = Building EmuNAND9UI ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building EmuNAND9UI ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/Shadowtrance/EmuNAND9.git
    cd EmuNAND9
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building EmuNAND9UI ^(Clean^)...
make clean
Title = Building EmuNAND9UI ^(Release^)...
make release
Title = Building EmuNAND9UI ^(Done^)
echo.
echo ###################################################
color A
cd ..
ren EmuNAND9 EmuNAND9UI
echo Done. Files are in the "EmuNAND9UI/release" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:FBI
cls
Title = Building FBI...
if exist "FBI" (
	echo Making a backup of your current FBI folder
	xcopy "FBI\*" "Backups_Compiles\Backup_FBI" /e /i /y >nul
    cd FBI
    Title = Building FBI ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building FBI ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/Steveice10/FBI.git
    cd FBI
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building FBI ^(Clean^)...
make clean
Title = Building FBI ^(Release^)...
make
Title = Building FBI ^(Done^)
echo.
echo ####################################
color A
cd ..
echo Done. Files are in the "FBI" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:FTPD
cls
Title = Building FTPD...
if exist "FTPD" (
	echo Making a backup of your current FTPD folder
	xcopy "FTPD\*" "Backups_Compiles\Backup_FTPD" /e /i /y >nul
    cd FTPD
    Title = Building FTPD ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building FTPD ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/mtheall/ftpd.git
    cd FTPD
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building FTPD ^(Clean^)...
make clean
Title = Building FTPD ^(Release^)...
make all
make cia
Title = Building FTPD ^(Done^)
echo.
echo #####################################
color A
cd ..
echo Done. Files are in the "FTPD" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:GM9
cls
Title = Building GodMode9...
if exist "GodMode9" (
	echo Making a backup of your current GodMode9 folder
	xcopy "GodMode9\*" "Backups_Compiles\Backup_GodMode9" /e /i /y >nul
    cd GodMode9
    Title = Building GodMode9 ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building GodMode9 ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/d0k3/GodMode9.git
    cd GodMode9
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building GodMode9 ^(Clean^)...
make clean
Title = Building GodMode9 ^(Release^)...
make release
Title = Building GodMode9 ^(Done^)
echo.
echo #################################################
color A
cd ..
echo Done. Files are in the "GodMode9/release" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:HG9
cls
Title = Building Hourglass9...
if exist "Hourglass9" (
	echo Making a backup of your current Hourglass9 folder
	xcopy "Hourglass9\*" "Backups_Compiles\Backup_Hourglass9" /e /i /y >nul
    cd Hourglass9
    Title = Building Hourglass9 ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building Hourglass9 ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/d0k3/Hourglass9.git
    cd Hourglass9
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building Hourglass9 ^(Clean^)...
make clean
Title = Building Hourglass9 ^(Release^)...
make release
Title = Building Hourglass9 ^(Done^)
echo.
echo #################################################
color A
cd ..
echo Done. Files are in the "Hourglass9/release" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:JKSM
cls
Title = Building JKSM...
if exist "JKSM" (
	echo Making a backup of your current JKSM folder
	xcopy "JKSM\*" "Backups_Compiles\Backup_JKSM" /e /i /y >nul
    cd JKSM
    Title = Building JKSM ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building JKSM ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/J-D-K/JKSM.git
    cd JKSM
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building JKSM ^(Clean^)...
make clean
Title = Building JKSM ^(Release^)...
make cia
Title = Building JKSM ^(Done^)
echo.
echo #################################################
color A
cd ..
echo Done. Files are in the "JKSM" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:OTPH
cls
Title = Building OTPHelper...
if exist "OTPHelper" (
	echo Making a backup of your current OTPHelper folder
	xcopy "OTPHelper\*" "Backups_Compiles\Backup_OTPHelper" /e /i /y >nul
    cd OTPHelper
    Title = Building OTPHelper ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building OTPHelper ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/d0k3/OTPHelper.git
    cd OTPHelper
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building OTPHelper ^(Clean^)...
make clean
Title = Building OTPHelper ^(Release^)...
make release
Title = Building OTPHelper ^(Done^)
echo.
echo ##################################################
color A
cd ..
echo Done. Files are in the "OTPHelper/release" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:TIK
cls
Title = Building TIKdevil...
if exist "TIKdevil" (
	echo Making a backup of your current TIKdevil folder
	xcopy "TIKdevil\*" "Backups_Compiles\Backup_TIKdevil" /e /i /y >nul
    cd TIKdevil
    Title = Building TIKdevil ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building TIKdevil ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/mmcx125/TIKdevil.git
    cd TIKdevil
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building TIKdevil ^(Clean^)...
make clean
Title = Building TIKdevil ^(Release^)...
make
Title = Building TIKdevil ^(Done^)
echo.
echo #################################################
color A
cd ..
echo Done. Files are in the "TIKdevil/output" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:CITRO3D
cls
Title = Building citro3d...
ECHO .............................................................
ECHO . Citro3D LIB Menu. Do you want to install or compile only? .
ECHO .............................................................
ECHO.
ECHO A - Install Citro3D
ECHO B - Compile Citro3D
ECHO C - Return to LIBs Menu
ECHO D - Return to Main Menu
ECHO E - EXIT Program
ECHO.
choice /C ABCDE /M "Enter the letter of your choice:"
IF ERRORLEVEL 5 exit
IF ERRORLEVEL 4 GOTO TYPE
IF ERRORLEVEL 3 GOTO LIBS
IF ERRORLEVEL 2 GOTO CITROCOMP
IF ERRORLEVEL 1 GOTO CITROINST

:CITROINST
cls
if exist "citro3d" (
	echo Making a backup of your current citro3d source folder
	xcopy "citro3d\*" "Backups_Compiles\Backup_citro3d" /e /i /y >nul
	cd citro3d
    Title = Building citro3d ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building citro3d ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/fincs/citro3d.git
    cd citro3d
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building citro3d ^(Clean^)...
make clean
Title = Building citro3d ^(Release^)...
make install
Title = Building citro3d ^(Done^)
echo.
echo ################################################################
color A
cd ..
echo Done. citro3d is installed in the "c:/devkitpro/libctru" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:CITROCOMP
cls
if exist "citro3d" (
	echo Making a backup of your current citro3d source folder
	xcopy "citro3d\*" "Backups_Compiles\Backup_citro3d" /e /i /y >nul
	cd citro3d
    Title = Building citro3d ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building citro3d ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/fincs/citro3d.git
    cd citro3d
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building citro3d ^(Clean^)...
make clean
Title = Building citro3d ^(Release^)...
make
Title = Building citro3d ^(Done^)
echo.
echo ########################################
color A
cd ..
echo Done. Files are in the "citro3d" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:CITRUS
cls
Title = Building citrus...
ECHO ............................................................
ECHO . Citrus LIB Menu. Do you want to install or compile only? .
ECHO ............................................................
ECHO.
ECHO A - Install Citrus
ECHO B - Compile Citrus
ECHO C - Return to LIBs Menu
ECHO D - Return to Main Menu
ECHO E - EXIT Program
ECHO.
choice /C ABCDE /M "Enter the letter of your choice:"
IF ERRORLEVEL 5 exit
IF ERRORLEVEL 4 GOTO TYPE
IF ERRORLEVEL 3 GOTO LIBS
IF ERRORLEVEL 2 GOTO CITRUSCOMP
IF ERRORLEVEL 1 GOTO CITRUSINST

:CITRUSINST
cls
if exist "citrus" (
	echo Making a backup of your current citrus source folder
	xcopy "citrus\*" "Backups_Compiles\Backup_citrus" /e /i /y >nul
	cd citrus
    Title = Building citrus ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building citrus ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/Steveice10/citrus.git
    cd citrus
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building citrus ^(Clean^)...
make clean
Title = Building citrus ^(Release^)...
make install
Title = Building citrus ^(Done^)
echo.
echo #######################################################
color A
cd ..
echo Done. Citrus is installed in the "c:/devkitpro" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:CITRUSCOMP
cls
if exist "citrus" (
	echo Making a backup of your current citrus source folder
	xcopy "citrus\*" "Backups_Compiles\Backup_citrus" /e /i /y >nul
	cd citrus
    Title = Building citrus ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building citrus ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/Steveice10/citrus.git
    cd citrus
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building citrus ^(Clean^)...
make clean
Title = Building citrus ^(Release^)...
make
Title = Building citrus ^(Done^)
echo.
echo ##############################################
color A
cd ..
echo Done. Files are in the "citrus/output" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:LCTRU
cls
Title = Building ctrulib...
ECHO ..............................................
ECHO . CTRULIB LIB Menu. Please choose your fork: .
ECHO ..............................................
ECHO.
ECHO A - Smealum's Fork
ECHO B - Return to LIBs Menu
ECHO C - Return to Main Menu
ECHO D - EXIT Program
ECHO.
choice /C ABCDE /M "Enter the letter of your choice:"
IF ERRORLEVEL 4 exit
IF ERRORLEVEL 3 GOTO TYPE
IF ERRORLEVEL 2 GOTO LIBS
IF ERRORLEVEL 1 GOTO SMEA

:SMEA
cls
Title = Building Smealum's Ctrulib...
ECHO ...................................................................
ECHO . Smealum's LIBCTRU Menu. Do you want to install or compile only? .
ECHO ...................................................................
ECHO.
ECHO A - Install Smealum's Latest LIBCTRU
ECHO B - Compile Smealum's Latest LIBCTRU
ECHO C - Install a Specific Commit of Smealum's LIBCTRU
ECHO D - Compile a Specific Commit of Smealum's LIBCTRU
ECHO E - Return to CTRULIB's Menu
ECHO F - Return to LIBs Menu
ECHO G - Return to Main Menu
ECHO H - EXIT Program
ECHO.
choice /C ABCDEFGH /M "Enter the letter of your choice:"
IF ERRORLEVEL 8 exit
IF ERRORLEVEL 7 GOTO TYPE
IF ERRORLEVEL 6 GOTO LIBS
IF ERRORLEVEL 5 GOTO LCTRU
IF ERRORLEVEL 4 GOTO COMMITCOMP
IF ERRORLEVEL 3 GOTO COMMITINST
IF ERRORLEVEL 2 GOTO LIBCOMP
IF ERRORLEVEL 1 GOTO LIBINST

:LIBINST
cls
if exist "Smea-ctrulib" (
	echo Making a backup of your current Smea-ctrulib source folder
	xcopy "Smea-ctrulib\*" "Backups_Compiles\Backup_Smea-ctrulib" /e /i /y >nul
	Timeout /t 1 /nobreak >nul
	ren Smea-ctrulib ctrulib
    cd ctrulib
    Title = Building Smea-ctrulib ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building Smea-ctrulib ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/smealum/ctrulib.git
    cd ctrulib
)
echo Building...
cd libctru
set PATH=c:\Python27\;%PATH%
Title = Building libctru ^(Clean^)...
make clean
Title = Building libctru ^(Release^)...
make install
Title = Building libctru ^(Done^)
echo.
echo ########################################################
color A
cd ..
cd ..
ren ctrulib Smea-ctrulib
echo Done. Libctru is installed in the "c:/devkitpro" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:LIBCOMP
cls
if exist "Smea-ctrulib" (
	echo Making a backup of your current Smea-ctrulib source folder
	xcopy "Smea-ctrulib\*" "Backups_Compiles\Backup_Smea-ctrulib" /e /i /y >nul
	Timeout /t 1 /nobreak >nul
	ren Smea-ctrulib ctrulib
    cd ctrulib
    Title = Building Smea-ctrulib ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building Smea-ctrulib ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/smealum/ctrulib.git
    cd ctrulib
)
echo Building...
cd libctru
set PATH=c:\Python27\;%PATH%
Title = Building libctru ^(Clean^)...
make clean
Title = Building libctru ^(Release^)...
make
Title = Building libctru ^(Done^)
echo.
echo #####################################################
color A
cd ..
cd ..
ren ctrulib Smea-ctrulib
echo Done. Files are in the "Smea-ctrulib/libctru" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:COMMITINST
cls
if exist "ctrulib-commit" (
	echo Making a backup of your current ctrulib-commit source folder
	xcopy "ctrulib-commit\*" "Backups_Compiles\Backup_ctrulib-commit" /e /i /y >nul
	Timeout /t 1 /nobreak >nul
	ren ctrulib-commit ctrulib
    cd ctrulib
    Title = Building ctrulib-commit ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building ctrulib-commit ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/smealum/ctrulib.git
    cd ctrulib
)
cls
set /p commit1="Please type the commit number you would like to install: "
echo.
git checkout %commit1%
echo Building...
cd libctru
set PATH=c:\Python27\;%PATH%
Title = Building libctru ^(Clean^)...
make clean
Title = Building libctru ^(Release^)...
make install
Title = Building libctru ^(Done^)
echo.
echo ########################################################
color A
cd ..
cd ..
ren ctrulib ctrulib-commit
echo Done. Libctru is installed in the "c:/devkitpro" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:COMMITCOMP
cls
if exist "ctrulib-commit" (
	echo Making a backup of your current ctrulib-commit source folder
	xcopy "ctrulib-commit\*" "Backups_Compiles\Backup_ctrulib-commit" /e /i /y >nul
	Timeout /t 1 /nobreak >nul
	ren ctrulib-commit ctrulib
    cd ctrulib
    Title = Building ctrulib-commit ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building ctrulib-commit ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/smealum/ctrulib.git
    cd ctrulib
)
cls
set /p commit2="Please type the commit number you would like to compile: "
echo.
git checkout %commit2%
echo Building...
cd libctru
set PATH=c:\Python27\;%PATH%
Title = Building libctru ^(Clean^)...
make clean
Title = Building libctru ^(Release^)...
make
Title = Building libctru ^(Done^)
echo.
echo #######################################################
color A
cd ..
cd ..
ren ctrulib ctrulib-commit
echo Done. Files are in the "ctrulib-commit/libctru" folder. && echo Press any key to continue ...
Pause >nul
GOTO END


:PORTLIB
cls
Title = Building Portlibs...
ECHO ..........................................
ECHO . Portlibs LIB Menu. Please select a lib .
ECHO ..........................................
ECHO.
ECHO A - Zlib
ECHO B - FreeType2
ECHO C - LibPNG
ECHO D - Return to LIBs Menu
ECHO E - Return to Main Menu
ECHO F - EXIT Program
ECHO.
choice /C ABCDEF /M "Enter the letter of your choice:"
IF ERRORLEVEL 6 exit
IF ERRORLEVEL 5 GOTO TYPE
IF ERRORLEVEL 4 GOTO LIBS
IF ERRORLEVEL 3 GOTO LIBPNG
IF ERRORLEVEL 2 GOTO FREETYPE
IF ERRORLEVEL 1 GOTO ZLIB

:ZLIB
cls
Title = Building Portlibs...
ECHO ..............................................................
ECHO . Portlibs LIB Menu. Do you want to install or compile only? .
ECHO ..............................................................
ECHO.
ECHO A - Install Zlib
ECHO B - Compile Zlib
ECHO C - Return to LIBs Menu
ECHO D - Return to Main Menu
ECHO E - EXIT Program
ECHO.
choice /C ABCDE /M "Enter the letter of your choice:"
IF ERRORLEVEL 5 exit
IF ERRORLEVEL 4 GOTO TYPE
IF ERRORLEVEL 3 GOTO LIBS
IF ERRORLEVEL 2 GOTO ZLIBCOMP
IF ERRORLEVEL 1 GOTO ZLIBINST

:FREETYPE
cls
Title = Building Portlibs...
ECHO ..............................................................
ECHO . Portlibs LIB Menu. Do you want to install or compile only? .
ECHO ..............................................................
ECHO.
ECHO A - Install FreeType2
ECHO B - Compile FreeTyp2
ECHO C - Return to LIBs Menu
ECHO D - Return to Main Menu
ECHO E - EXIT Program
ECHO.
choice /C ABCDE /M "Enter the letter of your choice:"
IF ERRORLEVEL 5 exit
IF ERRORLEVEL 4 GOTO TYPE
IF ERRORLEVEL 3 GOTO LIBS
IF ERRORLEVEL 2 GOTO FREETYPECOMP
IF ERRORLEVEL 1 GOTO FREETYPEINST

:LIBPNG
cls
Title = Building Portlibs...
ECHO ..............................................................
ECHO . Portlibs LIB Menu. Do you want to install or compile only? .
ECHO ..............................................................
ECHO.
ECHO A - Install LibPNG
ECHO B - Compile LibPNG
ECHO C - Return to LIBs Menu
ECHO D - Return to Main Menu
ECHO E - EXIT Program
ECHO.
choice /C ABCDE /M "Enter the letter of your choice:"
IF ERRORLEVEL 5 exit
IF ERRORLEVEL 4 GOTO TYPE
IF ERRORLEVEL 3 GOTO LIBS
IF ERRORLEVEL 2 GOTO LIBPNGCOMP
IF ERRORLEVEL 1 GOTO LIBPNGINST

:ZLIBINST
cls
if exist "3ds_portlibs" (
	echo Making a backup of your current Portlibs source folder
	xcopy "3ds_portlibs\*" "Backups_Compiles\Backup_3ds_portlibs" /e /i /y >nul
	cd 3ds_portlibs
    Title = Building Portlibs-zlib ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building Portlibs-zlib ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/devkitPro/3ds_portlibs.git
    cd 3ds_portlibs
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building Portlibs-zlib ^(Clean^)...
make clean
Title = Building Portlibs-zlib ^(Release^)...
make zlib
make install-zlib
Title = Building Portlibs-zlib ^(Done^)
echo.
echo #######################################################################
color A
cd ..
echo Done. Portlibs-zlib is installed in the "c:/devkitpro/portlibs" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:ZLIBCOMP
cls
if exist "3ds_portlibs" (
	echo Making a backup of your current Portlibs source folder
	xcopy "3ds_portlibs\*" "Backups_Compiles\Backup_3ds_portlibs" /e /i /y >nul
	cd 3ds_portlibs
    Title = Building Portlibs-zlib ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building Portlibs-zlib ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/devkitPro/3ds_portlibs.git
    cd 3ds_portlibs
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building Portlibs-Zlib ^(Clean^)...
make clean
Title = Building Portlibs-zlib ^(Release^)...
make zlib
Title = Building Portlibs-zlib ^(Done^)
echo.
echo #############################################
color A
cd ..
echo Done. Files are in the "3ds_portlibs" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:FREETYPEINST
cls
if exist "3ds_portlibs" (
	echo Making a backup of your current Portlibs source folder
	xcopy "3ds_portlibs\*" "Backups_Compiles\Backup_3ds_portlibs" /e /i /y >nul
	cd 3ds_portlibs
    Title = Building Portlibs-FreeType2 ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building Portlibs-FreeType2 ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/devkitPro/3ds_portlibs.git
    cd 3ds_portlibs
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building Portlibs-FreeType2 ^(Clean^)...
make clean
Title = Building Portlibs-FreeType2 ^(Release^)...
make freetype
make install
Title = Building Portlibs-FreeType2 ^(Done^)
echo.
echo ############################################################################
color A
cd ..
echo Done. Portlibs-FreeType2 is installed in the "c:/devkitpro/portlibs" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:FREETYPECOMP
cls
if exist "3ds_portlibs" (
	echo Making a backup of your current Portlibs source folder
	xcopy "3ds_portlibs\*" "Backups_Compiles\Backup_3ds_portlibs" /e /i /y >nul
	cd 3ds_portlibs
    Title = Building Portlibs-FreeType2 ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building Portlibs-FreeType2 ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/devkitPro/3ds_portlibs.git
    cd 3ds_portlibs
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building Portlibs-FreeType2 ^(Clean^)...
make clean
Title = Building Portlibs-FreeType2 ^(Release^)...
make freetype
Title = Building Portlibs-FreeType2 ^(Done^)
echo.
echo #############################################
color A
cd ..
echo Done. Files are in the "3ds_portlibs" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:LIBPNGINST
cls
if exist "3ds_portlibs" (
	echo Making a backup of your current Portlibs source folder
	xcopy "3ds_portlibs\*" "Backups_Compiles\Backup_3ds_portlibs" /e /i /y >nul
	cd 3ds_portlibs
    Title = Building Portlibs-LibPNG ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building Portlibs-LibPNG ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/devkitPro/3ds_portlibs.git
    cd 3ds_portlibs
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building Portlibs-LibPNG ^(Clean^)...
make clean
Title = Building Portlibs-LibPNG ^(Release^)...
make libpng
make install
Title = Building Portlibs-LibPNG ^(Done^)
echo.
echo #########################################################################
color A
cd ..
echo Done. Portlibs-LibPNG is installed in the "c:/devkitpro/portlibs" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:LIBPNGCOMP
cls
if exist "3ds_portlibs" (
	echo Making a backup of your current Portlibs source folder
	xcopy "3ds_portlibs\*" "Backups_Compiles\Backup_3ds_portlibs" /e /i /y >nul
	cd 3ds_portlibs
    Title = Building Portlibs-LibPNG ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building Portlibs-LibPNG ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/devkitPro/3ds_portlibs.git
    cd 3ds_portlibs
)
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building Portlibs-LibPNG ^(Clean^)...
make clean
Title = Building Portlibs-LibPNG ^(Release^)...
make libpng
Title = Building Portlibs-LibPNG ^(Done^)
echo.
echo #############################################
color A
cd ..
echo Done. Files are in the "3ds_portlibs" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:SF2DLIB
cls
Title = Building sf2dlib...
ECHO .........................................................
ECHO . Libsf2d Menu. Do you want to install or compile only? .
ECHO .........................................................
ECHO.
ECHO A - Install libsf2d
ECHO B - Compile libsf2d
ECHO C - Return to LIBs Menu
ECHO D - Return to Main Menu
ECHO E - EXIT Program
ECHO.
choice /C ABCDE /M "Enter the letter of your choice:"
IF ERRORLEVEL 5 exit
IF ERRORLEVEL 4 GOTO TYPE
IF ERRORLEVEL 3 GOTO LIBS
IF ERRORLEVEL 2 GOTO SF2DCOMP
IF ERRORLEVEL 1 GOTO SF2DINST

:SF2DINST
cls
if exist "sf2dlib" (
	echo Making a backup of your current sf2dlib folder
	xcopy "sf2dlib\*" "Backups_Compiles\Backup_sf2dlib" /e /i /y >nul
    cd sf2dlib
    Title = Building sf2dlib ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building sf2dlib ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/xerpi/sf2dlib.git
    cd sf2dlib
)
cd libsf2d
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building sf2dlib ^(Clean^)...
make clean
Title = Building sf2dlib ^(Release^)...
make install
Title = Building sf2dlib ^(Done^)
echo.
echo ################################################################
color A
cd ..
cd ..
echo Done. Sf2dlib is installed in the "c:/devkitpro/libctru" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:SF2DCOMP
cls
if exist "sf2dlib" (
	echo Making a backup of your current sf2dlib folder
	xcopy "sf2dlib\*" "Backups_Compiles\Backup_sf2dlib" /e /i /y >nul
    cd sf2dlib
    Title = Building sf2dlib ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Building sf2dlib ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/xerpi/sf2dlib.git
    cd sf2dlib
)
cd libsf2d
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Building sf2dlib ^(Clean^)...
make clean
Title = Building sf2dlib ^(Release^)...
make
Title = Building sf2dlib ^(Done^)
echo.
echo ############################################
color A
cd ..
cd ..
echo Done. Files are in "sf2dlib/libsf2d" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:SFTDLIB
cls
Title = Building sftdlib...
ECHO .............................................................
ECHO . sftdlib LIB Menu. Do you want to install or compile only? .
ECHO .............................................................
ECHO.
ECHO A - Install sftdlib
ECHO B - Compile sftdlib
ECHO C - Return to LIBs Menu
ECHO D - Return to Main Menu
ECHO E - EXIT Program
ECHO.
choice /C ABCDE /M "Enter the letter of your choice:"
IF ERRORLEVEL 5 exit
IF ERRORLEVEL 4 GOTO TYPE
IF ERRORLEVEL 3 GOTO LIBS
IF ERRORLEVEL 2 GOTO SFTDCOMP
IF ERRORLEVEL 1 GOTO SFTDINST

:SFTDINST
cls
if exist "sftdlib" (
    echo Making a backup of your current sftdlib source folder
    xcopy "sftdlib\*" "Backups_Compiles\Backup_sftdlib" /e /i /y >nul
    cd sftdlib
    Title = Installing sftdlib ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Installing sftdlib ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/xerpi/sftdlib
    cd sftdlib
)
cd libsftd
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Installing sftdlib ^(Clean^)...
make clean
Title = Installing sftdlib ^(Release^)...
make install
Title = Installing sftdlib ^(Done^)
echo.
echo ################################################################
color A
cd ..
cd ..
echo Done. sftdlib is installed in the "c:/devkitpro/libctru" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:SFTDCOMP
cls
if exist "sftdlib" (
    echo Making a backup of your current sftdlib source folder
    xcopy "sftdlib\*" "Backups_Compiles\Backup_sftdlib" /e /i /y >nul
    cd sftdlib
    Title = Installing sftdlib ^(Update^)...
    echo Updating repo...
    git pull origin master
    git submodule update --init --recursive
) else (
    Title = Installing sftdlib ^(Clone^)...
    echo Cloning repo...
    git clone --recursive https://github.com/xerpi/sftdlib
    cd sftdlib
)
cd libsftd
set PATH=c:\Python27\;%PATH%
echo Building...
Title = Installing sftdlib ^(Clean^)...
make clean
Title = Installing sftdlib ^(Release^)...
make
Title = Installing sftdlib ^(Done^)
echo.
echo ################################################################
color A
cd ..
cd ..
echo Done. Files are in the "sftdlib/libsftd" folder. && echo Press any key to continue ...
Pause >nul
GOTO END

:END
color 7
cls
ECHO ..........................................
ECHO . Do you want to compile another source? .
ECHO ..........................................
ECHO.
ECHO A - Yes
ECHO B - No
ECHO.
choice /C AB /M "Enter the letter of your choice:"
IF ERRORLEVEL 2 exit
IF ERRORLEVEL 1 GOTO TYPE
