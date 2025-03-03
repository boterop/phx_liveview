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

print(ignored)


def rename_file(dirs, path):
    for file in dirs:
        absolute_path = os.path.join(path, file)
        should_ignore = len([i for i in ignored if absolute_path in i]) > 0
        if should_ignore:
            print(f"Ignoring {absolute_path}")
            continue
        if os.path.isdir(file):
            rename_file(os.listdir(file), absolute_path)

        if original_name in file:
            print(f"Renaming {absolute_path} to {file.replace(original_name, name)}")
            # os.rename(absolute_path, file.replace(original_name, name))

        if capitalized_original_name in file:
            print(
                f"Renaming {absolute_path} to {file.replace(capitalized_original_name, capitalized_name)}"
            )
            # os.rename(absolute_path, file.replace(capitalized_original_name, capitalized_name))


rename_file(dirs, root)

print(f"Project renamed to {capitalized_name}")
