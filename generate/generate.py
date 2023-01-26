import os
from get_imgui_dependencies import get_imgui_dependencies

from bazelrio_gentool.generate_group import generate_group
from bazelrio_gentool.generate_module_project_files import (
    generate_module_project_files,
    create_default_mandatory_settings,
)
from bazelrio_gentool.clean_existing_version import clean_existing_version
from bazelrio_gentool.utils import TEMPLATE_BASE_DIR, render_template


def main():
    SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
    REPO_DIR = os.path.join(SCRIPT_DIR, "..")
    output_dir = os.path.join(REPO_DIR, "libraries")

    group = get_imgui_dependencies()

    mandatory_dependencies = create_default_mandatory_settings(
        use_local_roborio=False,
        use_local_bazelrio=False,
    )

    clean_existing_version(REPO_DIR)
    generate_module_project_files(REPO_DIR, group, mandatory_dependencies)
    generate_group(output_dir, group, force_tests=True)


if __name__ == "__main__":
    """
    bazel run //:generate && buildifier --lint=fix -r ..
    """
    main()
