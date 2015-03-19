#!/usr/bin/env tclsh
#
# Create a Portfile from a tarball URL
#
# Usage: ./port-create.tcl <URL>
# example URL: https://www.kernel.org/pub/software/scm/git/git-2.3.3.tar.gz
#
# TODO:
# - Add [--set-name <name] and [--set-version version] options
# - Generate tarball checksum, add --no-fetch option
# - Support Github-flavoured tarbarll URL, i.e.,
#   https://github.com/magit/magit/archive/1.2.2.tar.gz
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

if {[llength $::argv] != 1} {
    puts stderr "Error: missing URL"
    puts stderr "Usage: $::argv0 <URL>"
    exit 1
}

set url [lindex $::argv 0]
set tarball [get_tarball_filename $url]
set portname [get_name $tarball]
set portversion [get_version $tarball]

puts "name:    $portname"
puts "version: $portversion"

# exec ./portfile-gen.tcl $portname $portversion

# -*- coding: utf-8; mode: tcl; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*- vim:fenc=utf-8:ft=tcl:et:sw=4:ts=4:sts=4
