load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def download_dependencies():
    # Rules Java
    http_archive(
        name = "rules_java",
        sha256 = "4da3761f6855ad916568e2bfe86213ba6d2637f56b8360538a7fb6125abf6518",
        url = "https://github.com/bazelbuild/rules_java/releases/download/7.5.0/rules_java-7.5.0.tar.gz",
    )

    # JVM External
    http_archive(
        name = "rules_jvm_external",
        sha256 = "",
        strip_prefix = "rules_jvm_external-6.1",
        url = "https://github.com/bazelbuild/rules_jvm_external/releases/download/6.1/rules_jvm_external-6.1.tar.gz",
    )

    # Bazelrio Rules
    http_archive(
        name = "rules_bazelrio",
        sha256 = "0c5a98476ac5b606689863b7b9ef3f7d685c47ce2681e448ca977e8e95de31c1",
        url = "https://github.com/bzlmodRio/rules_bazelrio/releases/download/0.0.14/rules_bazelrio-0.0.14.tar.gz",
    )

    # Roborio Toolchain
    http_archive(
        name = "rules_bzlmodrio_toolchains",
        sha256 = "cd3ff046427e9c6dbc0c86a458c8cf081b8045fc3fb4265d08c0ebfc17f9cb30",
        url = "https://github.com/bzlmodRio/rules_bzlmodRio_toolchains/releases/download/2024-1/rules_bzlmodRio_toolchains-2024-1.tar.gz",
    )

    ########################
    # bzlmodRio dependencies

    ########################
