class Recipe < ApplicationRecord
  mount_uploader :picture, PictureUploader
end
