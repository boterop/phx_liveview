import os

original_name = "phx_liveview"
capitalized_original_name = original_name.capitalize()

root = ""
dirs = os.listdir(".")

name = input("New project name (e.g. phx_liveview): ").strip().replace(" ", "_").lower()
capitalized_name = name.replace("_", " ").capitalize().replace(" ", "")

ignored = open(".gitignore").read().splitlines()
ignored = [i.strip() for i in ignored if i.strip() != ""]
ignored = [i for i in ignored if i[0] != "#" or i[0] != "!"]
ignored = [i[1:] for i in ignored if i[0] == "/"]


def rename_file(dirs, path):
    for file in dirs:
        absolute_path = os.path.join(path, file)
        try:
            should_ignore = len([i for i in ignored if absolute_path in i]) > 0
            if should_ignore:
                continue
            if os.path.isdir(file):
                rename_file(os.listdir(file), absolute_path)

            if original_name in file:
                os.rename(absolute_path, absolute_path.replace(original_name, name))

            if capitalized_original_name in file:
                os.rename(
                    absolute_path,
                    absolute_path.replace(capitalized_original_name, capitalized_name),
                )
        except Exception as e:
            print(f"Error renaming {absolute_path}: {e}")


rename_file(dirs, root)

print(f"Project renamed to {capitalized_name}")
