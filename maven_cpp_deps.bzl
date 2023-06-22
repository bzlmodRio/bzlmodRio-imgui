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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-2/imgui-1.89.1-2-headers.zip",
        sha256 = "9260203b3df31ff798ee6591b93e3490952a1e3d01090b3712083a78473a4a6f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-2/imgui-1.89.1-2-linuxarm32static.zip",
        sha256 = "672e7d4d1b78b4852a1bc94738366f45ab833f08574ca61f1e38f49521d45398",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-2/imgui-1.89.1-2-linuxarm64static.zip",
        sha256 = "50a2e5fabef50eb0f7b50d81c067a777922ba78af22f82484db83208efed2f74",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-2/imgui-1.89.1-2-linuxx86-64static.zip",
        sha256 = "053213f9b1acafb6df917dbcabe51d89a405f85953c1943df9162478e44b1032",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-2/imgui-1.89.1-2-osxuniversalstatic.zip",
        sha256 = "c705177408df0dd484e061a2a237c3bba7278eb4aec257e151b2f0e21a039820",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-2/imgui-1.89.1-2-windowsarm64static.zip",
        sha256 = "6222df248a93cbc4d0b1fe14350cd4713513e2cba01361f14726a692a8f2ca16",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-2/imgui-1.89.1-2-windowsx86-64static.zip",
        sha256 = "0edb1cf95077f86ad17007f01b9c8bd1eedd9886719ac189c2d2639907ff2f79",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-2/imgui-1.89.1-2-windowsx86static.zip",
        sha256 = "693945ead0d310cdc13b53c548d1eae3ffbbb1c74b7848eaafeaaa946c7626fb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-2/imgui-1.89.1-2-linuxarm32staticdebug.zip",
        sha256 = "c88c5ce22ec33211fe8efcb6812b43b08554e7b738e60499e1be801a03824fef",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-2/imgui-1.89.1-2-linuxarm64staticdebug.zip",
        sha256 = "d7119d3636b02f6a5c634f969e5b3c6c65a553989773764c62e308c4831d755e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-2/imgui-1.89.1-2-linuxx86-64staticdebug.zip",
        sha256 = "bb4b4486c173ab1b463416b43a0e3a8b89ac1315411b7ec82a19c41640e0a14c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-2/imgui-1.89.1-2-osxuniversalstaticdebug.zip",
        sha256 = "33acac6f525ea4173513fade76834104bcfbabee0120aa73d4034bc0962f6724",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-2/imgui-1.89.1-2-windowsarm64staticdebug.zip",
        sha256 = "37e953acc2a625b744d1e7a9996c539e08b92f89cd3aee6be92082315aae1f57",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-2/imgui-1.89.1-2-windowsx86-64staticdebug.zip",
        sha256 = "5aa3d204d81b0b7a0900e953f74bf991d9c87f20ddbd0a41ab8bf049fbb1a45e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_imgui_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/imgui/1.89.1-2/imgui-1.89.1-2-windowsx86staticdebug.zip",
        sha256 = "3871bccc6de7063b0f6630b070ac68bbabb5419218fdd9be71f4be4387735046",
        build_file_content = cc_library_static,
    )

def setup_legacy_bzlmodrio_imgui_cpp_dependencies():
    __setup_bzlmodrio_imgui_cpp_dependencies(None)

setup_bzlmodrio_imgui_cpp_dependencies = module_extension(
    __setup_bzlmodrio_imgui_cpp_dependencies,
)
