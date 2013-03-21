package Sellco::Web::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=encoding utf8

=head1 NAME

Sellco::Web::Controller::Root - Root Controller for Sellco

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash->{template} = 'index.tt';
#    $c->stash->{template} = 'welcome.tt';
}

=head2 auto

=over 4

=item * デバック用とアクションはそのまま実行

=item * それ以外は、auth/check_login に転送してログイン状態をチェックする

=back

=cut

my @pass_through_check_login = (
    [ '', 'clear'],
);

=myking
sub auto : Private {
    my ( $self, $c ) = @_;

    # デバック時に、特定の条件でログインチェックを省く
    if ($c->debug) {
        for (@pass_through_check_login) {
            if ($_[0] eq $c->namespace and $_[1] eq $c->action->name) {
                return 1
            }
        }
        return 1 if $c->stash->{__pass_throug_check_login};
    }

    $c->forward('/auth/check_login') or return 0;

    if ($c->debug) {
        $c->forward('/auth/fetch_basic_info');
    }

    return 1;
}
=cut

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;

    if ($c->debug) {
        return if $c->forward('debug/debug_default');
    }

    $c->stash->{template} = 'nofound.tt';
    $c->response->status(404);
}

=head2 begin

=cut

sub begin :Private {
    my ( $self, $c ) = @_;

    # I18N が有効ならば、ja を指定
    if (my $code = $c->can('languages')) {
        $c->$code(['ja']);
    }
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {
    my ( $self, $c ) = @_;

#     if (scalar @{$c->error}) {
#         $c->stash(
#             errors => $c->error,
#             template => 'error.tt',
#         );
#         $c->clear_errors();
#     }
}

=head2 clear

デバック用。
セッションデータを完全に消去する。

=cut

sub clear :Local :Args(0) {
    my ( $self, $c ) = @_;

    $c->delete_session;
    $c->response->redirect($c->uri_for('/'));
}

=head1 SEE ALSO

L<Catalyst>,

L<Sellco::Web>

=head1 AUTHOR

ウィナス技術開発部 C<< <technical@winas.jp> >>,
Shoichi Fukusaka C<< <fukusaka@winas.jp> >>

=head1 COPYRIGHT

Copyright (c) 2012 Winas, INC. All Rights Reserved.

=cut

#NOPOD
__PACKAGE__->meta->make_immutable;
1;
