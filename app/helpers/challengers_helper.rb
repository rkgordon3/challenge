module ChallengersHelper
	def challenger_list_tag
		out = %Q[<ul id="accept-list" class="unstyled" style="font-size:16pt;padding:8px">]
		Challenger.where("accepted=?", true). each { |c|
		   out += "<li>#{c.name}</li>"
		}
		out += "</ul>"
		out.html_safe
	end
end
