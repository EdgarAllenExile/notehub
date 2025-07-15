# Shell Notes

## Commands / Terminal Programs

### Logic

`&&` and `||` are logical operators meaning and / or respectively. 

- They both await the exit codes of  the preceeding program and then execute the given command. 
    - Or is waiting to recive its first 0 results code and then will execute that limb.
    - And is waiting for the same, but will only check the second limb if the first passes.

`false || print false` will print false, `true || print true` does not print.
`false %% print false` will not print, `true %% print true` will print true.

### Quotes

Double quotes will expand variables, like interpolation. `print "$var world"` will print the value of var.
Singles are string literals.

### Piping

Called process substitution if you are a nerd, < saves the output to a temp file and can send to the next command.

As an example `cat <(ls)` will print the result of ls to a file. I think this is the same thing as `ls < cat`?

- $x is how you find things about scripts
    - $0 script name
    - $1-9 arguments
    - $# num of arguments
    - $$ process PID 
    - $@ all arguments, used for logic loops
    - $var is how you refer to variables 
    - $? Output with loop? Error code?
- <> input and output 
    - `>` direct successful output
    - 2> direct error output
    - `>>` append

### Misc Notes

Using * as a wild card is called globbing.

Using curly braces expands strings and variables. As an example, `image.{png,jpg}` will expand into `image.png image.jpg`.

## Other Tools to Consider

ShellChecker

- Parser and LSP / Interpretter for shell commands

Man

- Gives you the manual of a command.

tldr

- Gives you the quick and dirty man.

find

- Finds files by name. Can take a variety of flags such as:
    - Path, can be .
    - Flags, such as -name or -path or -type (d for dir f for file) -modified
    - can find and then do something with `exec`

Locate

- Like find but actually indexes files so is fast. Can be manually called with `UpdateDB`.

grep

- Fuzzy finder within files. Takes regex.
- also has RipGrep, which might not be a standard program. 
    - RipGrep shows you context and other shit.

History

- Kinda obvious.

fzf

- Interactive Finder

source

- Reloads files? At least that is how it is used to reload configs in vim and wezterm.
