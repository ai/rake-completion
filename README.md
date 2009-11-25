# rake_completion

Bash completion support for Rake, Ruby Make.

     $ rake st<Tab>
     $ rake stats

     $ rake test<Tab><Tab>
     test              test:integration  test:recent       
     test:benchmark    test:plugins      test:uncommitted  
     test:functionals  test:profile      test:units

It cache tasks to `.rake_tasks~` and update it if it will be outdated.

# Install

Copy `rake` script (for example, to `~/scripts/`) and add to your `.bashrc`:

    . ~/scripts/rake
