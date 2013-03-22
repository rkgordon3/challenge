module ChallengersHelper
	#include Rails.application.routes.url_helpers 
	def challenger_list_item(challenger) 
		if not challenger.uploaded_image?
		  out = link_to "Add Photo?", edit_challenger_path(challenger), :class=>'small-link'
		else
		  out = link_to_image(challenger.photo.url(:thumb), challenger_path(challenger))
	    end
	    out += challenger.name
	    out.html_safe
	end
	def challenger_list(challengers)
		out = %Q[<ul id="accept-list" class="unstyled" style="font-size:16pt;padding:8px">]
		challengers. each { |c|
		   out += "<br/><li>"+challenger_list_item(c)+"</li>"
		}
		out += "</ul>"
		out.html_safe
	end
end
