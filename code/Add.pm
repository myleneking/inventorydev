package Sellco::Web::Controller::PurchaseOrder::Add;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller::HTML::FormFu' };
with 'Sellco::Web::Controller::Role::Util';
with 'Sellco::Web::Controller::Role::HFFUtil';

__PACKAGE__->config({
    namespace=>'purchase_order/add'
});

use HTML::FormFu;

=head1 NAME

Sellco::Web::Controller::PurchaseOrder::Add - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) { $_[1]->go('add'); }

=head3 add

=cut

sub add :Local :Args(0) {
    my ( $self, $c ) = @_;

    my $rs = [$c->model('SellcoDB::PurchaseOrderDetail')->search(
        {
            'me.company_id' => $c->session->{company_id}
        }
       ,{
            columns => [ 'me.purchase_order_sub_no'
                        ,'me.product_code'
                        ,'me.purchase_order_product_name'
                        ,'me.purchase_order_product_opt'
                        ,'me.purchase_order_product_price'
                        ,'me.purchase_order_product_quantity'
                        ,'me.purchase_order_product_amount'
                        ,'me.purchase_order_product_class'
                        ,'me.purchase_expected_date'
                        ,'me.sales_order_no'
                        ,'me.sales_order_sub_no'
                        ,'me.order_date'
                        ,'me.arriaval_quantity'
                        ,'me.complete'
                        ,'product.supplier_order_lot'
                        ,'me.purchase_order_sub_no'
                        ,'me.purchase_order_note' ]
           ,join => { 'product' }
           ,order_by => { -desc => 'me.purchase_order_no' }

        }
    )];

    $c->stash(table_entry => $rs
             ,template => 'purchase_order/add.tt');
}


=head1 AUTHOR

Mylene King,Mandaluyong Philippines,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
