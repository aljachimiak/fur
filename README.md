# FUR

Fur is a experiment to reproduce git functionality using `bash` and `ruby`.

## Why Fur?
Fur has been named as a letter translation from git.  If you take a look your keyboard, move each keystroke from `git` one to the left and you will get `fur`.

This is a nod to the [often mistaken](http://en.wikipedia.org/wiki/HAL_9000#Origin_of_name) origin of the name for HAL 9000.

## Getting Started
You will need to have [Vagrant](http://vagrantup.com) installed.

Using `vagrant up` should give bring up a Fedora 19 box.  The box has been configured to add your project folder to the `$PATH` so you can quickly test scripts.

** Fedora 19?
Yup.  Because of this:
```bash
$ ruby --version
$  ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-linux]
```

Special thanks to [r0b0ticus](https://github.com/r0b0ticus) for the Fedora 19 vagrant box.  You can find out more at his [blog](http://readonlyfriday.com/blog/2013/07/05/fedora-19-with-vagrant/).