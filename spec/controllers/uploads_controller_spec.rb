require 'rails_helper'

describe UploadsController do
  render_views

  describe 'index' do
    let!(:upload_1) { create(:upload) }
    let!(:upload_2) { create(:upload) }

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders a list of uploads' do
      get 'index'

      expect(response.body).to include(upload_1.filename)
      expect(response.body).to include(upload_2.filename)
    end
  end

  describe 'create' do
    it 'should create a new upload' do
      params = {
        upload: {
          file: fixture_file_upload('images/hexarad_1.jpg', 'image/jpeg')
        }
      }

      post :create, params: params

      expect(response.status).to eq(302)
      expect(Upload.count).to eq(1)
    end
  end
end