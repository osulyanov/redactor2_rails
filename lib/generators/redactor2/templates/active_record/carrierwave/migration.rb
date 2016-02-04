class CreateRedactor2Assets < ActiveRecord::Migration
  def self.up
    create_table :redactor2_assets do |t|
      t.string :data_file_name, :null => false
      t.string :data_content_type
      t.integer :data_file_size

      t.integer :assetable_id
      t.string :assetable_type, :limit => 30
      t.string :type, :limit => 30

      t.integer :width
      t.integer :height

      t.timestamps
    end

    add_index 'redactor2_assets', ['assetable_type', 'type', 'assetable_id'], :name => 'idx_redactor2_assetable_type'
    add_index 'redactor2_assets', ['assetable_type', 'assetable_id'], :name => 'idx_redactor2_assetable'
  end

  def self.down
    drop_table :redactor2_assets
  end
end
