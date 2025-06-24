# logger_setup.py
import logging
import os
from datetime import datetime
import random

def setup_logger():
    log_dir = "logs"
    os.makedirs(log_dir, exist_ok=True)

    now = datetime.now()
    date_str = now.strftime("%Y-%m-%d")
    day_str = now.strftime("%A")

    # 🎉 Random Cool Message
    messages = [
        "Terraform like a wizard 🧙‍♂️",
        "One module at a time 🧱",
        "Cloud won't build itself ☁️🚀",
        "Debug hard, deploy harder 🔧",
        "You're doing DevOps right 👨‍💻",
        "Versioned, Tagged & Awesome 💥",
        "Automate all the things ⚙️",
        "Logs don't lie 🪵✨"
    ]
    msg = random.choice(messages)

    # 📁 File path (1 log file per day)
    log_file = os.path.join(log_dir, f"iam_builder_{date_str}.log")

    # 🪄 Write header only if file doesn't exist
    if not os.path.exists(log_file):
        with open(log_file, "w", encoding="utf-8") as f:
            f.write("=" * 60 + "\n")
            f.write(f"📅 {date_str} === {day_str} === {msg}\n")
            f.write("=" * 60 + "\n\n")

    # Setup logging
    logging.basicConfig(
        filename=log_file,
        filemode='a',  # Append new logs
        format='[%(asctime)s] %(levelname)s - %(message)s',
        level=logging.INFO
    )

    return logging
