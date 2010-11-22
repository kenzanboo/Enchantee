module UsersHelper
  
  def add_interest_link(name)
    link_to_function name do |page| 
  		page.insert_html :bottom, :interests, :partial => 'interest', :object => Interest.new, :locals => {:categories => Category.all}
  	end
  end
end
