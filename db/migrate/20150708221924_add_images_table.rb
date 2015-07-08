class AddImagesTable < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :caption
      t.belongs_to :user, index: true
      t.timestamps
    end
  end

end
