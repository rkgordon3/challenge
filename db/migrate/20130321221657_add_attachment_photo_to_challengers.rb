class AddAttachmentPhotoToChallengers < ActiveRecord::Migration
  def self.up
    change_table :challengers do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :challengers, :photo
  end
end
