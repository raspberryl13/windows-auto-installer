# Windows Software Installer GUI
A Python GUI app (`windows-auto-installer.py`) automating software installation on Windows via Chocolatey and direct downloads, compiled into a standalone `.exe` with PyInstaller.

## Usage
- Run `windows-auto-installer.exe` as administrator (no Python required).
- Select software via checkboxes (except `wget`, installed automatically), click "Next," then "Proceed."
- Logs to `C:\install_log.txt`.

## Requirements
- Windows OS
- Admin privileges
- Internet connection

## Notes
- Supports ~70 optional software options (e.g., nano, Firefox, VSCode); `wget` is mandatory for VMware, Office, etc.
- Tested on Windows with Chocolatey; URLs may need updates.
- Standalone `.exe` runs without Python, enhancing portability.


## License
MIT License
