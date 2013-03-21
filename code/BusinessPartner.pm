use utf8;
package Sellco::DBIC::Schema::Result::BusinessPartner;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=encoding utf8

=head1 NAME

Sellco::DBIC::Schema::Result::BusinessPartner - 取引先

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

=head1 TABLE: C<business_partners>

=cut

__PACKAGE__->table("business_partners");

__PACKAGE__->source_info({
    comments => '取引先',
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

=head2 business_partner_no

  comments: '取引先番号'
  data_type: 'integer'
  is_nullable: 0
  winas_seq_generate: ["company_id"]

取引先番号

=head2 created_at

  comments: '作成日時'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1
  set_on_create: 1
  timezone: 'Asia/Tokyo'

作成日時

=head2 modified_at

  comments: '更新日時'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1
  set_on_create: 1
  set_on_update: 1
  timezone: 'Asia/Tokyo'

更新日時

=head2 modified_by

  comments: '更新者ID'
  data_type: 'integer'
  default_value: 2
  is_nullable: 1

更新者ID

=head2 business_partner_code

  comments: '取引先コード'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

取引先コード

=head2 business_partner_name

  comments: '取引先名'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

取引先名

=head2 business_partner_kana

  comments: '取引先カナ'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

取引先カナ

=head2 business_partner_postcode

  comments: '郵便番号'
  data_type: 'varchar'
  is_nullable: 1
  size: 16

郵便番号

=head2 business_partner_prefecture

  comments: '都道府県'
  data_type: 'integer'
  is_nullable: 1

都道府県

=head2 business_partner_address1

  comments: '住所1'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

住所1

=head2 business_partner_address2

  comments: '住所2'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

住所2

=head2 business_partner_phone

  comments: '電話番号'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

電話番号

=head2 business_partner_fax_phone

  comments: 'FAX番号'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

FAX番号

=head2 business_partner_email

  comments: 'メールアドレス'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

メールアドレス

=head2 business_partner_is_supplier

  comments: '仕入先フラグ'
  data_type: 'tinyint'
  default_value: 1
  is_nullable: 1

仕入先フラグ

=head2 business_partner_is_buyer

  comments: '卸先フラグ'
  data_type: 'tinyint'
  default_value: 0
  is_nullable: 1

卸先フラグ

=cut

__PACKAGE__->add_columns(
  "company_id",
  {
    comments    => "企業ID",
    data_type   => "integer",
    is_nullable => 0,
  },
  "business_partner_no",
  {
    comments => "取引先番号",
    data_type => "integer",
    is_nullable => 0,
    winas_seq_generate => ["company_id"],
  },
  "created_at",
  {
    comments => "作成日時",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
    set_on_create => 1,
    timezone => "Asia/Tokyo",
  },
  "modified_at",
  {
    comments                  => "更新日時",
    data_type                 => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable               => 1,
    set_on_create             => 1,
    set_on_update             => 1,
    timezone                  => "Asia/Tokyo",
  },
  "modified_by",
  {
    comments      => "更新者ID",
    data_type     => "integer",
    default_value => 2,
    is_nullable   => 1,
  },
  "business_partner_code",
  {
    comments => "取引先コード",
    data_type => "varchar",
    is_nullable => 0,
    size => 255,
  },
  "business_partner_name",
  {
    comments => "取引先名",
    data_type => "varchar",
    is_nullable => 0,
    size => 255,
  },
  "business_partner_kana",
  {
    comments => "取引先カナ",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "business_partner_postcode",
  {
    comments => "郵便番号",
    data_type => "varchar",
    is_nullable => 1,
    size => 16,
  },
  "business_partner_prefecture",
  {
    comments    => "都道府県",
    data_type   => "integer",
    is_nullable => 1,
  },
  "business_partner_address1",
  {
    comments => "住所1",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "business_partner_address2",
  {
    comments => "住所2",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "business_partner_phone",
  {
    comments => "電話番号",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "business_partner_fax_phone",
  {
    comments => "FAX番号",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "business_partner_email",
  {
    comments => "メールアドレス",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "business_partner_is_supplier",
  {
    comments      => "仕入先フラグ",
    data_type     => "tinyint",
    default_value => 1,
    is_nullable   => 1,
  },
  "business_partner_is_buyer",
  {
    comments      => "卸先フラグ",
    data_type     => "tinyint",
    default_value => 0,
    is_nullable   => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</company_id>

=item * L</business_partner_no>

=back

=cut

__PACKAGE__->set_primary_key("company_id", "business_partner_no");

=head1 UNIQUE CONSTRAINTS

=head2 C<business_partner_code>

=over 4

=item * L</company_id>

=item * L</business_partner_code>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "business_partner_code",
  ["company_id", "business_partner_code"],
);


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-03-05 20:22:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Zc047Y8UljGTlduupb3NNw

=head1 RELATIONS

=head2 belongs_to

company

=cut

__PACKAGE__->belongs_to(
    'company' => 'Sellco::DBIC::Schema::Result::Company',
    "company_id",
    {
        is_deferrable => 1,
        is_foreign_key_constraint => 0,
    }
);

=head2 has_many

buyers, suppliers

=cut

__PACKAGE__->has_many(
    "buyers" => "Sellco::DBIC::Schema::Result::Buyer",
    {
        "foreign.buyer_no"   => "self.business_partner_no",
        "foreign.company_id" => "self.company_id",
    },
    {
        cascade_copy => 1,
        cascade_delete => 1,
    },
);

__PACKAGE__->has_many(
    "suppliers" => "Sellco::DBIC::Schema::Result::Supplier",
    {
        "foreign.company_id"  => "self.company_id",
        "foreign.supplier_no" => "self.business_partner_no",
    },
    {
        cascade_copy => 1,
        cascade_delete => 1,
    },
);

=king
__PACKAGE__->belongs_to(
    "purchase_order",
    "Sellco::DBIC::Schema::Result::PurchaseOrder",
    { company_id => "company_id"
      ,purchase_order_no => "business_partner_no" },
    { join_type => "LEFT", on_delete => "CASCADE", on_update => "CASCADE" },
);
=cut

#__PACKAGE__->many_to_many(purchase_orders => 'business_partners','purchase_order');

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
