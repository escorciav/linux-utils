#!/bin/env python
"""

Compress and delete a folder if 50% of the files inside it are less than 2MB.

It only considers files in the first level of the folder.

"""
import os
import shutil
import sys
import tarfile
from contextlib import contextmanager


@contextmanager
def cd(newdir):
    prevdir = os.getcwd()
    os.chdir(os.path.expanduser(newdir))
    try:
        yield
    finally:
        os.chdir(prevdir)


def tar_dir(dest, source):
    dirname = os.path.dirname(source)
    with cd(dirname):
        basename = os.path.basename(source)
        with tarfile.open(dest, mode='w:gz') as archive:
            for i in os.listdir(source):
                archive.add(os.path.join(basename, i))


def main(dirname, mb_threshold=2):
    if not os.path.exists(dirname) or not os.path.isdir(dirname):
        print 'Unexistent folder: {}. Bye!'.format(dirname)
        return None

    # Grab file sizes in MB
    files_size = [os.path.getsize(os.path.join(dirname, f)) / 1024 / 1024
                  for f in os.listdir(dirname)
                  if os.path.isfile(os.path.join(dirname, f))]
    if len(files_size) < 1:
        print 'Skip folder compression. No files inside folder.'
        return None

    # Compute median of file sizes
    n_files = len(files_size)
    files_size.sort()
    mb_median = files_size[n_files/2]

    if mb_median > mb_threshold:
        print 'Skip folder compression. Good amount of big files.'
        return None

    source, basename = os.path.abspath(dirname), os.path.basename(dirname)
    destination = os.path.join(os.path.dirname(source), basename + '.tar.gz')
    print 'Compressing file onto {}'.format(destination)
    tar_dir(destination, source)

    try:
        with tarfile.open(destination, 'r') as fid:
            successfull_compresion = True
            fid.close()
    except:
        successfull_compresion = False
        print 'Unknown error. Deleting compressed file:'
        os.remove(destination)

    if successfull_compresion:
        shutil.rmtree(dirname)

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print 'compress_folder.py [folder]'
    main(sys.argv[1])
