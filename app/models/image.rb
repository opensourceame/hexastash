class Image < Upload
  validates :file, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end