class @API

  APP_ID = "9c55f614-c85c-4fb9-b9db-5583351f606e"
  APP_SECRET = "rtRPuoJZeGT5yiKQH6mFt9LZ1zMWFPb4z9olkJspfnPDygWukK_vjWuP"

  constructor: (options = {}) ->
    @id = options.id || APP_ID
    @secret = options.secret || APP_SECRET
    @api_endpoint = "https://apis.scottylabs.org/v1/"

  # Fetch json using the supplied id and secret key
  _get: (request) ->
    url = "#{@api_endpoint+request}?app_id=#{@id}&app_secret_key=#{@secret}"
    xmlHttp = null
    xmlHttp = new XMLHttpRequest
    xmlHttp.open "GET", url, false
    xmlHttp.send null
    JSON.parse xmlHttp.responseText


class @ScheduleAPI extends API

  # Check to see if a valid semester is being supplied, just to prevent dumb errors
  _checkForSemester : (semester) ->
    unless semester? and typeof semester == "string" and semester.length == 3
      console.warn "I think you forgot to supply a three character semester string. EX: 'S14'"

  getCourse: (course_number, semester) ->
    @_checkForSemester semester
    response = @_get "schedule/#{ semester }/courses/#{ course_number }"
    response.course if response?

  ###
  getCourses: (department, semester) ->
    @_checkForSemester semester
    response = @_get "schedule/#{ semester }/departments/#{ department }/courses"
    response.course if response?

  getDepartments: (semester) ->
    @_checkForSemester semester
    response = @_get "schedule/#{ semester }/departments"
    response.course if response?
  ###

class @CMUApi
  constructor: (options = {}) ->
    @schedule = new ScheduleAPI options
