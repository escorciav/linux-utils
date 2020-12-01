# Unix tricks

## Executing a process over a list of files or directories

Last time, I had a list of directories and I wanted to know the number of files on it.

I put all the directories inside a textfile (called `list-of-directories.txt`). One line per directory.

```bash
touch dummy; for i in $(cat list-of-directories.txt); do ls $i/*.png | wc -l >> dummy; done;
```

The result is save in a file called `dummy`

*Note*: It might not work, if your file contains multiple columns.

## Creating TSV file from two files

This one is very useful if you use CSV files.

```bash
paste file1 file2 | column -s $',' -t >> dummy
```

It creates a CSV file called `dummy` from `file1` and `file2`. We can edit this file to generate TSV file:

```bash
sed -i 's/,/\t/g' dummy
```

[credits](http://unix.stackexchange.com/a/16465), [credits](http://www.unix.com/unix-for-dummies-questions-and-answers/63747-converting-csv-tsv-back.html)

## Add prefix string to beginning of each line

Create new file:

`sed -e 's/^/prefix/' file > file.new`

Edit file in-place:

`sed -i -e 's/^/prefix/' file`

[credits](http://stackoverflow.com/questions/2099471/add-a-prefix-string-to-beginning-of-each-line)

## Append string at the end of each line

It will append `.hdf5` at the end of each line in input.lst and create a new file called output.lst

```bash
sed 's/.*/&.hdf5/'  input.lst > output.lst
```

[credits](http://stackoverflow.com/questions/15978504/add-text-at-the-end-of-each-line)

## Delete first character of each line

Replace 5 by the number of characters to delete

`sed 's/^.\{5\}//' file.dat`

[credits](http://stackoverflow.com/questions/3795512/delete-the-first-5-chars-on-any-line-of-a-textfile-in-linux-with-sed?lq=1)

## Append string at the end of the first column

`awk '{ gsub($1, $1"/", $1); print $0}' file >> file.new`

## Format integer column with AWK

Let say you have a file that looks like this

```
foo 0
hola 11
adios 2
chao 3
```

and you need a trail of 5 digits in the integer column

```
foo 00000
hola 00011
adios 00002
chao 00003
```

You can do it with:

```bash
awk '{printf "%s %05d\n", $1, $2}' < input.lst > output.lst
```

## Split long text-file

There is a command called `split` in linux :wink:

```bash
my_file=output.lst; n_files=25; a=(`wc -l $my_file`); lines=`bc <<< "$a/$n_files"` ; split -l $lines -d  $my_file output.lst-
```

Make sure you change the location of your file at the begining (next to `my_file` variable) and the number of files that you want (`n_files` variable). You should find 25 files with a name like `output.lst-%02d` if you do not change the last part.

[credits](http://stackoverflow.com/questions/19031144/how-to-split-one-text-file-into-multiple-txt-files)

## Editing textfiles with awk

[This website](http://www.ibm.com/developerworks/library/l-awk1/) is a good place to get strated with AWK

Extra help for awk commands:

- [Find and replace](http://www.cyberciti.biz/faq/awk-find-and-replace-fields-values/)
