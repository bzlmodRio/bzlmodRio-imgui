workspace(name = "bzlmodrio-imgui")

load("@bzlmodrio-imgui//private/non_bzlmod_dependencies:download_dependencies.bzl", "download_dependencies")

download_dependencies()

load("@bzlmodrio-imgui//private/non_bzlmod_dependencies:setup_dependencies.bzl", "setup_dependencies")

setup_dependencies()

load("@rules_jvm_external//:defs.bzl", "maven_install")

maven_artifacts, maven_repositories = [], [
    "https://repo1.maven.org/maven2",
    "https://frcmaven.wpi.edu/release",
]

maven_install(
    name = "maven",
    artifacts = maven_artifacts,
    repositories = maven_repositories,
    # maven_install_json = "//build_scripts/bazel/deps:maven_install.json",
)
