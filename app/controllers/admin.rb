class Admin < Application
  layout 'admin'
	before :ensure_authenticated
  before :ensure_admin

  def ensure_admin
    unless session.user.admin?
      redirect '/', :message => { :notice => "You don't have permission to access this action." }
    end
  end
end