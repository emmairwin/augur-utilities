# README File for Script

- [Running a Scan](https://scancode-toolkit.readthedocs.io/en/latest/tutorials/how_to_run_a_scan.html#running-the-scan)
- [Installing (use pip)](https://scancode-toolkit.readthedocs.io/en/latest/getting-started/install.html#pip-install)

### Mac OSX Installation Errata
- `brew install libmagic`
- Save the path to libmagic in your profile
```bash
    export TYPECODE_LIBMAGIC_PATH=$(brew --prefix)/lib/libmagic.dylib
    export TYPECODE_LIBMAGIC_DB_PATH=$(brew --prefix)/share/misc/magic.mgc
```

