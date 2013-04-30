class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :setLayout
  
  #================
  # setLayout
  #================
  def setLayout
    layout = ( ( request.xhr? ) ? false : 'application' )
    return( layout )
  end

end
