class Image < Upload
  SIZE_OPTIONS = {
    original:  [2000, 2000],
    thumbnail: [100, 100],
    small:     [200, 200],
    medium:    [400, 400],
    large:     [800, 800]
  }.freeze

  FORMAT_OPTIONS = %w[jpg png].freeze
  # validates :file, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end