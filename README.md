PROJECT BUILDER
===============

## Description

**Parallelize a build process** and reduce build time. Given a project directory and a build script (`builder.pl`), you need to figure out how to parallelize it. `builder.pl` takes certain inputs and you can configure certain aspects. You can't modify `builder.pl`, it's essentially a blackbox, although it's open source.

There's a problem though, multiple instances of `builder.pl` can't run in the same build directory because they will clash and interfere with each other. Ensure that they don't interfere and the resulting output produced in parallel is the same as the output produced without parallelization.

## Usage
Normal `builder.pl` run:

```
~ $ cd project-builder
~/project-builder $ bin/builder.pl
```

Resulting output are in `./build` directory

Get help:

```
~/project-builder $ bin/builder.pl -h
```

## Requirements:
- Notable improvement in time
- Parallel builder should not need to take any arguments
- `builder.pl` should still be used, ie. cannot rewrite `builder.pl`
- Resulting `build` directory in project should be same as normal `builder.pl` run
- Running `bin/checker.sh` should pass without errors and print `Good job!`
