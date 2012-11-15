use inc::Module::Install;
name 'Data-TimeZone';
all_from 'lib/Data/TimeZone.pm';

requires 'Time::Piece';
requires 'POSIX';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
