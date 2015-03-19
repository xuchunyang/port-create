# `port-create(1)`
Generate MacPorts Portfile template

## Usage
```
./port-create.tcl -url URL [-name <name>] [-version <version>]
```

## Todo
- [x] Add [-name <name>] and [-version <version>] options
- [ ] Generate tarball checksum, add [-no-fetch] option
- [ ] Support Github-flavoured tarbarll URL, i.e.,
      https://github.com/magit/magit/archive/1.2.2.tar.gz

## Note
`portfile-gen.tcl` was copied from
http://trac.macports.org/browser/contrib/portfile-gen/portfile-gen (2015-03-19)
