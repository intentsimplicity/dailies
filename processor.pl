#!/usr/bin/env perl

use strict;
use warnings;

# Set paths
my $import_path = "/import";
my $export_path = "/export";
my $config_path = "/config";

# Check camera connection
sub check_connection {
  my @response = `gphoto2 --auto-detect`;
  if (scalar @response gt 2) {
    print "Camera connected!\n\n";
  } else {
    die "No camera connected!\n\n"
  }
}

check_connection