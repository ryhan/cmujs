// Generated by CoffeeScript 1.6.3
(function() {
  var _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  this.API = (function() {
    var APP_ID, APP_SECRET;

    APP_ID = "9c55f614-c85c-4fb9-b9db-5583351f606e";

    APP_SECRET = "rtRPuoJZeGT5yiKQH6mFt9LZ1zMWFPb4z9olkJspfnPDygWukK_vjWuP";

    function API(options) {
      if (options == null) {
        options = {};
      }
      this.id = options.id || APP_ID;
      this.secret = options.secret || APP_SECRET;
      this.api_endpoint = "https://apis.scottylabs.org/v1/";
    }

    API.prototype._get = function(request) {
      var url, xmlHttp;
      url = "" + (this.api_endpoint + request) + "?app_id=" + this.id + "&app_secret_key=" + this.secret;
      xmlHttp = null;
      xmlHttp = new XMLHttpRequest;
      xmlHttp.open("GET", url, false);
      xmlHttp.send(null);
      return JSON.parse(xmlHttp.responseText);
    };

    return API;

  })();

  this.ScheduleAPI = (function(_super) {
    __extends(ScheduleAPI, _super);

    function ScheduleAPI() {
      _ref = ScheduleAPI.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    ScheduleAPI.prototype._checkForSemester = function(semester) {
      if (!((semester != null) && typeof semester === "string" && semester.length === 3)) {
        return console.warn("I think you forgot to supply a three character semester string. EX: 'S14'");
      }
    };

    ScheduleAPI.prototype.getCourse = function(course_number, semester) {
      var response;
      this._checkForSemester(semester);
      response = this._get("schedule/" + semester + "/courses/" + course_number);
      if (response != null) {
        return response.course;
      }
    };

    /*
    getCourses: (department, semester) ->
      @_checkForSemester semester
      response = @_get "schedule/#{ semester }/departments/#{ department }/courses"
      response.course if response?
    
    getDepartments: (semester) ->
      @_checkForSemester semester
      response = @_get "schedule/#{ semester }/departments"
      response.course if response?
    */


    return ScheduleAPI;

  })(API);

  this.CMUApi = (function() {
    function CMUApi(options) {
      if (options == null) {
        options = {};
      }
      this.schedule = new ScheduleAPI(options);
    }

    return CMUApi;

  })();

}).call(this);
