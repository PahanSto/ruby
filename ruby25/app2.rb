
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

before '/visit' do
	@options_barber = ["Option ", "Option 2", "Option 3", 'Jesi pinkman']
end

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	@error = 'Что-то пошло не так'
	erb :about
end



get '/contacts' do

	f = File.open './public/contacts/contacts.txt', 'r'
	@contact =[]
	f.each_line do |line|
		@contact << line
	end
	f.close
	
	erb :contacts

end

get '/visit' do
	erb :visit
end


post '/visit' do

	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@mail = params[:mail]
	@options = params[:options]
	@color = params[:color]
	@mess = ''
	
	hh = {
				:username => 'Введите имя', 
				:phone => 'Введите телефон', 
				:mail => 'Введите электронную почту',
				:datetime => 'Введите дату'
				
			}
	# hh.each do |key, value|
	# 	if params[key] == ''
	# 		@error = hh[key]
	# 		return erb :visit
	# 	end
	@error = hh.select {|key, value| params[key] == ''}.values.join(', ')

	# if @error != ''
	# 	return erb :visit
	# end

	
	
	f = File.open './public/contacts/contacts.txt', 'a'
	f.write "Парикмахер #{@options}\n Имя: #{@username} 
	Телефон: #{@phone} Электронная почта: #{@mail} Время приёма: #{@datetime}, 
	#{@color}\n"
	f.close		
	@mess = "Вв аша заявка принята"
	return erb :visit
			
end



