class CitiesController < ApplicationController

	def index
	  @cities = City.all
	   @json = @cities.to_gmaps4rails do |city, marker|
	  	marker.infowindow render_to_string(:partial => "/cities/infowindow", :locals => { :city => city})
	    marker.title "#{city.name}"
	    marker.json({ :population => city.population})
	    marker.picture({:picture => "http://mapicons.nicolasmollet.com/wp-content/uploads/mapicons/shape-default/color-c748b8/shapecolor-color/shadow-1/border-dark/symbolstyle-contrast/symbolshadowstyle-dark/gradient-iphone/regroup.png",
	                    :width => 32,
	                    :height => 32})
	  	end
	 end

end
