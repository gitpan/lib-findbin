use Test::More tests => 5;

BEGIN {
    require_ok('lib::findbin');
}

diag("Testing lib::findbin $lib::findbin::VERSION");

my @INC_ORIG = @INC;

lib::findbin->import();
is_deeply( \@INC, [ "$FindBin::Bin/lib", "$FindBin::Bin/../lib", @INC_ORIG ], 'No arg: Added OK' );

lib::findbin->unimport();
is_deeply( \@INC, \@INC_ORIG, 'No arg: Removed OK' );

lib::findbin->import('foo');
is_deeply( \@INC, [ "$FindBin::Bin/foo", @INC_ORIG ], 'Arg: Added OK' );

lib::findbin->unimport('foo');
is_deeply( \@INC, \@INC_ORIG, 'Arg: Removed OK' );

