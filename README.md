# Warning: this project is obsolete

Updates and support are no longer provided. Feel free to improve it.

-----

# Rake Completion

Bash completion support for Rake, Ruby Make.

     $ rake st<Tab>
     $ rake stats

     $ rake test<Tab><Tab>
     test              test:integration  test:recent       
     test:benchmark    test:plugins      test:uncommitted  
     test:functionals  test:profile      test:units

It caches tasks to `.rake_tasks~` file, which makes it faster from default completion from Ubuntu rake.

If Rakefile is not present in current directory, autocomplete will try to locate it in
parent directories up to filesystem root, so running tasks is also possible from subdirectories.

## Install

### Ubuntu

Obsolete: the package is no longer available at PPA.

~~1. Add Ubuntu on Rails PPA:~~
   
        $ sudo add-apt-repository ppa:ubuntu-on-rails/ppa
        $ sudo apt-get update
        
~~2. Install `rake-completion` package:~~
   
        $ sudo apt-get install rake-completion

### Mac + Homebrew

Make sure you are running an up-to-date `bash` version (at least 4.3).

Installing bash and bash-completion with [homebrew](http://brew.sh/) run:

    $ brew install bash bash-completion

Then install this script:

    $ curl -o /usr/local/etc/bash_completion.d/rake https://raw.githubusercontent.com/ai/rake-completion/master/rake


### Other UNIX-like

#### System

Copy `rake` script to `/etc/bash_completion.d/`.

    $ wget -O /etc/bash_completion.d/rake https://raw.githubusercontent.com/ai/rake-completion/master/rake

#### User

Copy `rake` script (for example, to `~/scripts/`) and add to your `.bashrc`:

    . ~/scripts/rake

## Cache

Tasks cache in `.rake_tasks~` file is placed in directory with Rakefile and
will be updated on changes in Rakefile or any `*.rake` files.

To remove tasks cache (and another backup files) from Git repository add `*~` to
`.gitignore` file.
