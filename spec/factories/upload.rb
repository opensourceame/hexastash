FactoryBot.define do
  factory :upload do
    filename { Faker::File.file_name }

    after(:build) do |upload|
      filename = ['hexarad_1.jpg', 'hexarad_2.jpg', 'hexarad_3.jpg'].sample

      upload.file.attach(
        io:           File.open(Rails.root.join('spec', 'fixtures', 'files', 'images', filename)),
        filename:     filename,
        content_type: 'image/jpeg'
      )
    end
  end
end
