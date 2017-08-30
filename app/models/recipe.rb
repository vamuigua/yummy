class Recipe < ApplicationRecord
  #OTM Relationship
  has_many :ingredients,inverse_of: :recipe
  has_many :directions,inverse_of: :recipe

  #Attributes to accept from the models
  accepts_nested_attributes_for :ingredients,
    reject_if: proc { |attributes| attributes['name'].blank? },
    allow_destroy: true
  accepts_nested_attributes_for :directions,
    reject_if: proc { |attributes| attributes['step'].blank? },
    allow_destroy: true

  #validates the params
  validates :title, :description, :picture, presence: true

  #mounts the uploader to the recipe model
  mount_uploader :picture, PictureUploader
end
