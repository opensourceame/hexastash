require 'rails_helper'

RSpec.describe Upload, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:upload)).to be_valid
  end
end
