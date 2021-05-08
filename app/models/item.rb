class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_charge
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_date

  with_options presence: true do
    validates :name
    validates :text
    validates :image
    validates :price, format: {with: /\A[0-9]+\z/, message: 'Half-width number' },
                      numericality: { only_integer: true, greater_than: 300, less_than: 9999999, message: 'Out of setting range'}

    validates :category_id,         numericality: { other_than: 1, message:'Select'}
    validates :status_id,           numericality: { other_than: 1 ,message:'Select'}
    validates :delivery_charge_id,  numericality: { other_than: 1, message:'Select'}
    validates :prefecture_id,       numericality: { other_than: 1, message:'Select'}
    validates :shipping_date_id,    numericality: { other_than: 1, message:'Select'}
  end
end