from bazelrio_gentool.deps.dependency_container import DependencyContainer


def _default_native_static_platforms():
    platforms = [
        "linuxarm32",
        "linuxarm64",
        "linuxx86-64",
        "osxuniversal",
        "windowsarm64",
        "windowsx86-64",
        "windowsx86",
    ]
    return [x + "static" for x in platforms] + [x + "staticdebug" for x in platforms]


def get_imgui_dependencies():
    year = "2024"
    version = "1.89.9-1"

    group_id = f"edu.wpi.first.thirdparty.frc{year}"

    group = DependencyContainer(
        "bzlmodrio-imgui", version, year, "https://frcmaven.wpi.edu/release"
    )
    group.create_cc_dependency(
        f"imgui",
        parent_folder="imgui",
        group_id=group_id,
        headers="headers",
        sources=None,
        resources=_default_native_static_platforms(),
        has_jni=False,
    )

    return group


if __name__ == "__main__":
    get_opencv_dependencies()
