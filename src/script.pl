use strict;
use warnings;
use PDL;
use PDL::IO::HDF5;
use AutoLoader;
use PDL::Graphics::PLplot;

# Open HDF file
my $file = new PDL::IO::HDF5("MOD05_L2.A2010001.0000.006.2015041171924.h5");

# Navigate to the group
my $group = $file->group("mod05/Data Fields");

# Set the data range
my $start=pdl([0,0]);
my $end=pdl([50,0]);
my $stride=pdl([2,1]);

# Get the data
my $solar_zenith = $group->dataset("Solar_Zenith")->get($start,$end,$stride);
my $water_vapor_near_infrared = $group->dataset("Water_Vapor_Near_Infrared")->get($start,$end,$stride);

# Plot the data
my $pl = PDL::Graphics::PLplot->new (DEV => "svg", 
                                     FILE => "result.svg");

$pl->xyplot($solar_zenith,$water_vapor_near_infrared,
    PLOTTYPE => 'LINE',
    COLOR => 'RED', 
    LINEWIDTH => 2,
    TITLE => 'Solar Zenith vs Water Vapor Near Infrared',
    XLAB => 'Solar Zenith',
    YLAB => 'Water Vapor Near Infrared');

$pl->close;