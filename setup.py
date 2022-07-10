# -*- coding: utf-8 -*-

from setuptools import setup, find_packages


# The information here can also be placed in setup.cfg - better separation of
# logic and declaration, and simpler if you include description/version in a file.
setup(
    name="mjxc",
    version="0.0.1",
    author="Mjx Project Team",
    author_email="koyamada-s@sys.i.kyoto-u.ac.jp",
    description="mjx-convert",
    long_description="",
    packages=find_packages("."),
    package_dir={"": "."},
    # package_data={'': ['*.json']},
    entry_points={"console_scripts": "mjxc = converter.main:main"},
    zip_safe=False,
    install_requires=[
        "click==8.0.1",
        "tenhou_wall_reproducer",
    ],
    extras_require={"test": ["pytest"]},
    include_package_data=True,
)
