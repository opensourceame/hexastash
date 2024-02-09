class Document < Upload
  validates :file, attached: true, content_type: ['application/pdf']
end