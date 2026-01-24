from pathlib import Path
import os
import subprocess

def start():
    text = r"""
  ______          ______      ______      __       __  
 /_  __/______  _/_  __/___  / ____/___ _/ /______/ /_ 
  / / / ___/ / / // / / __ \/ /   / __ `/ __/ ___/ __ \
 / / / /  / /_/ // / / /_/ / /___/ /_/ / /_/ /__/ / / /
/_/ /_/   \__, //_/  \____/\____/\__,_/\__/\___/_/ /_/ 
         /____/                                        
    """
    print(text)

SITES = {
    "1": {"name": "Instagram site", "path": "sites/instagram"},
}

HOST = "127.0.0.1"
PORT = 8080


def choose_site() -> Path:
    print("\nChoose site:\n")
    for k, v in SITES.items():
        print(f"[{k}] {v['name']}")
    print("[q] Quit")

    while True:
        choice = input("> ").strip().lower()
        if choice in ("q", "quit", "exit"):
            raise SystemExit(0)
        if choice in SITES:
            site_dir = Path(SITES[choice]["path"]).resolve()
            if site_dir.exists() and site_dir.is_dir():
                return site_dir
           # print(f"Folder not found: {site_dir}")
        else:
            print("Invalid choice")


def run_php_server(site_dir: Path) -> None:
    os.chdir(site_dir)
    print(f"\nStarting PHP server")
    print(f"http://{HOST}:{PORT}")
    print("Ctrl+C to stop\n")

    proc = subprocess.Popen(
        ["php","-S", f"{HOST}:{PORT}"],
    )

    try:
        proc.wait()
    except KeyboardInterrupt:
        print("\nStopping...")
        proc.terminate()
        try:
            proc.wait(timeout=3)
        except subprocess.TimeoutExpired:
            proc.kill()
        print("Stopped")


if __name__ == "__main__":
    start()
    site = choose_site()
    run_php_server(site)





