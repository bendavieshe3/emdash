# app.coffee

$ = jQuery

class Dashboard extends Spine.Model
  @configure "Dashboard", "name", "owner"

  @extend Spine.Model.Local
  @extend
    default: ->
      console.log('creating default')
      new Dashboard(name:"My Dashboard", owner:"Some dude").save()

  displayName: -> @name or "Unknown Dashboard"

class DashboardApp extends Spine.Controller

  elements: 
    "#status"     :   "statusBox"
    "#screens"    :   "screensList"
    ".dashboard-name"      :   "nameText"

  constructor: ->
    super
    Dashboard.bind("refresh", @dashboardUpdated)
    Dashboard.fetch()

    @status "Application JS Loaded"

  status: (msg) ->
    @statusBox.text(msg)

  dashboardUpdated: =>
    console.log('dashboard updated1')
    @dash = Dashboard.first() or Dashboard.default()
    console.log(@dash)
    @nameText.text(@dash.displayName)

$ ->
  new DashboardApp(el: $('#emdash'))

#this is a comment