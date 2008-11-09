require 'pp'
class Application < Merb::Controller
  before :session_dump

  def session_dump
		pp "=====\nSession:"
    pp session
		pp "==========\nSession User:"
  	pp session.user
		pp "==============\n authentication_strategies:"
		pp session[:authentication_strategies]
  end
end
