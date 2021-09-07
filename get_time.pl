#!/usr/bin/perl
use strict;
use warnings;
use File::stat;
use Time::localtime;

open OUT, ">test.txt" || die;
my @amr = glob("*.jpg");
foreach  (@amr) {
	my $name;
	if (/(\S+)_\d+.jpg/) {
		$name = $1;
	}elsif(/(\S+).jpg/) {
		$name = $1;
	}
	my $timestamp = ctime(stat($_)->mtime);
	my @time = split /\s+/, $timestamp;
	$time[1] = month($time[1]);
	$time[2] = day($time[2]);
	$time[3] =~ s/\:/./g;
	my $new_name = $time[4] . "-" . $time[1] . "-" . $time[2] . "_" . $name . ".jpg";
	print OUT $_ . "\t" . $new_name . "\n";
	system ("mv $_ $new_name");
	#print OUT $_ . "\t" . $time[4] . $time[1] . $time[2] . "_" . $time[3] . "_" . $time[0] . "\n";
}
close OUT;
#Wed Aug 26 05:40:31 2020

sub month {
	my $month = shift;
	if ($month eq "Jan") {
		$month = "01";
	}elsif ($month eq "Feb") {
		$month = "02";
	}elsif ($month eq "Mar") {
		$month = "03";
	}elsif ($month eq "Apr") {
		$month = "04";
	}elsif ($month eq "May") {
		$month = "05";
	}elsif ($month eq "Jun") {
		$month = "06";
	}elsif ($month eq "Jul") {
		$month = "07";
	}elsif ($month eq "Aug") {
		$month = "08";
	}elsif ($month eq "Sep") {
		$month = "09";
	}elsif ($month eq "Oct") {
		$month = "03";
	}elsif ($month eq "Nov") {
		$month = "10";
	}elsif ($month eq "Dec") {
		$month = "11";
	}
	return $month;
}

sub day {
	my $day = shift;
	if ($day == 1) {
		$day = "01";
	}elsif ($day == 2) {
		$day = "02";
	}elsif ($day == 3) {
		$day = "03";
	}elsif ($day == 4) {
		$day = "04";
	}elsif ($day == 5) {
		$day = "05";
	}elsif ($day == 6) {
		$day = "06";
	}elsif ($day == 7) {
		$day = "07";
	}elsif ($day == 8) {
		$day = "08";
	}elsif ($day == 9) {
		$day = "09";
	}
	return $day;
}