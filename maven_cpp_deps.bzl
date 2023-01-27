load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

filegroup_all = """filegroup(
     name = "all",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

cc_library_headers = """cc_library(
    name = "headers",
    hdrs = glob(["**"]),
    includes = ["."],
    visibility = ["//visibility:public"],
)
"""

cc_library_sources = """filegroup(
     name = "sources",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

cc_library_static = """

cc_library(
    name = "static_libs",
    srcs = glob(["**/*.lib", "**/*.a"]),
    visibility = ["//visibility:public"],
)
"""

cc_library_shared = """
static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

cc_library(
    name = "static_libs",
    srcs = static_srcs,
    visibility = ["//visibility:public"],
)

cc_library(
    name = "shared_libs",
    srcs = shared_srcs,
    visibility = ["//visibility:public"],
    deps = [
        ":static_libs",
    ]
)

cc_library(
    name = "shared_jni_libs",
    srcs = shared_jni_srcs,
    visibility = ["//visibility:public"],
)
"""

def __setup_bzlmodrio_imgui_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-1/imgui-1.89.1-1-headers.zip",
        sha256 = "fa496c97819254fcace3acceb688b4ac2e169157fc017c8b1eaaed6ec48ada9c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-1/imgui-1.89.1-1-linuxarm32static.zip",
        sha256 = "aad8f78a48a31ac9ddae9d051931a4f6c4f41c97704b7b906488048d2e553356",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-1/imgui-1.89.1-1-linuxarm64static.zip",
        sha256 = "0a1fa8f6c16fcd6e5f5f97a121d6a6c7f8ee81992b806e47b55d7069c4f6d883",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-1/imgui-1.89.1-1-linuxx86-64static.zip",
        sha256 = "7024aa916fe82bd46ffe1a162164223d67e08310e3d81fd64e4e2adf51148903",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-1/imgui-1.89.1-1-osxuniversalstatic.zip",
        sha256 = "de02fd5208f8901efc94eb19a19b873775c97293fd0bf1818fa1638a1d58a5c2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-1/imgui-1.89.1-1-windowsx86-64static.zip",
        sha256 = "1aa7aa58d81236dd61b5f27d32ab66347f8a8df681f299b79eeb5956d1ee5c15",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-1/imgui-1.89.1-1-windowsx86static.zip",
        sha256 = "a21876e733dde8294f3ebb06432efa6c47c7bfb19a8a5f39124b9a32780019ae",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-1/imgui-1.89.1-1-linuxarm32staticdebug.zip",
        sha256 = "0050c540a5df12af86b7d09ef80e1c8d94bffdf811c0635324c8085c4b072fb3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-1/imgui-1.89.1-1-linuxarm64staticdebug.zip",
        sha256 = "67a7c1c50b80ee375bf9431a7aa3a6d075b96be51202930c0d50e2fc854420ec",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-1/imgui-1.89.1-1-linuxx86-64staticdebug.zip",
        sha256 = "c6c847fe73067fab5a8168558cb5ea300fc109155ae47e03567c5d5bf418a00c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-1/imgui-1.89.1-1-osxuniversalstaticdebug.zip",
        sha256 = "5eba4dcd3ca89480c3bca0c3b2e8923f9c80722e3932a38abc32af310516cec3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-1/imgui-1.89.1-1-windowsx86-64staticdebug.zip",
        sha256 = "b27f49276de8b45f95c8eee4e217d965047c8e21e53c41b21fcf508e06ae18c9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-1/imgui-1.89.1-1-windowsx86staticdebug.zip",
        sha256 = "eeeea8786bd4d6c8c9d05d60cd413d0334c9edae1628df61d3f8308437d6cca0",
        build_file_content = cc_library_static,
    )

def setup_legacy_bzlmodrio_imgui_cpp_dependencies():
    __setup_bzlmodrio_imgui_cpp_dependencies(None)

setup_bzlmodrio_imgui_cpp_dependencies = module_extension(
    __setup_bzlmodrio_imgui_cpp_dependencies,
)
