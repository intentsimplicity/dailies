#!/usr/bin/env perl

use strict;
use warnings;
use File::Spec;
use Smart::Comments


# Setup paths
my $base_path = File::Spec->curdir();
my $import_path = File::Spec->catdir($base_path, 'import');
my $export_path = File::Spec->catdir($base_path, 'export');


# Check camera connection
sub check_connection {
  
  ### Running Auto-Detect...
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
  
  ### Checking Connection...
  my $connection = check_connection;
  if ($connection =~ /\d/) {
    
    ### Moving to Import Directory...
    chdir $import_path;
    
    ### Capturing Image...
    my @response = `gphoto2 --capture-image-and-download`;
    if (scalar @response =~ /Deleting/) {
      print "Image downloaded...\n";
    } else {
      die "Could not download the image."
    }
  }
}


capture_image;