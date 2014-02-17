#!/usr/bin/env perl

use strict;
use warnings;

# Check camera connection
sub check_connection {
  my @response = `gphoto2 --auto-detect`;
  if (scalar @response gt 2) {
    my $count = scalar @response - 2;
    if ($count eq 1) {
      print "${count} camera connected.\n\n";
    } else {
      print "${count} cameras connected.\n\n";
    }
  } else {
    die "Oops! Please check the camera's power.\n\n";
  }
}

check_connection