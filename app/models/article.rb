class Article < ActiveRecord::Base
	belongs_to :category
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: { minimum: 5 }
	validates :category_id, presence: true
end
