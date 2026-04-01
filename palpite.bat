@echo off
chcp 65001
color 0a
title Adivinhe o Número
cls
echo =========================================================
ECHO.
echo       █████╗ ██████╗ ██╗   ██╗██╗███╗   ██╗       /~\
echo      ██╔══██╗██╔══██╗██║   ██║██║████╗  ██║      C oo
echo      ███████║██████╔╝██║   ██║██║██╔██╗ ██║      _( ^)
echo      ██╔══██║██╔═══╝ ██║   ██║██║██║╚██╗██║     /   ~\
echo      ██║  ██║██║     ╚██████╔╝██║██║ ╚████║
echo      ╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝╚═╝  ╚═══╝              
ECHO.
echo ==========================================================
echo.
set /p nome=Digite seu nome: 

:reiniciar
set /a numero=%random% %%50 + 1
set /a cont=5

:inicio
cls
echo ╔════════════════════════════════════════╗
echo ║        ADVINHE UM NÚMERO DE 1 A 50     ║
echo ╠════════════════════════════════════════╣
echo ║ Jogador: %nome%                        ║
echo ║ Tentativas restantes: %cont%           ║
echo ║                                        ║
echo ║ [P] Ver Pontuação                      ║
echo ║ [E] Encerrar                           ║
echo ╚════════════════════════════════════════╝
echo.

set /p palpite=Digite seu palpite: 

if /i "%palpite%"=="P" goto pontuacao
if /i "%palpite%"=="E" exit

if %palpite%==%numero% goto ganhou

if %palpite% LSS %numero% goto maior
if %palpite% GTR %numero% goto menor

:maior
set /a cont=%cont%-1
if %cont%==0 goto perdeu
echo.
echo ╔════════════════════════╗
echo ║  O NÚMERO É MAIOR!     ║
echo ╚════════════════════════╝
pause
goto inicio

:menor
set /a cont=%cont%-1
if %cont%==0 goto perdeu
echo.
echo ╔════════════════════════╗
echo ║  O NÚMERO É MENOR!     ║
echo ╚════════════════════════╝
pause
goto inicio

:ganhou
cls
set /a usadas=5-%cont%+1
echo.
echo ╔════════════════════════╗
echo ║       PARABÉNS %nome%! ║
echo ║  Você acertou o número ║
echo ║        %numero%        ║
echo ╚════════════════════════╝
echo.

echo %date% ^| %time% ^| %nome% ^| Tentativas: %usadas% ^| Numero: %numero% >> pontuacao.txt
pause
goto jogar

:perdeu
cls
echo ╔════════════════════════╗
echo ║       GAME OVER!       ║
echo ║ O número era %numero%  ║
echo ╚════════════════════════╝
echo.
pause
goto jogar

:jogar
set /p dnv=Quer jogar novamente? (S/N): 
if /i "%dnv%"=="S" goto reiniciar
exit

:pontuacao
cls
echo ╔════════════════════════════════════════╗
echo ║       TABELA DE PONTUAÇÃO (VITÓRIAS)   ║
echo ╠════════════════════════════════════════╣
echo ║ Data ^| Hora ^| Nome ^| Tentativas ^| Número
echo ╠════════════════════════════════════════╣

if exist pontuacao.txt (
    type pontuacao.txt
) else (
    echo  Nenhuma pontuação registrada ainda 
)

echo ╚════════════════════════════════════════╝
echo.
pause
goto inicio