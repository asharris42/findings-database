module FindingsHelper
  def handle_quotes(user_string)
    quote_count = 0
    user_string.each_char do |c| 
      if c == '"'
        quote_count+=1
      end
    end
    if quote_count%2 == 1
      user_string = user_string << '"'
    end
  end
end