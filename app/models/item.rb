class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :record

end
