class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :buy

  has_one_attached :image

  validates :item_name, presence: true
  validates :explanation, presence: true
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price,  numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
  validates :image, presence: true
  
  validates :delivery_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :category_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :situation_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id,  numericality: { other_than: 1, message: "can't be blank" }
end