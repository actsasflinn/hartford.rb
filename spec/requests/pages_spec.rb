require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

def valid_attributes
  { :page => {
      :title => "Welcome to Hartford.rb",
      :slug => "home",
      :body => "Habent claritatem insitam est usus legentis in iis qui 
                facit eorum claritatem Investigationes. Ut wisi enim ad 
                minim veniam quis nostrud exerci tation ullamcorper 
                suscipit lobortis nisl. Doming id quod mazim placerat 
                facer possim assum typi non demonstraverunt lectores." } }
end

given "a page exists" do
  Page.all.destroy!
  @page = Page.create(valid_attributes)
end

describe "resource(@page)", :given => "a page exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Page.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
end

