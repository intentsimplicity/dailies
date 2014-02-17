#!/usr/bin/env perl

use strict;
use warnings;
use File::Spec;


# Setup paths
my $base_path = File::Spec->curdir();
my $import_path = File::Spec->catdir($base_path, 'import');
my $export_path = File::Spec->catdir($base_path, 'export');


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


# Capture image
sub capture_image {
  my $connection = check_connection;
  if ($connection =~ /\d/) {
    chdir $import_path;
    my @response = `gphoto2 --capture-image-and-download`;
  }
}


capture_image;