@echo off
title Jokenpo
color 0A

set vitorias=0
set derrotas=0
set empates=0

cls
set /p nome=Digite seu nome: 

:menu
cls
echo ==============================
echo Placar de %nome%:
echo Vitorias: %vitorias%
echo Derrotas: %derrotas%
echo Empates : %empates%
echo ==============================
echo.
echo [J] Jogar
echo [R] Regras
echo [E] Encerrar
echo.
set /p opcao=Escolha uma opcao: 

if /i "%opcao%"=="J" goto jogo
if /i "%opcao%"=="R" goto regras
if /i "%opcao%"=="E" exit
goto menu

:jogo
cls
echo ==============================
echo Escolha seu ataque:
echo 1 - Pedra
echo 2 - Papel
echo 3 - Tesoura
echo 4 - Lagarto
echo 5 - Spock
echo ==============================
echo.
set /p escolha=Digite o numero (1-5): 

set /a cpu=%random% %% 5 + 1

if %escolha%==1 set jogador=Pedra
if %escolha%==2 set jogador=Papel
if %escolha%==3 set jogador=Tesoura
if %escolha%==4 set jogador=Lagarto
if %escolha%==5 set jogador=Spock

if %cpu%==1 set computador=Pedra
if %cpu%==2 set computador=Papel
if %cpu%==3 set computador=Tesoura
if %cpu%==4 set computador=Lagarto
if %cpu%==5 set computador=Spock

cls
echo ==============================
echo %nome% escolheu: %jogador%
echo Computador escolheu: %computador%
echo ==============================

if "%escolha%"=="%cpu%" (
    echo.
    echo Empate!
    set /a empates+=1
    goto fim
)

set win=

if %escolha%==1 if %cpu%==3 set win=1
if %escolha%==1 if %cpu%==4 set win=1

if %escolha%==2 if %cpu%==1 set win=1
if %escolha%==2 if %cpu%==5 set win=1

if %escolha%==3 if %cpu%==4 set win=1
if %escolha%==3 if %cpu%==2 set win=1

if %escolha%==4 if %cpu%==2 set win=1
if %escolha%==4 if %cpu%==5 set win=1

if %escolha%==5 if %cpu%==1 set win=1
if %escolha%==5 if %cpu%==3 set win=1

if defined win (
    echo.
    echo Voce venceu!
    set /a vitorias+=1
) else (
    echo.
    echo Voce perdeu!
    set /a derrotas+=1
)

:fim
echo.
echo ==============================
echo Placar Atual:
echo Vitorias: %vitorias%
echo Derrotas: %derrotas%
echo Empates : %empates%
echo ==============================
echo.

set /p repetir=Deseja jogar novamente? (S/N): 
if /i "%repetir%"=="S" goto jogo
goto menu

:regras
cls
echo ==============================
echo            REGRAS
echo ==============================
echo Pedra ganha de Tesoura e Lagarto
echo Papel ganha de Pedra e Spock
echo Tesoura ganha de Papel e Lagarto
echo Lagarto ganha de Papel e Spock
echo Spock ganha de Pedra e Tesoura
echo.
pause
goto menu