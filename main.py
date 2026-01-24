from pathlib import Path

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
def choose_site():
    print("Choose site:")
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
            print("Error")
        else:
            print("Error")

def main():
    start()
    choose_site()

if __name__ == "__main__":
    main()




