class PrivateImage < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  include Position
  include Scopes
  
  has_attached_file :image, styles: { large: "1280x800>", thumb: '380x380#' }
  validates_attachment :image, presence: true,
                              s3_protocol: :https,
                              content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                              size: { less_than: 3.megabytes }

  def to_jq_upload
    {
      id: id,
      name: read_attribute(:image),
      size: image.size,
      url: image.url,
      thumbnail_url: image.url(:thumb),
      delete_url: admin_background_path(id: id),
      delete_type: 'DELETE'
    }
  end
end
