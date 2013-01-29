# dashboard.coffee
# Request handler for requests for the dashboard page

# This is dummy data for the moment
data = 
  title: "Cloud Services"
  screens: [
      title: "SVN Redbook"
      url: "/"
    , 
      title: "BOM"
      url: "/"
    ]

page = (req, res) ->
  res.render('dashboard', data ) 

json = (req, res) ->
  res.send(data)

exports.page = page
exports.json = json
