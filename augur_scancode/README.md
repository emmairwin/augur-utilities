# README File for Script

Tested using Python 3.11.x on the latest Mac OSX distribution on Apple Silicon. Note that the official documentation indicates that the scancode library supports up to Python 3.12. 

- [Running a Scan](https://scancode-toolkit.readthedocs.io/en/latest/tutorials/how_to_run_a_scan.html#running-the-scan)
- [Installing (use pip)](https://scancode-toolkit.readthedocs.io/en/latest/getting-started/install.html#pip-install)

### Mac OSX Installation Errata
- `brew install libmagic`
- Save the path to libmagic in your profile
```bash
    export TYPECODE_LIBMAGIC_PATH=$(brew --prefix)/lib/libmagic.dylib
    export TYPECODE_LIBMAGIC_DB_PATH=$(brew --prefix)/share/misc/magic.mgc
```

### Notes
- `test.json` is a scan of the https://github.com/chaoss/augur library on April 18, 2025. The parameters: `scancode -cli -n 2 --json-pp test.json augur/` were used to execute it from the directory the clone existed in locally. 
- `eval.py` is a test script for running scans across a wide range of repositories under a directory. 
- The [scan_results](scan_results/) directory is a set of samples for testing the database load. 
