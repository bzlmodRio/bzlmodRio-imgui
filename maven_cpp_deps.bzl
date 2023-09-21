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
JNI_PATTERN=[
    "**/*jni.dll",
    "**/*jni.so*",
    "**/*jni.dylib",
    "**/*_java*.dll",
    "**/lib*_java*.dylib",
    "**/lib*_java*.so",
]

static_srcs = glob([
        "**/*.lib",
        "**/*.a"
    ],
    exclude=["**/*jni.lib"]
)
shared_srcs = glob([
        "**/*.dll",
        "**/*.so*",
        "**/*.dylib",
    ],
    exclude=JNI_PATTERN + ["**/*.so.debug"]
)
shared_jni_srcs = glob(JNI_PATTERN, exclude=["**/*.so.debug"])

filegroup(
    name = "static_libs",
    srcs = static_srcs,
    visibility = ["//visibility:public"],
)

filegroup(
    name = "shared_libs",
    srcs = shared_srcs,
    visibility = ["//visibility:public"],
)

filegroup(
    name = "shared_jni_libs",
    srcs = shared_jni_srcs,
    visibility = ["//visibility:public"],
)
"""

def __setup_bzlmodrio_imgui_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/imgui/1.89.9-1/imgui-1.89.9-1-headers.zip",
        sha256 = "9e124db7df972ddc017e9f677bc81540530569e1c5f815437d206709ab445468",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/imgui/1.89.9-1/imgui-1.89.9-1-linuxarm32static.zip",
        sha256 = "91fb53c534404abfdc61421778ef28f46253dafa8a487765137892470de06c4d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/imgui/1.89.9-1/imgui-1.89.9-1-linuxarm64static.zip",
        sha256 = "7fb68dc14d373f7c512b67c0102103a07ef1ce21aa6bd29b0b25b207113d0600",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/imgui/1.89.9-1/imgui-1.89.9-1-linuxx86-64static.zip",
        sha256 = "82521ffdf13630c26d24a0ef34f8364fbde399f7d40e3a42481b7403d217d6b3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/imgui/1.89.9-1/imgui-1.89.9-1-osxuniversalstatic.zip",
        sha256 = "c1c42ebcead22e83aa7884683331a6be3e2e634c0cd1b96cff115b02deba84f9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/imgui/1.89.9-1/imgui-1.89.9-1-windowsarm64static.zip",
        sha256 = "09f1f18dde8bb8ebf2c7f07e0edb24af8b3ba2cdd95bddba14ac9650a82237cc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/imgui/1.89.9-1/imgui-1.89.9-1-windowsx86-64static.zip",
        sha256 = "0e6ac2805d32c219a9bfc5fa4597e9b77ea904841b72f16be5e2f01e8bdf7a32",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/imgui/1.89.9-1/imgui-1.89.9-1-windowsx86static.zip",
        sha256 = "573b98cd836a95111615a8f2930b5c70e2e68e3208e1f51707b2fbe72b57c74e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/imgui/1.89.9-1/imgui-1.89.9-1-linuxarm32staticdebug.zip",
        sha256 = "34074455a82dfa5b805044900c8f7bc6e4d3e2c7b6b8fc427622a1ff83b52520",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/imgui/1.89.9-1/imgui-1.89.9-1-linuxarm64staticdebug.zip",
        sha256 = "59fd9b79d2d5b71cbedc7fa5d6aa445dd9782842292ee0d13ae001626b84f99c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/imgui/1.89.9-1/imgui-1.89.9-1-linuxx86-64staticdebug.zip",
        sha256 = "79765ae298725369940007bee5071d5d6ffc31080b58a82e9dd9c9a2c3229b49",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/imgui/1.89.9-1/imgui-1.89.9-1-osxuniversalstaticdebug.zip",
        sha256 = "efe5fd239aa744463bf7eed3c52379696cd5105af4be3fb2b9ea865b9cc378dd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/imgui/1.89.9-1/imgui-1.89.9-1-windowsarm64staticdebug.zip",
        sha256 = "fe54cdc4fbc24356a9c85ded5ed15fcf436f5db9a575234b54b40708e1eb4efc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/imgui/1.89.9-1/imgui-1.89.9-1-windowsx86-64staticdebug.zip",
        sha256 = "631a3a41fd0aac8bb7e57aabb068855fa8ace81414a20e1a15824919d0545b63",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/imgui/1.89.9-1/imgui-1.89.9-1-windowsx86staticdebug.zip",
        sha256 = "3b7d76e7f32962f3e20521cac212ad0d7899f44195fb0bc3aa92d8aaecf38f00",
        build_file_content = cc_library_static,
    )

def setup_legacy_bzlmodrio_imgui_cpp_dependencies():
    __setup_bzlmodrio_imgui_cpp_dependencies(None)

setup_bzlmodrio_imgui_cpp_dependencies = module_extension(
    __setup_bzlmodrio_imgui_cpp_dependencies,
)
