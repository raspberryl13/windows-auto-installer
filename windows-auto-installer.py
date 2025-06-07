# Version 1.0
import tkinter as tk
from tkinter import ttk, scrolledtext
from tkinter.ttk import Progressbar
import subprocess
import os
import time
import logging
import random
import shutil

class InstallGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("Windows Software Installer")
        self.root.geometry("600x600")
        
        # Setup logging
        logging.basicConfig(filename="C:\\install_log.txt", level=logging.INFO,
                          format="%(asctime)s - %(message)s")
        logging.info("Script started")

        # Software options categorized
        self.software = {
            "Utils": [
                ("nano", "choco install nano -y"),
                ("vim", "choco install vim --params '/NoDesktopShortcuts' -y"),
                ("chocolateygui", "choco install chocolateygui -y"),
                ("git", "choco install git.install -y"),
                ("pandoc", "choco install pandoc -y"),
                ("rufus", "choco install rufus -y")
            ],
            "Virtualization": [
                ("vmwareworkstation", self.install_vmware),
                ("niubi", self.install_niubi)
            ],
            "Browsers": [
                ("firefox", "choco install firefox -y"),
                ("vivaldi", "choco install vivaldi -y"),
                ("chromium", "choco install chromium -y"),
                ("brave", "choco install brave -y"),
                ("googlechrome", "choco install googlechrome -y"),
                ("torbrowser", "choco install tor-browser -y"),
                ("librewolf", "choco install librewolf -y")
            ],
            "Internet": [
                ("protonvpn", "choco install protonvpn -y"),
                ("protonmailbridge", "choco install protonmailbridge -y"),
                ("protondrive", "choco install protondrive -y"),
                ("protonpass", "choco install protonpass -y"),
                ("synologydrive", "choco install synologydrive -y"),
                ("transgui", "choco install transgui -y")
            ],
            "Communication": [
                ("signal", "choco install signal -y"),
                ("telegram", "choco install telegram -y"),
                ("thunderbird", "choco install thunderbird -y")
            ],
            "Office": [
                ("libreoffice", "choco install libreoffice-still -y"),
                ("msoffice", self.install_msoffice),
                ("synologynote", "choco install synology-note-station-client -y"),
                ("trilium", "choco install trilium-notes -y"),
                ("joplin", "choco install joplin -y"),
                ("okular", "choco install okular -y")
            ],
            "Programming": [
                ("vscode", "choco install vscode --params '/NoDesktopIcon /NoAddToPath' -y"),
                ("vscodium", "choco install vscodium --params '/NoDesktopIcon /NoAddToPath' -y"),
                ("pycharm", "choco install pycharm-community -y"),
                ("intellij", "choco install intellijidea-community -y"),
                ("thonny", "choco install thonny -y"),
                ("graphviz", "choco install graphviz -y"),
                ("unity", "choco install unity -y"),
                ("python3", "choco install python3 -y"),
                ("miniconda3", "choco install miniconda3 -y"),
                ("openjdk", "choco install openjdk -y"),
                ("gnucobol", "choco install gnucobol -y"),
                ("kate", "choco install kate -y"),
                ("notepadplusplus", "choco install notepadplusplus -y"),
                ("qownnotes", "choco install qownnotes -y"),
                ("ghostwriter", self.install_ghostwriter)
            ],
            "Editing": [
                ("darktable", "choco install darktable -y"),
                ("gimp", "choco install gimp -y"),
                ("paintdotnet", "choco install paint.net -y"),
                ("librecad", "choco install librecad -y"),
                ("blender", "choco install blender -y"),
                ("audacity", "choco install audacity -y"),
                ("lmms", "choco install lmms -y"),
                ("handbrake", "choco install handbrake -y"),
                ("losslesscut", "choco install lossless-cut -y")
            ],
            "System Tools": [
                ("coretemp", "choco install coretemp -y"),
                ("cpuz", "choco install cpu-z -y"),
                ("hwmonitor", "choco install hwmonitor -y"),
                ("gpuzyn", "choco install gpu-z -y"),
                ("mysqlworkbench", "choco install mysql.workbench -y"),
                ("mediainfo", "choco install mediainfo -y"),
                ("mkvtoolnix", "choco install mkvtoolnix -y"),
                ("mpv", "choco install mpvio -y"),
                ("vlc", "choco install vlc -y"),
                ("obsstudio", "choco install obs-studio -y"),
                ("kdenlive", "choco install kdenlive -y"),
                ("lmstudio", "choco install lm-studio -y"),
                ("crystaldiskmark", "choco install crystaldiskmark -y"),
                ("geekbench6", "choco install geekbench6 -y"),
                ("heavenbenchmark", "choco install heaven-benchmark -y"),
                ("superposition", self.install_superposition),
                ("valley", "choco install valley-benchmark -y"),
                ("ultradefrag", "choco install ultradefrag --params '/NoShellExtension' -y"),
                ("ccleaner", "choco install ccleaner -y"),
                ("ventoy", "choco install ventoy -y"),
                ("openhardwaremonitor", "choco install openhardwaremonitor -y")
            ],
            "Games": [
                ("steam", "choco install steam -y"),
                ("amazongames", "choco install amazongames -y"),
                ("epicgameslauncher", "choco install epicgameslauncher -y"),
                ("goggalaxy", "choco install goggalaxy -y"),
                ("supertuxkart", "choco install supertuxkart -y"),
                ("sauerbraten", "choco install sauerbraten -y"),
                ("chessx", "choco install chessx -y")
            ]
        }

        # Store checkbox states
        self.check_vars = {}
        for category, items in self.software.items():
            for name, _ in items:
                self.check_vars[name] = tk.BooleanVar()

        # Create GUI
        self.create_landing_page()

    def create_landing_page(self):
        # Clear existing widgets
        for widget in self.root.winfo_children():
            widget.destroy()

        # Create canvas and scrollbar
        canvas = tk.Canvas(self.root)
        scrollbar = ttk.Scrollbar(self.root, orient="vertical", command=canvas.yview)
        scrollable_frame = ttk.Frame(canvas)

        scrollable_frame.bind(
            "<Configure>",
            lambda e: canvas.configure(scrollregion=canvas.bbox("all"))
        )

        canvas.create_window((0, 0), window=scrollable_frame, anchor="nw")
        canvas.configure(yscrollcommand=scrollbar.set)

        canvas.pack(side="left", fill="both", expand=True)
        scrollbar.pack(side="right", fill="y")

        # Title
        ttk.Label(scrollable_frame, text="Windows Software Installer", font=("Arial", 16, "bold")).pack(pady=10)

        # Check all/uncheck all buttons
        ttk.Button(scrollable_frame, text="Check All", command=self.check_all).pack(anchor="w", padx=10)
        ttk.Button(scrollable_frame, text="Uncheck All", command=self.uncheck_all).pack(anchor="w", padx=10)

        # Software checkboxes by category
        for category, items in self.software.items():
            ttk.Label(scrollable_frame, text=category, font=("Arial", 12, "bold")).pack(anchor="w", padx=10, pady=5)
            for name, _ in items:
                ttk.Checkbutton(scrollable_frame, text=name, variable=self.check_vars[name]).pack(anchor="w", padx=20)

        # Next button
        ttk.Button(scrollable_frame, text="Next", command=self.show_confirmation_page).pack(pady=20)

    def check_all(self):
        for var in self.check_vars.values():
            var.set(True)

    def uncheck_all(self):
        for var in self.check_vars.values():
            var.set(False)

    def show_confirmation_page(self):
        # Clear existing widgets
        for widget in self.root.winfo_children():
            widget.destroy()

        # Confirmation message
        ttk.Label(self.root, text="Would you like to begin the install script?", font=("Arial", 12)).pack(pady=20)

        # Buttons
        ttk.Button(self.root, text="Go Back", command=self.create_landing_page).pack(pady=10)
        ttk.Button(self.root, text="Proceed", command=self.run_installs).pack(pady=10)

    def run_installs(self):
        # Clear existing widgets
        for widget in self.root.winfo_children():
            widget.destroy()

        # Progress label, progress bar, and text area
        ttk.Label(self.root, text="Installation Progress", font=("Arial", 12, "bold")).pack(pady=10)
        self.progress_bar = Progressbar(self.root, length=400, mode="indeterminate")
        self.progress_bar.pack(pady=10)
        self.progress_text = scrolledtext.ScrolledText(self.root, height=20, width=70)
        self.progress_text.pack(pady=10)

        # Start progress bar
        self.progress_bar.start()

        # Install Chocolatey first
        self.update_progress("Installing Chocolatey...")
        try:
            subprocess.run(
                'powershell -NoProfile -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString(\'https://community.chocolatey.org/install.ps1\'))"',
                shell=True, check=True, capture_output=True, text=True
            )
            os.environ["PATH"] += os.pathsep + os.path.join(os.environ["ALLUSERSPROFILE"], "chocolatey", "bin")
            self.update_progress("Chocolatey installed successfully!")
            logging.info("Chocolatey installed successfully")
        except subprocess.CalledProcessError as e:
            self.update_progress(f"Failed to install Chocolatey: {e}")
            logging.error(f"Failed to install Chocolatey: {e}")
            self.progress_bar.stop()
            return

        # Install wget mandatorily
        self.update_progress("Installing wget (required dependency)...")
        try:
            subprocess.run("choco install wget -y", shell=True, check=True, capture_output=True, text=True)
            self.update_progress("wget installed successfully!")
            logging.info("wget installed successfully")
        except subprocess.CalledProcessError as e:
            self.update_progress(f"Failed to install wget: {e}")
            logging.error(f"Failed to install wget: {e}")
            self.progress_bar.stop()
            return

        # Install selected software
        for category, items in self.software.items():
            for name, command in items:
                if self.check_vars[name].get():
                    self.update_progress(f"Installing {name}...")
                    try:
                        if callable(command):
                            command()
                        else:
                            subprocess.run(command, shell=True, check=True, capture_output=True, text=True)
                        self.update_progress(f"{name} installed successfully!")
                        logging.info(f"{name} installed successfully")
                    except subprocess.CalledProcessError as e:
                        self.update_progress(f"Failed to install {name}: {e}")
                        logging.error(f"Failed to install {name}: {e}")

        self.update_progress("Installation completed!")
        logging.info("Installation completed")

        # Stop progress bar
        self.progress_bar.stop()

        # Close button
        ttk.Button(self.root, text="Close", command=self.root.quit).pack(pady=10)

    def update_progress(self, message):
        self.progress_text.insert(tk.END, f"{message}\n")
        self.progress_text.see(tk.END)
        self.root.update()

    def install_vmware(self):
        randstr = f"{random.randint(1000, 9999)}{random.randint(1000, 9999)}"
        temp_folder = f"C:\\VMWare_WorkstationInstaller_{randstr}"
        os.makedirs(temp_folder)
        logging.info(f"Downloading VMware Workstation to {temp_folder}")
        subprocess.run(
            f'wget https://archive.org/download/vmware-workstation-pro-17.5.2/VMware-workstation-full-17.5.2-23775571.exe -O {temp_folder}\\VMware-workstation-full-17.5.2-23775571.exe',
            shell=True, check=True
        )
        logging.info("Running VMware Workstation silent installer")
        subprocess.run(
            f'{temp_folder}\\VMware-workstation-full-17.5.2-23775571.exe /s /v /qn EULAS_AGREED=1',
            shell=True, check=True
        )
        shutil.rmtree(temp_folder)
        logging.info("VMware Workstation installation complete")

    def install_niubi(self):
        randstr = f"{random.randint(1000, 9999)}{random.randint(1000, 9999)}"
        temp_folder = f"C:\\NPE_freeInstaller_{randstr}"
        os.makedirs(temp_folder)
        logging.info(f"Downloading NIUBI installer to {temp_folder}")
        subprocess.run(
            f'wget https://www.hdd-tool.com/download/NPE_free.exe -O {temp_folder}\\NPE_free.exe',
            shell=True, check=True
        )
        logging.info("Running NIUBI silent installer")
        subprocess.run(
            f'{temp_folder}\\NPE_free.exe /S',
            shell=True, check=True
        )
        shutil.rmtree(temp_folder)
        logging.info("NIUBI installation complete")

    def install_msoffice(self):
        randstr = f"{random.randint(1000, 9999)}{random.randint(1000, 9999)}"
        temp_folder = f"C:\\Microsoft_OfficeInstaller_{randstr}"
        os.makedirs(temp_folder)
        logging.info(f"Downloading Microsoft Office to {temp_folder}")
        subprocess.run(
            f'wget https://archive.org/download/office-setup_202110/OfficeSetup.exe -O {temp_folder}\\OfficeSetup.exe',
            shell=True, check=True
        )
        logging.info("Running Microsoft Office installer")
        subprocess.run(
            f'{temp_folder}\\OfficeSetup.exe',
            shell=True, check=True
        )
        shutil.rmtree(temp_folder)
        logging.info("Microsoft Office installation complete")

    def install_ghostwriter(self):
        randstr = f"{random.randint(1000, 9999)}{random.randint(1000, 9999)}"
        temp_folder = f"C:\\GhostWriterInstaller_{randstr}"
        os.makedirs(temp_folder)
        logging.info(f"Downloading GhostWriter to {temp_folder}")
        subprocess.run(
            f'wget https://github.com/KDE/ghostwriter/releases/download/2.1.6/ghostwriter_2.1.6_win64_portable.zip -O {temp_folder}\\ghostwriter_2.1.6_win64_portable.zip',
            shell=True, check=True
        )
        subprocess.run(
            f'tar -xf {temp_folder}\\ghostwriter_2.1.6_win64_portable.zip -C {temp_folder}',
            shell=True, check=True
        )
        if os.path.exists("C:\\Program Files (x86)\\ghostwriter"):
            shutil.rmtree("C:\\Program Files (x86)\\ghostwriter")
        shutil.move(temp_folder, "C:\\Program Files (x86)\\ghostwriter")
        logging.info("GhostWriter installation complete")

    def install_superposition(self):
        randstr = f"{random.randint(1000, 9999)}{random.randint(1000, 9999)}"
        temp_folder = f"C:\\Unigine_SuperpositionInstaller_{randstr}"
        os.makedirs(temp_folder)
        logging.info(f"Downloading Superposition to {temp_folder}")
        subprocess.run(
            f'wget https://assets.unigine.com/d/Unigine_Superposition-1.1.exe -O {temp_folder}\\Unigine_Superposition-1.1.exe',
            shell=True, check=True
        )
        logging.info("Running Unigine Superposition silent installer")
        subprocess.run(
            f'{temp_folder}\\Unigine_Superposition-1.1.exe /silent',
            shell=True, check=True
        )
        shutil.rmtree(temp_folder)
        logging.info("Superposition installation complete")

if __name__ == "__main__":
    root = tk.Tk()
    app = InstallGUI(root)
    root.mainloop()