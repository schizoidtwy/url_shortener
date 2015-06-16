class Url < ActiveRecord::Base
  belongs_to :user
  validates :url, presence: true
  validates_format_of :url, :with => /\A#{URI::regexp(['http', 'https'])}\z/, :on => :create
  validates :short_url, uniqueness:true, presence:true

end
