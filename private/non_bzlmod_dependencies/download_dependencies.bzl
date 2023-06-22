load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def download_dependencies():
    # JVM External
    http_archive(
        name = "rules_jvm_external",
        sha256 = "f86fd42a809e1871ca0aabe89db0d440451219c3ce46c58da240c7dcdc00125f",
        strip_prefix = "rules_jvm_external-5.2",
        url = "https://github.com/bazelbuild/rules_jvm_external/releases/download/5.2/rules_jvm_external-5.2.tar.gz",
    )

    # Bazelrio Rules
    http_archive(
        name = "rules_bazelrio",
        sha256 = "c7a7fac8a976caa78233dad09c68decf892ad197ba6a1fc7a4a4dffdfef1b3d9",
        url = "https://github.com/bzlmodRio/rules_bazelrio/releases/download/0.0.11/rules_bazelrio-0.0.11.tar.gz",
    )

    # Roborio Toolchain
    http_archive(
        name = "rules_bzlmodrio_toolchains",
        sha256 = "1c566358f97b093916e150de10b65d6527ad268e5bd8bc0a0a8bfd04b390751a",
        url = "https://github.com/bzlmodRio/rules_bzlmodRio_toolchains/releases/download/2023-7/rules_bzlmodRio_toolchains-2023-7.tar.gz",
    )

    ########################
    # bzlmodRio dependencies

    ########################
