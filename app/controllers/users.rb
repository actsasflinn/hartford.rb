class Users < Application
  params_protected  :user => [:admin]

  def new
    only_provides :html
    @user = User.new
    display @user
  end

  def create(user)
    @user = User.new(user)
    if @user.save
      redirect url(:user, @user.id), :message => {:notice => "User was successfully created"}
    else
      message[:error] = "User failed to be created"
      render :new
    end
  end
end # Users
