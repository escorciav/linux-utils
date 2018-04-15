from argparse import ArgumentParser, ArgumentDefaultsHelpFormatter
import os
import shutil


def main(args):
    os.makedirs(args.output_dir, exist_ok=True)

    for dirname in args.dirnames:
        if not(os.path.isdir(dirname)):
            continue

        for basename in os.listdir(dirname):
            src = os.path.join(dirname, basename)
            if not os.path.isfile(src):
                continue

            dest = os.path.join(args.output_dir, basename)
            if not os.path.isfile(dest):
                shutil.copy(src, dest)
                continue

            if os.path.getsize(src) > os.path.getsize(dest):
                shutil.copy(src, dest)


if __name__ == '__main__':
    parser = ArgumentParser(
        description=('Copy files from multiple folders and overwrite based on '
                     'size'),
        formatter_class=ArgumentDefaultsHelpFormatter)
    parser.add_argument('-dirs', '--dirnames', required=True, nargs='+')
    parser.add_argument('-o', '--output-dir', required=True)
    args = parser.parse_args()

    main(args)
