class Item < ApplicationRecord
 
    with_options presence: true do
      validates :image
      validates :name
      validates :item_description
      validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
    end
      validates :price,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
    
    with_options presence: true, numericality: { other_than: 1 } do
      validates :category_id
      validates :item_condition_id
      validates :cost_id
      validates :prefecture_id
      validates :day_id
    end
  
      belongs_to :user
      has_one_attached :image
      has_one :order
  
      extend ActiveHash::Associations::ActiveRecordExtensions
      belongs_to :category
      belongs_to :item_condition
      belongs_to :cost
      belongs_to :prefecture
      belongs_to :day
  
  
  end
