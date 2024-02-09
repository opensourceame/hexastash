class Image < Upload
  FORMAT_OPTIONS  = %w[jpg png].freeze
  QUALITY_OPTIONS = [25, 50, 75, 85, 90, 100].freeze
  SIZE_OPTIONS    = {
    original:  [2000, 2000],
    thumbnail: [100, 100],
    small:     [200, 200],
    medium:    [400, 400],
    large:     [800, 800]
  }.freeze

  # TODO: fix image validation
  # validates :file, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end