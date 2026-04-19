#! /usr/bin/python3
"""
_Compress My Obsidian Archive_
"""

import shutil
import os
import datetime


def main() -> None:
    """
    Main function
    """
    vault_name = "../obsidian_vault"
    backup_prefix = "obsidian_backup_"
    output_name = ""

    print("=== ARCHIVE OBSIDIAN ===")

    # Check if Obsidian Vault exist
    try:
        assert os.path.isdir(vault_name), f"{vault_name} path does not exists"
    except Exception as e:
        print(f"Error : {e}")

    date_now = datetime.date.today().strftime("%d-%m-%Y").replace("-", "_")
    output_name = backup_prefix + date_now

    shutil.make_archive(output_name, "zip", vault_name)

    print(f"=== ARCHIVE CREATED : {output_name} ===")


if __name__ == "__main__":
    main()
