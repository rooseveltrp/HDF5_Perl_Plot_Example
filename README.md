# HDF5 Perl Plot Demo

This is a sample Perl script I created to open a HDF5 file, extract some data and generate a plot. For testing purposes, it uses one of NASA's MODIS HDF5 file.

## Requirements

* Docker
* Ubuntu/CentOS or any compatible Linux OS
* or Windows with WSL (Ubuntu/Linux)

## Instructions

* Build the container

```
$ bash dev-build.sh
```

* Run the script

```
$ bash dev-run.sh
```

After you run the script, it should create the result.svg file. It should look something like below:

![alt text](images/sample.svg)