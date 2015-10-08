#require "smscountry/version"
require "rest-client"

module Smscountry
  # Your code goes here...
   class Services
   		def initialize(username, password,senderid="SMSCountry")
   			@username = username
   			@password = password
   		end

   		def sendsms(message,mobile_nums, meesage_type="N",req_delivery_report="Y")
			response = RestClient.get "http://api.smscountry.com/SMSCwebservice_bulk.aspx?User=#{@username}&passwd=#{@password}&mobilenumber=#{mobile_nums}&message=#{message}&sid=#{@senderid}&mtype=#{meesage_type}&DR=#{req_delivery_report}"
			puts response.inspect
		end


		def check_account_balance()
			response = RestClient.get "http://api.smscountry.com/SMSCwebservice_User_GetBal.asp?User=#{@username}&passwd=#{@password}"
			puts response.inspect
		end

		def get_bulk_reports(fromdate,todate)
			response = RestClient.get "http://api.smscountry.com/smscwebservices_bulk_reports.aspx?User=#{@username}&passwd=#{@password}&fromdate=#{fromdate}&todate=#{todate}"
			puts response.inspect
		end

   end
end
