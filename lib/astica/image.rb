class Astica
  DESCRIBE_URL = 'https://vision.astica.ai/describe'

  def encode_image_from_path(image_path)
    image         = File.open(image_path, 'rb') { |file| file.read }
    encoded_image = Base64.encode64(image)
    encoded_image
  end

  def encode_image_from_blob(data)
    Base64.encode64(data)
  end

  def upload_image(data)
    payload = {
      "tkn":          ENV['ASTICA_API_KEY'],
      "modelVersion": "2.1_full",
      "input":        data,
      "visionParams": "gpt, describe, describe_all, tags, objects",
      "gpt_prompt":   "",
      "gpt_length":   "90"
    }

    response = connection.post(DESCRIBE_URL, payload)

    raise StandardError, response.body unless response.success?

    response.body['caption_GPTS']
  end

  def connection
    @connection ||= Faraday.new do |conn|
      # faraday.request :url_encoded
      # faraday.adapter Faraday.default_adapter
      conn.request :json
      conn.response :json

      conn.use Faraday::Response::Logger, ::Logger.new($stdout),
               headers: { request: true, response: true },
               bodies:  { request: true, response: true }

    end
  end
end