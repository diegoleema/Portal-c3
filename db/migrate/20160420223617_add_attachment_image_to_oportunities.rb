class AddAttachmentImageToOportunities < ActiveRecord::Migration
  def self.up
    change_table :oportunities do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :oportunities, :image
  end
end
