package Maypole::Plugin::Exception;

use strict;
use NEXT;

our $VERSION = '0.03';

Maypole::Config->mk_accessors('exceptions');

=head1 NAME

Maypole::Plugin::Exception - Simple Exception classes

=head1 SYNOPSIS

Simple example:

    package MyApp;

    use Maypole::Application qw(Exception);

    MyApp->config->exceptions(
        SessionException => { description => 'Unable to access session' },
        LoginException   => { description => 'Login failed' }
    );
    MyApp->setup( 'dbi:Pg:dbname=myapp', 'myuser', 'mypass' );

With Maypole::Plugin::Config::YAML:

    package MyApp;

    use Maypole::Application qw(Config::YAML Exception -Setup);

    __DATA__
    --- #YAML:1.0
    application_name: MyApp
    dsn: dbi:Pg:dbname=myapp
    user: postgres
    pass: 0
    opts:
      AutoCommit: 1
    template_root: '/home/sri/MyApp/templates'
    uri_base: http://localhost/myapp
    exceptions:
      SessionException:
        description: Unable to access session
      LoginException:
        description: Login failed

=head1 DESCRIPTION

Generates exception classes for you.
Useful in combination with Maypole::Plugin::Config::YAML.

Note that you need Maypole 2.0 or newer to use this module!

=cut

sub setup {
    my $r = shift;
    $r->NEXT::DISTINCT::setup(@_);
    require Exception::Class;
    import Exception::Class %{ $r->config->exceptions };
}

=head1 AUTHOR

Sebastian Riedel, C<sri@oook.de>

=head1 LICENSE

This library is free software. You can redistribute it and/or modify it under
the same terms as perl itself.

=cut

1;
