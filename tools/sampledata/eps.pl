#!/usr/bin/perl -w

use strict;
use Time::HiRes qw|time|;

my $start=time;
my $lps=2;

$lps=shift @ARGV if @ARGV;
my $sleepPerLine=1/$lps;

print &&
    select undef,undef,undef,($start + $sleepPerLine*$. - Time::HiRes::time)
    while <>
