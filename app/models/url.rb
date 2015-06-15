class Url < ActiveRecord::Base
  belongs_to :user
  validates :url, presence: true, uniqueness: true
  validates_format_of :url, :with => /\A#{URI::regexp(['http', 'https'])}\z/, :on => :create

end
