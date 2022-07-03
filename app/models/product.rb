class Product < ApplicationRecord
  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true

  # Why test against one cent, rather than zero? Well, it’s possible to enter a number such as 0.001 into this field.
  # Because the database stores just two digits after the decimal point, this would end up being zero in the database
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  validates :image_url, allow_blank: true, format: { with: /\.(gif|jpg|png)\z/i,
                                                     message: 'must be a URL for GIF, JPG or PNG image.' }
end
