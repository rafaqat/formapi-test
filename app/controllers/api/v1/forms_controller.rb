class Api::V1::FormsController < ApplicationController


protect_from_forgery with: :null_session 


  def new
  


      $key_id = SecureRandom.base64 #  Send A UUID to identify the new form

      logger.debug "#{$key_id}"

       render :json => '{"uuid":' +'"' "#{$key_id}" + '"' '}'

  end


  def show

      # Array of all the form names and UUID so that they can be displayed
      on a screen

  end



	def index


	case request.method_symbol
  		when :get

  		logger.debug "get recieved for form design - send back a saved form"




  		render :json => '[{"id":"E1ED259A-EBBE-4D47-8E66-E3F8B89784F3","element":"Header","text":"Header Text","static":true,"required":false,"bold":false,"italic":false,"content":"AAA"},{"id":"A1C87E30-13AC-4B87-9A79-1551FB1B40C0","element":"Header","text":"Header Text","static":true,"required":false,"bold":false,"italic":false,"content":"BBB"},{"id":"F59F3CA4-6E42-4AA6-B6D5-716ECB24524E","element":"Header","text":"Header Text","static":true,"required":false,"bold":false,"italic":false,"content":"CCC"}]'
   
  		when :post
                logger.debug "post"
  		
  		when :patch
                  logger.debug "patch"
  		when :options
   				 # Header will contain a comma-separated list of methods that are supported for the resource.
    			headers['Access-Control-Allow-Methods'] = allowed_methods.map { |sym| sym.to_s.upcase }.join(', ')
    			head :ok
  	end

 

   end

   def create
   			

   			logger.debug "create recieved - save this form -"
         
         # Update this form with the UUID sent in the JSON 
         # 

   			render :json =>"ok"
   end


private

def verify_request_type
  unless allowed_methods.include?(request.method_symbol)
    head :method_not_allowed # 405
  end
end

def allowed_methods
  %i(get post patch options)
end
  
end