package MyApp::Model::Auth;

use Mojo::Log;
use parent Mojo::mysql;
use Passwords;

use Data::Dumper;

use strict;

my $log = Mojo::Log->new();

sub new {
    my $class = shift;
    my $dbh   = shift;

    return bless {
        DBH   => $dbh,
        TABLE => 'password',
    }, $class;
}

sub register {
    my $self     = shift;
    my $handle   = shift;
    my $email    = shift;
    my $password = shift;

    $password = password_hash($password);

    return $self->{DBH}->db->insert( $self->{TABLE}, { handle => $handle, email => $email, password => $password } );
}

sub authenticate {
    my $self     = shift;
    my $handle   = shift;
    my $password = shift;

    my $user = $self->{DBH}->db->select( $self->{TABLE}, undef, { handle => $handle } )->hash;

    if ( $user && password_verify( $password, $user->{password} ) ) {
        return $user->{id};
    }

    return 0;
}

1;
