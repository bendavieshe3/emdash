# app.coffee

$ = jQuery

class Dashboard extends Spine.Model
  @configure "Dashboard", "name", "owner"
  @extend Spine.Model.Local

  @extend
    default: ->
      new LogEntry(msg:"creating default dashboard details...").save()
      new Dashboard(name:"My Dashboard", owner:"Some dude").save()

  displayName: -> 
    @name or "Unknown Dashboard"

class LogEntry extends Spine.Model
  @configure "LogEntry", "dateLogged", "msg"
  @extend Spine.Model.Local

  dateLogged: new Date()

# Controllers 

class LogListController extends Spine.Controller

  elements:
    ".log_list"     :   "logList"

  constructor: ->
    super
    
    console.log("Constructing Log List Controller")
    LogEntry.bind("refresh", @addAllLogEntries)
    LogEntry.fetch()

    LogEntry.bind("create", @addLogEntry)
    Dashboard.bind("create", @createDashboardLog)
       

  addAllLogEntries: =>
    console.log("Adding all Log Entries")
    LogEntry.each(@addLogEntry)


  addLogEntry: (entry) =>
    console.log("Adding One Log entry")
    @logList.append "<li>" + entry.dateLogged + " : " + entry.msg + " (" + entry.id + ")</li>"

  createDashboardLog: (dashboard) =>
    new LogEntry(msg:"New Dashboard Created")

  renderLogEntry: (entry) ->
    console.log('rendering log entry')


class ScreenTableController extends Spine.Controller


class DashboardApp extends Spine.Controller

  elements: 
    "#status"     :   "statusBox"
    "#screens"    :   "screensList"
    ".dashboard-name"      :   "nameText"

  constructor: ->
    super

    @logListController = new LogListController(el: $("#log"))


    Dashboard.bind("refresh", @dashboardUpdated)
    Dashboard.fetch()

    @status "Application Started"

  status: (msg) ->
    new LogEntry(msg:msg).save()
    @statusBox.text(msg)

  dashboardUpdated: =>
    @dash = Dashboard.first() or Dashboard.default()
    @nameText.text(@dash.displayName())

$ ->
  if(typeof(window.d)=="undefined")
    window.d = new DashboardApp(el: $('#emdash'))


#this is a comment