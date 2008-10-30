require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Page do
  before(:each) do
    @valid_attributes = {
      :title => "Welcome to Hartford.rb",
      :slug => "welcome-to-hartford-rb",
      :body => "Habent claritatem insitam est usus legentis in iis qui 
								facit eorum claritatem Investigationes. Ut wisi enim ad 
								minim veniam quis nostrud exerci tation ullamcorper 
								suscipit lobortis nisl. Doming id quod mazim placerat 
								facer possim assum typi non demonstraverunt lectores."
    }
  end

  it "should slugify a title" do
    p = Page.create(@valid_attributes.merge(:slug => nil))
    p.slug.should == @valid_attributes[:slug]
  end
end