class UpdateUploads < ActiveRecord::Migration[7.0]
  def change
    add_column :uploads, :description, :string
  end
end
