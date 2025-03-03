import os

original_name = "phx_liveview"
capitalized_original_name = original_name.capitalize()

root = os.listdir(".")

name = input("New project name (e.g. phx_liveview): ").strip().replace(" ", "_").lower()
capitalized_name = name.replace("_", " ").capitalize().replace(" ", "")


def rename_file(root):
    for file in root:
        if os.path.isdir(file):
            rename_file(os.listdir(file))

        if original_name in file:
            os.rename(file, file.replace(original_name, name))

        if capitalized_original_name in file:
            os.rename(file, file.replace(capitalized_original_name, capitalized_name))


rename_file(root)

print(f"Project renamed to {capitalized_name}")
