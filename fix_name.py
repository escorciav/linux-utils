import os
import shutil
import sys

def fullpath_names(root_dir, file_list):
    """Create a list of fullpath file-name
    """
    fullpath_list = []
    for i in file_list:
        fullpath_list.append(os.path.join(root_dir, i))
    return fullpath_list

def get_files_and_subdirs(root_dir):
    """Return a tuple with all dirs and files inside root_dir
    """
    f, s = [], []
    for (dirpath, dirnames, filenames) in os.walk(root_dir): 
        s += fullpath_names(dirpath, dirnames)
        f += fullpath_names(dirpath, filenames)
    return s + f

def escape_space_and_uppercase(file_list):
    """
    Rename files that contains blank spaces or upper letters by dots and
    lower letters
    """
    for i, filename in enumerate(file_list):
        dirname, basename = os.path.split(filename)
        if ' ' in basename or not basename.islower():
            new_name = basename.lower().replace(' ', '.')
            renamed_file = os.path.join(dirname, new_name)
            shutil.move(filename, renamed_file)
            file_list[i] = renamed_file
            print file_list[i]

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print 'usage: python fix_name.py FOLDER'
    folder = sys.argv[1]
    print 'This program is going to change name of many files.'
    confirm = raw_input('Are you sure to continue? (y/n) ')
    if confirm == 'y':
        dirs_and_files = get_files_and_subdirs(folder)
        escape_space_and_uppercase(dirs_and_files[::-1])
        print 'Done successfully'

