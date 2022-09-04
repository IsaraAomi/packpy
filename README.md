# How to use PackPy

## Pack
- Edit `setting.sh`
  - python version
  - install directory in the offline environment
- Edit `printreqs.py` to import libraries you want to bring.
- Run the following:
  ```sh
  $ ./pack.sh
  ```
- You can get `storage.tar.gz` and bring it to the offline environment.

## Unpack and Install
- Run the following:
  ```sh
  $ tar xzvfp storage.tar.gz
  $ cd storage
  $ ./install_python.sh
  $ ./install_lib.sh
  $ ./set_env.sh  # support tcsh and bash only
  ```
- You can use newly installed python such as `$ python3 ***.py`.
