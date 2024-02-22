require_relative '../astica/image'
require 'faraday'

task t: :environment do
  image_path = Rails.root.join('spec', 'fixtures', 'files', 'images', 'dog-map.png')

  a = Astica.new
  a.upload_image(image_path)
end

task update_image_descriptions: :environment do
  Upload.where(description: nil).each do |upload|
    upload.update_description
  end
end