:: title = WinSCP Remote Directory Synchronization
:: description = Compares files in a local directory, then translates/synchronizes all differences to a remote directory.

:: Edit sync_defaults to change server connection settings and local + remote directories.
call ./env/sync_winscp_defaults.bat
"%programfiles(x86)%\WinSCP\WinSCP.com" /ini=nul /script=sync_winscp_script.txt