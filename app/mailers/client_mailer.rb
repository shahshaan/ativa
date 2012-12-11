class ClientMailer < ActionMailer::Base
  default :from => "Shaan Shah <shaan@perfectsearchmedia.com>"


    def new_client(client, password)
    	@client = client
  		@password = password
    	mail(:to => "#{client.full_name} <#{client.email}>", :subject => "Welcome to Ativa | Perfect Search Design")
      end

end




