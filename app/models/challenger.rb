# == Schema Information
#
# Table name: challengers
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  accepted           :boolean
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class Challenger < ActiveRecord::Base
  attr_accessible :email, :accepted, :name, :photo
  has_attached_file  :photo, 
                     :styles => { :medium => "200x200", :thumb => "32x32"  }, 
                     :default_url => "/images/:style/flag.png"

  def uploaded_image?
  	not photo_file_name.nil?
  end
end
