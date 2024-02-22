class Upload < ApplicationRecord
  has_one_attached :file

  before_save :set_file_type, :set_file_name

  def image?
    file_type.to_s == 'image'
  end

  def set_file_type
    self.file_type = file.content_type.split('/').first
  end

  def set_file_name
    self.filename = file.filename.to_s
  end

  def update_description
    data = file.download

    a           = Astica.new
    data        = a.encode_image_from_blob(data)
    description = a.upload_image(data)

    update(description: description)
  end
end
