class Url < ActiveRecord::Base
  validates :url, presence: true, uniqueness: true
  validates_format_of :url, :with => /\A#{URI::regexp(['http', 'https'])}\z/, :on => :create
  
end
