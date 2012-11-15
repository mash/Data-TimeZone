use Test::More;
use Data::TimeZone;
use POSIX;

is( Data::TimeZone->is_valid_name( 'Asia/Tokyo' ), 1 );
is( Data::TimeZone->is_valid_name( 'Asia/Kamakura' ), 0 );

my $tokyo_tzoffset = Data::TimeZone->tzoffset_for_timezone( 'Asia/Tokyo' );
is( $tokyo_tzoffset, 32400 );
isa_ok( $tokyo_tzoffset, 'Time::Seconds' );

my $london_tzoffset = Data::TimeZone->tzoffset_for_timezone( 'Europe/London' );
is( $london_tzoffset, 0 );

my @tokyo_localtime = Data::TimeZone->localtime_for_timezone( 'Asia/Tokyo' );
my @london_localtime = Data::TimeZone->localtime_for_timezone( 'Europe/London' );

is( POSIX::strftime( "%s", @tokyo_localtime ) - POSIX::strftime( "%s", @london_localtime ),
    32400 );

done_testing;
