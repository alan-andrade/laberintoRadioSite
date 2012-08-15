class Asset < ActiveRecord::Base

  attr_accessible :image

  belongs_to :imageable, polymorphic: true

  delegate :url, to: :image

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }

  validates_with AttachmentSizeValidator,         attributes: :image, less_than: 2.megabytes
  validates_with AttachmentContentTypeValidator,  attributes: :image, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
