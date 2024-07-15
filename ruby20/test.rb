

#require 'sinatra'
1251
get '/' do
erb : index
end
post '/' do
@user_name
= params [: user_name]
@phone = params [: phone]
@date_time = params [: date_time]
@title = 'Thanks!'
@message = "Thank you,
#{@user_name}, we'll be waiting!"
f = File. open
f.write
"User :
f.close
/public/users.txt'
'a'
#(@user_name}, Phone: #{@phone}, Date and time:
#(@date_time)"