class Pages < Application
  def show(slug)
    @page = Page.first(:slug => slug)
    raise NotFound unless @page
    display @page
  end
end # Pages
