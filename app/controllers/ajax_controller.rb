class AjaxController < ApplicationController
=begin
  layout :setLayout
  
  #================
  # setLayout
  #================
  def setLayout
    layout = ( ( request.xhr? ) ? false : 'application' )
    return( false )
  end
=end
  #================
  # index
  #================
  def index
    #render( { :layout => false } )
  end
  
  #================
  # test1
  #================
  def test1
    if ( params[ :query ].nil? || params[ :query ].empty? )
      @blogs = Blog.all
    else
      @blogs = Blog.where( [ '`name` LIKE ? OR `content` LIKE ?', "%#{params[ :query ]}%", "%#{params[ :query ]}%" ] )
    end
    @comments = Comment.all
    @custom_blogs = []
    
    @blogs.each do |blog|
      @custom_blogs << {
        :id => blog.id,
        :name => blog.name,
        :content => blog.content,
        :to_execute => 'alert( "Hola Mundo desde Blog #' + blog.id.to_s + '" );'
      }
    end
    
    respond_to do |format|
      format.html { # test1.html.erb
        layout = ( ( request.xhr? ) ? false : 'application' )
        render( { :layout => layout } )
      }
      format.js # Si existe test1.js.erb si no test1.html.erb SIN layout.
      format.json { render( { :json => @custom_blogs } ) } # test1.json.erb
      format.xml #{ render( { :xml => @comments } ) } # test1.xml.erb
    end
  end
  
  #================
  # test2
  #================
  def test2
    
  end
end
