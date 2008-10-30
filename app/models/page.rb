class Page
  include DataMapper::Resource

  # Properties
  property :id, 				Serial
  property :title, 			String, :length => 255, :nullable => false
  property :slug, 			String, :length => 255
  property :body, 			Text
  property :created_at, DateTime
  property :updated_at, DateTime
	property :published, 	Boolean, :default => false

	# Hooks
	before :valid?, :slugify

	# http://jamesbrooks.net/2008/09/01/slug-generation-in-rails/
	def slugify
		if slug.blank? && !title.blank?
    	slug = title.downcase.gsub(/&/, ' and ').gsub(/[^a-z0-9']+/, '-').gsub(/^-|-$|'/, '')
		end
	end
end
