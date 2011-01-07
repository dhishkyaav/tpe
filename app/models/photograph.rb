class Photograph < ActiveRecord::Base
  belongs_to :user

  has_attached_file :photo, :styles => { :original => "800x800>", :slide => "500x500>", :gallery => "150x150#" }
  has_many :variations
  accepts_nested_attributes_for :variations, :allow_destroy=>true
end
