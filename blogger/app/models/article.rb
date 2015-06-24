class Article < ActiveRecord::Base
	has_many :comments, dependent: :delete_all
end
