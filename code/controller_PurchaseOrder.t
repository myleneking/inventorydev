use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Sellco::Web';
use Sellco::Web::Controller::PurchaseOrder;

ok( request('/purchaseorder')->is_success, 'Request should succeed' );
done_testing();
