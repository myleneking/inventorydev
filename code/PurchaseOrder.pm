use utf8;
package Sellco::DBIC::Schema::Result::PurchaseOrder;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=encoding utf8

=head1 NAME

Sellco::DBIC::Schema::Result::PurchaseOrder - 発注

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=item * L<DBIx::Class::InflateColumn::Serializer>

=item * L<Sellco::DBIC::WinasSQLT>

=item * L<Sellco::DBIC::WinasLoadOptions>

=item * L<Sellco::DBIC::WinasSeqGenerate>

=item * L<Sellco::DBIC::WinasDisplay>

=back

=cut

__PACKAGE__->load_components(
  "InflateColumn::DateTime",
  "TimeStamp",
  "InflateColumn::Serializer",
  "+Sellco::DBIC::WinasSQLT",
  "+Sellco::DBIC::WinasLoadOptions",
  "+Sellco::DBIC::WinasSeqGenerate",
  "+Sellco::DBIC::WinasDisplay",
);

=head1 TABLE: C<purchase_orders>

=cut

__PACKAGE__->table("purchase_orders");

__PACKAGE__->source_info({
    comments => '発注',
    extra => {
        mysql_table_type => 'InnoDB',
        mysql_charset => 'utf8',
    }
});

=head1 ACCESSORS

=head2 company_id

  comments: '企業ID'
  data_type: 'integer'
  is_nullable: 0

企業ID

=head2 purchase_order_no

  comments: '発注伝票番号'
  data_type: 'integer'
  is_nullable: 0
  winas_seq_generate: ["company_id"]

発注伝票番号

=head2 purchase_order_date

  comments: '発注日'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1
  timezone: 'Asia/Tokyo'

発注日

=head2 modified_by

  comments: '更新者ID'
  data_type: 'integer'
  is_nullable: 1

更新者ID

=head2 purchase_order_state

  comments: '発注伝票状態'
  data_type: 'smallint'
  is_nullable: 1

発注伝票状態

=head2 purchase_order_amount

  comments: '合計金額'
  data_type: 'decimal'
  is_nullable: 1
  size: [9,0]

合計金額

=head2 purchase_order_minimum_amount

  comments: '金額条件'
  data_type: 'decimal'
  is_nullable: 1
  size: [9,0]

金額条件

=head2 purchase_order_minimum_quantity

  comments: '数量条件'
  data_type: 'decimal'
  is_nullable: 1

数量条件

=head2 supplier_order_condition

  comments: '発注条件'
  data_type: 'smallint'
  is_nullable: 1

発注条件

=head2 purchase_order_note

  comments: '特記事項'
  data_type: 'text'
  is_nullable: 1

特記事項

=head2 supplier_no

  comments: '仕入先番号'
  data_type: 'integer'
  is_nullable: 0

仕入先番号

=head2 supplier_sub_no

  comments: '仕入先枝番'
  data_type: 'smallint'
  default_value: 1
  is_nullable: 0

仕入先枝番

=cut

__PACKAGE__->add_columns(
  "company_id",
  {
    comments    => "企業ID",
    data_type   => "integer",
    is_nullable => 0,
  },
  "purchase_order_no",
  {
    comments => "発注伝票番号",
    data_type => "integer",
    is_nullable => 0,
    winas_seq_generate => ["company_id"],
  },
  "purchase_order_date",
  {
    comments => "発注日",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
    timezone => "Asia/Tokyo",
  },
  "modified_by",
  {
    comments    => "更新者ID",
    data_type   => "integer",
    is_nullable => 1,
  },
  "purchase_order_state",
  {
    comments    => "発注伝票状態",
    data_type   => "smallint",
    is_nullable => 1,
  },
  "purchase_order_amount",
  {
    comments => "合計金額",
    data_type => "decimal",
    is_nullable => 1,
    size => [9, 0],
  },
  "purchase_order_minimum_amount",
  {
    comments => "金額条件",
    data_type => "decimal",
    is_nullable => 1,
    size => [9, 0],
  },
  "purchase_order_minimum_quantity",
  {
    comments    => "数量条件",
    data_type   => "decimal",
    is_nullable => 1,
  },
  "supplier_order_condition",
  {
    comments    => "発注条件",
    data_type   => "smallint",
    is_nullable => 1,
  },
  "purchase_order_note",
  {
    comments    => "特記事項",
    data_type   => "text",
    is_nullable => 1,
  },
  "supplier_no",
  {
    comments    => "仕入先番号",
    data_type   => "integer",
    is_nullable => 0,
  },
  "supplier_sub_no",
  {
    comments      => "仕入先枝番",
    data_type     => "smallint",
    default_value => 1,
    is_nullable   => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</company_id>

=item * L</purchase_order_no>

=back

=cut

__PACKAGE__->set_primary_key("company_id", "purchase_order_no");


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-03-05 20:22:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pSeC2GgKNcaHvSmrQVBwbA

=head1 RELATIONS

=head2 belongs_to

company, supplier

=cut

__PACKAGE__->belongs_to(
    'company' => 'Sellco::DBIC::Schema::Result::Company',
    'company_id',
    {
        is_deferrable => 1,
        is_foreign_key_constraint => 0,
    }
);

__PACKAGE__->belongs_to(
    'supplier' => 'Sellco::DBIC::Schema::Result::Supplier',
    {
        'foreign.company_id' => 'self.company_id',
        'foreign.supplier_no' => 'self.supplier_no',
        'foreign.supplier_sub_no' => 'self.supplier_sub_no',
    },
    {
        is_deferrable => 1,
        is_foreign_key_constraint => 0,
    }
);

=head2 has_many

purchase_order_details, purchases

=cut

__PACKAGE__->has_many(
    'purchase_order_details' => 'Sellco::DBIC::Schema::Result::PurchaseOrderDetail',
    {
        'foreign.company_id' => 'self.company_id',
        'foreign.purchase_order_no' => 'self.purchase_order_no',
    },
    {
        cascade_copy => 1,
        cascade_delete => 1,
    },
);

__PACKAGE__->has_many(
    'purchases' => 'Sellco::DBIC::Schema::Result::Purchase',
    {
        'foreign.company_id' => 'self.company_id',
        'foreign.purchase_order_no' => 'self.purchase_order_no',
    },
    {
        cascade_copy => 0,
        cascade_delete => 0,
    },
);

=king
__PACKAGE__->has_many(
    'business_partners',
    'Sellco::DBIC::Schema::Result::BusinessPartner',
    {
        'foreign.company_id' => 'self.company_id',
    },
    {
        cascade_copy => 0,
        cascade_delete => 0,
    },
);

__PACKAGE__->has_one(
    'business_partner',
    'Sellco::DBIC::Schema::Result::BusinessPartner',
    {
         'foreign.company_id' => 'self.company_id'
        ,'foreign.business_partner_no' => 'self.supplier_no'
    },
    {
        cascade_copy => 0,
        cascade_delete => 0,
    },
);
=cut

#__PACKAGE__->many_to_many(business_partners => 'busines_partner','purchase_order');

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
