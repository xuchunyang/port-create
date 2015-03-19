#!/usr/bin/env tclsh
#
# Create a Portfile from a tarball URL
#
# Example URL: https://www.kernel.org/pub/software/scm/git/git-2.3.3.tar.gz
#

# Get tarball filename from tarball URL
proc get_tarball_filename {url} {
    set length [string length $url]
    set last [string last "/" $url]
    incr last;                  # Discard prefix "/"
    return [string range $url $last $length]
}

# Get name from tarball filename
proc get_name {tarball} {
    set last_dash [string last "-" $tarball]
    incr last_dash -1;          # Discard suffix "-"
    return [string range $tarball 0 $last_dash]
}

# Get version from tarball filename
proc get_version {tarball} {
    set rtv [regexp {(\d+\.)?(\d+\.)?(\*|\d+)} $tarball match]
    if {$rtv == 1} {
        return $match
    } else {
        return 0
    }
}

package require cmdline 1.3.1

set options {
    {url.arg      ""  "set the tarball URL"}
    {name.arg     ""  "set the name of port"}
    {version.arg  ""  "set the version of port"}
}
array set params [::cmdline::getoptions argv $options]

set url $params(url)
set name $params(name)
set version $params(version)

if {$url != ""} {
    set tarball [get_tarball_filename $url]
    if {$name == ""} {
        set name [get_name $tarball]
    }
    if {$version == ""} {
        set version [get_version $tarball]
    }
}

puts "name:    $name"
puts "version: $version"

# exec ./portfile-gen.tcl $name $version

# -*- coding: utf-8; mode: tcl; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*- vim:fenc=utf-8:ft=tcl:et:sw=4:ts=4:sts=4
