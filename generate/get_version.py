from get_imgui_dependencies import get_imgui_dependencies


def main():
    group = get_imgui_dependencies()
    print(group.year + "." + group.version)


if __name__ == "__main__":
    main()
