class Gallery < ActiveRecord::Base
  has_many :images, :as => :imageable, :order => :position, :dependent => :destroy
  validates_presence_of :name
  acts_as_list
end
