#require "smscountry/version"
require "rest-client"

module Smscountry
  # Your code goes here...
   class Services
   		attr_accessor :username,:password,:senderid
   		def initialize(username, password,senderid="SMSCountry")
   			@username = username
   			@password = password
   			@senderid = senderid
   		end

   		def sendsms(message,mobile_nums, meesage_type="N",req_delivery_report="Y")
			response = RestClient.get "http://api.smscountry.com/SMSCwebservice_bulk.aspx?User=#{@username}&passwd=#{@password}&mobilenumber=#{mobile_nums}&message=#{message}&sid=#{@senderid}&mtype=#{meesage_type}&DR=#{req_delivery_report}"
			puts response.inspect
		end


		def check_account_balance
			response = RestClient.get "http://api.smscountry.com/SMSCwebservice_User_GetBal.asp?User=#{@username}&passwd=#{@password}"
			puts response.inspect
		end

		def get_bulk_reports(fromdate,todate)
			response = RestClient.get "http://api.smscountry.com/smscwebservices_bulk_reports.aspx?User=#{@username}&passwd=#{@password}&fromdate=#{fromdate}&todate=#{todate}"
			puts response.inspect
		end
		
		def schedule_bulk_message(message,mobile_nums,meesage_type="N",req_delivery_report="Y",interval=0,schedulerName,scheduledDateTime,systemcurrenttime)
			response = RestClient.get "http://www.smscountry.com/APISetReminder.asp", 
			{:params => {
				 :User => @username, 
				 :passwd => @password,
				 :senderName => @senderid, 
				 :message => message, 
				 :mobilenumber => mobile_nums, 
				 :meesage_type => meesage_type, 
				 :req_delivery_report => req_delivery_report, 
				 :schedulerName => schedulerName,
				 :scheduledDateTime => scheduledDateTime,
				 :systemcurrenttime => systemcurrenttime  
			}}
		end
		
		def  edit_scheduled_sms(reminder_id, options = {})
			params_to_send = {
				 :User => @username, 
				 :passwd => @password,
				 :RID => reminder_id
			}
			options.each do |key, value|
				params_to_send[key] = value
			end

			response = RestClient.get "http://www.smscountry.com/APIEditReminder.asp", 
			{:params => params_to_send }
		end
		
		def view_single_scheduled_sms(reminder_id)
			response = RestClient.get "http://www.smscountry.com/APIViewReminder.asp",
			{
			:params => {
				:User => @username, 
				:passwd => @password,
				:RID => reminder_id
				}
			}
			puts response.inspect
		end
		
		def view_all_scheduled_sms
			response = RestClient.get "http://www.smscountry.com/APIViewAllReminders.asp",
			{
			:params => {
				:User => @username, 
				:passwd => @password
				}
			}
			report_data = response.body.split("\\n<br/>")
			puts report_data.inspect
		end
		
		
		
		def delete_scheduled_sms(reminder_id)
			response = RestClient.get "http://www.smscountry.com/APIDeleteReminder.asp",
			{
			:params => {
				:User => @username, 
				:passwd => @password,
				:RID => reminder_id
				}
			}
			puts response.inspect
			return response
		end

   end
end
