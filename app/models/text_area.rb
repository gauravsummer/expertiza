class TextArea < TextResponse
  def complete(count, answer=nil)
  	if self.size.nil?
      cols = '70'
      rows = '1'
    elsif 
      cols = self.size.split(',')[0]
      rows = self.size.split(',')[1]
    end
    html = '<li><p><label for="responses_' +count.to_s+ '">' +self.txt+ '</label></p>'
    html += '<p><input name="responses[' +count.to_s+ '][score]" type="hidden">'
    html += '<p><textarea cols="' +cols+ '" rows="' +rows+ '" id="responses_' +count.to_s+ '_comments" name="responses[' +count.to_s+ '][comment]" >'
    html += answer.answer if !answer.nil?
    html += '</textarea>'
    html += '</p></li>'
    html.html_safe
  end

  def view_completed_question(count, answer)
    html = '<big><b>Question '+count.to_s+":</b> <I>"+self.txt+"</I></big><BR/>"
    html += '</p><dl><dd>' +answer.comments+ '</dd></dl>'
    html.html_safe
  end 
end
