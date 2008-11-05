class Page
  include DataMapper::Resource

  # Properties
  property :id,             Serial
  property :title,          String, :length => 255, :nullable => false
  property :slug,           String, :length => 255
  property :body,           Text
  property :body_formatted, Text
  property :published,      Boolean, :default => false
  property :created_at,     DateTime
  property :updated_at,     DateTime

  # Validations
  validates_is_unique(:slug)

  # Hooks
  before :valid?, :slugify

  # http://jamesbrooks.net/2008/09/01/slug-generation-in-rails/
  def slugify
    if self.slug.blank? && !self.title.blank?
      self.slug = title.downcase.gsub(/&/, ' and ').gsub(/[^a-z0-9']+/, '-').gsub(/^-|-$|'/, '')
    end
  end
end
