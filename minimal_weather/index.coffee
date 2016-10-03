# Authored by Grant Park [grantpark.io]
# Refresh rate (default: 3600000ms)
refreshFrequency: (60 * 1000 * 60)
Key = require("../private/private.coffee").key
State = "MA"
City = "Amherst"

# Command
command: "curl -s http://api.wunderground.com/api/" + Key + "/geolookup/conditions/q/" + State + "/" + City + ".json"

# Body style
style: """
    .container
        font-size: 40px
        color: white
        text-align: left
        margin-left: 30px
        margin-top: 630px
        font-family: Arial
        text-shadow: 2px 2px 8px black
    .temperature
        font-size: 50px
    .location
    	font-size: 20px
    	line-height: 40px
"""

# Rendering
render: -> """
    <div class="container">
    <div class="temperature"></div>
    <div class="weather"></div>
    <div class="location"></div>
    </div>
"""

# Update function
update: (output, domEl) ->
  data = JSON.parse(output)["current_observation"]
  temperature = data["temp_f"]
  weather = data["weather"]
  location = data["display_location"]["full"]
  $(domEl).find('.temperature').text("#{temperature}°F")
  $(domEl).find('.weather').text("#{weather}")
  $(domEl).find('.location').text("#{location}")
