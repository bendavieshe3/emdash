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
# data = 
#   title: "Cloud Services"
#   screens: [
#       title: "SVN Redbook"
#       url: "http://svnbook.red-bean.com/"
#     , 
#       title: "BOM"
#       url: "http://www.bom.gov.au/"
#     ]


page = (req, res) ->
  res.render('dashboard', data ) 

json = (req, res) ->
  res.send(data)

exports.page = page
exports.json = json
