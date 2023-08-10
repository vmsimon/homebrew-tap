# homebrew-formulas
My personal Homebrew tap housing formulas for all my Homebrew projects.


[![Build](https://github.com/vmsimon/homebrew-formulas/workflows/build/badge.svg)](https://github.com/vmsimon/homebrew-formulas/actions)
[![Licence](https://img.shields.io/github/license/justintime50/homebrew-formulas)](LICENSE)

<img src="https://raw.githubusercontent.com/vmsimon/assets/main/src/homebrew-formulas/showcase.png" alt="Showcase">

</div>

[Homebrew](https://brew.sh) is a fantastic package manager for macOS and Linux. I release some of my projects via Homebrew as it is widely used and easy to deploy to. This tap is a "self hosted" collection of Homebrew packages. For specific details about a formula contained in this tap, visit that formula's homepage or see the table below.

This repos is completely automated and maintained via [Homebrew Releaser](https://github.com/Justintime50/homebrew-releaser). If you are looking for a way to publish your own Homebrew formula on your behalf, you should check it out!

## Usage

```bash
# Setup tap
brew tap justintime50/formulas

# Check the tap for available formulas
brew search justintime50/formulas
```

<!-- project_table_start -->
| Project                                                                      | Description                                                                      | Install                             |
| ---------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | ----------------------------------- |
<!-- project_table_end -->

## Development

```bash
# Audit a formula (lint)
brew audit --strict --online <formula_name>

# Test a formula
brew test <formula_name>

# Create a tar
tar -czf name-of-tar.tgz path/to/content

# Get the checksum of an archive
shasum -a 256 name-of-tar.tgz
```
