class ClientMailer < ActionMailer::Base
  default from: "shaan@perfectsearchmedia.com"


    def new_client(client)
      mail(:to => client.email, :subject => "Registered")
      @client = client
    end

end
