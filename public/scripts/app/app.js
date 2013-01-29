// Generated by CoffeeScript 1.3.3
(function() {
  var $, Dashboard, DashboardApp,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  $ = jQuery;

  Dashboard = (function(_super) {

    __extends(Dashboard, _super);

    function Dashboard() {
      return Dashboard.__super__.constructor.apply(this, arguments);
    }

    Dashboard.configure("Dashboard", "name", "owner");

    Dashboard.extend(Spine.Model.Local);

    Dashboard.extend({
      "default": function() {
        console.log('creating default');
        return new Dashboard({
          name: "My Dashboard",
          owner: "Some dude"
        }).save();
      }
    });

    Dashboard.prototype.displayName = function() {
      return this.name || "Unknown Dashboard";
    };

    return Dashboard;

  })(Spine.Model);

  DashboardApp = (function(_super) {

    __extends(DashboardApp, _super);

    DashboardApp.prototype.elements = {
      "#status": "statusBox",
      "#screens": "screensList",
      ".dashboard-name": "nameText"
    };

    function DashboardApp() {
      this.dashboardUpdated = __bind(this.dashboardUpdated, this);
      DashboardApp.__super__.constructor.apply(this, arguments);
      Dashboard.bind("refresh", this.dashboardUpdated);
      Dashboard.fetch();
      this.status("Application JS Loaded");
    }

    DashboardApp.prototype.status = function(msg) {
      return this.statusBox.text(msg);
    };

    DashboardApp.prototype.dashboardUpdated = function() {
      console.log('dashboard updated1');
      this.dash = Dashboard.first() || Dashboard["default"]();
      console.log(this.dash);
      return this.nameText.text(this.dash.displayName);
    };

    return DashboardApp;

  })(Spine.Controller);

  $(function() {
    return new DashboardApp({
      el: $('#emdash')
    });
  });

}).call(this);
