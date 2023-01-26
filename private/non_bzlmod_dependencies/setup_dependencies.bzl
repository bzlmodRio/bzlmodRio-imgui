load("@bzlmodrio-imgui//:maven_cpp_deps.bzl", "setup_legacy_bzlmodrio_imgui_cpp_dependencies")
load("@rules_roborio_toolchain//:maven_deps.bzl", "setup_legacy_setup_toolchains_dependencies")
load("@rules_roborio_toolchain//toolchains:load_toolchains.bzl", "load_toolchains")
load("@rules_bazelrio//:nonbzlmod_setup.bzl", "setup_rules_bazelrio")

def _setup_toolchains():
    setup_legacy_setup_toolchains_dependencies()

    load_toolchains()

    native.register_toolchains(
        "@local_roborio//:macos",
        "@local_roborio//:linux",
        "@local_roborio//:windows",
    )

def _setup_cpp_dependencies():
    setup_legacy_bzlmodrio_imgui_cpp_dependencies()

def setup_dependencies():
    _setup_toolchains()
    _setup_cpp_dependencies()

    setup_rules_bazelrio()
