# Smscountry

smscountry gem is useful for sending sms with Ruby on Rails or any Ruby Application.

You need to create an account with the http://www.smscountry.com in order to send sms using this Gem. 

## Installation

Add this line to your application's Gemfile:

```
gem 'smscountry'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install smscountry

## Usage
First create an instance of the Services class using the below code and access the instance methods

	smsobj = Smscountry::Services.new("YourSmsCoountryUserName", "YourSmsCountryPassword", "SenderID") #SenderID is optional.
# To Send SMS:
	smsobj.sendsms("Your Message","Mobile Nums as Comma Separated String", meesage_type="N","Y")
# To Check Your Account Balance
	smsobj.check_account_balance
# To Get SMS Reports
	smsobj.get_bulk_reports(fromdate,todate) #Dates should be in "DD/MM/YYYY". You can access the reports of at max 7 days at once.
# To Schedule SMS
	smsobj.schedule_bulk_message(message,mobile_nums,meesage_type,req_delivery_report,interval,schedulerName,scheduledDateTime,systemcurrenttime)
Example:

	smsobj.schedule_bulk_message("Sample Msg","919848022338",N","Y",0,"Festiva lWishes","DD/MM/YYYY","DD/MM/YYYY HH:MM AM/PM") # Mobile Nums in comma separated string.
# View a Scheduled SMS
	smsobj.view_single_scheduled_sms(reminder_id) # You will get a reminder ID when you schedule an SMS.reminder_id is an Integer.
Example:

	smsobj.view_single_scheduled_sms(123456)

# View All Scheduled SMS
You can view all the Scheduled SMSes.
	smsobj.view_all_scheduled_sms()

# To Delete a Scheduled SMS
	smsobj.delete_scheduled_sms(reminder_id) # You will get a reminder ID when you schedule an SMS.reminder_id is an Integer.
Example:

	smsobj.delete_scheduled_sms(123456)



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sriram15690/smscountry. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

