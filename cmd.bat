@echo off

set param1=%1
if %param1%==l10n (
    flutter pub run intl_utils:generate
) else (
    echo 2
)

@REM else (
@REM echo 2
@REM )

