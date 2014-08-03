class Category < ActiveRecord::Base
	has_many :articles
	validates :name, presence: true
	validates :slug, presence: true
	validates_uniqueness_of :slug
end
