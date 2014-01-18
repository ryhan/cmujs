class @API

  DEFAULT_APP_ID = '9c55f614-c85c-4fb9-b9db-5583351f606e'
  DEFAULT_APP_SECRET = 'rtRPuoJZeGT5yiKQH6mFt9LZ1zMWFPb4z9olkJspfnPDygWukK_vjWuP'

  constructor: (options = {}) ->

    @id = options.id || DEFAULT_APP_ID
    @secret = options.secret || DEFAULT_APP_SECRET
    @api_endpoint = 'https://apis.scottylabs.org/v1/'

    date = new Date()
    @current_semester = if date.getMonth() < 5 then 'S' else 'F'
    @current_semester += date.getFullYear() - 2000

  _get: (request) ->
    url = "#{@api_endpoint+request}?app_id=#{@id}&app_secret_key=#{@secret}"
    xmlHttp = null
    xmlHttp = new XMLHttpRequest
    xmlHttp.open 'GET', url, false
    xmlHttp.send null
    JSON.parse xmlHttp.responseText


class @ScheduleAPI extends API

  getCourse: (course_number, semester) ->
    unless semester? then semester = @current_semester
    response = @_get "schedule/#{semester}/courses/#{course_number}"
    response.course if response?


class @CMUApi
  constructor: (options = {}) ->
    @schedule = new ScheduleAPI options
