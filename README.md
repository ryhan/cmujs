cmujs
=====

Aspiring to be a JavaScript library for CMU data. Basically a wrapper for [ScottyLabs CMU APIs](https://apis.scottylabs.org).


### Usage

1. First, [register your application](https://apis.scottylabs.org/apps) to get an app ID and an app secret key.

2. Include [cmu.js](https://github.com/ryhan/cmujs/blob/master/cmu.js), and supply your app information using the following. Here's [a sample html file](https://github.com/ryhan/cmujs/blob/master/sample.html).
```javascript
  var cmu = new CMUApi({
    id: // YOUR APP ID ,
    secret: // YOUR APP SECRET KEY
  });
```

### Directory Data

Lookup a person's public directory information using their Andrew ID
```javascript
// Returns directory information for the user with andrew ID "zhixians"
cmu.schedule.findAndrewID("zhixians");
```

##### Sample Response

Calling the above line will return a json object containing the name of the person, their email, their title, their department, and affiliated schools, among other bits of information.

Read more on the [Directory API Documentation](https://apis.scottylabs.org/documentation/directory).
```javascript
{
  "person": {
    "andrew_id": "zhixians",
    "name": "Tom Shen",
    "last_name": "Shen",
    "first_name": "Tom",
    "email": "tomshen@cmu.edu",
    "phone": null,
    "role": "Student",
    "title": "Student Researcher",
    "student_class": "Sophomore",
    "student_level": "Undergrad",
    "department": "Computer Science",
    "affiliated_schools": [
      "School of Computer Science",
      "Student Employment",
      "SCS - School of Computer Science"
    ]
  }
}
```

### Schedule Data

Access information about a particular course (for the current semester) by calling
```javascript
// Returns course information for the current semester
cmu.schedule.findCourse("15251");
```

You can also specify a particular semester. Pass in "S14" for Spring 2014, "F14" for Fall 2014, etc.
```javascript
// Returns course information for the Spring of 2014
cmu.schedule.findCourse("15251", "S14");
```

##### Sample Response

Both of the above lines will return a json object containing the name of the course, the various sections offered, the names of the instructors, times/locations for lecture and recitation, among other bits of information.

Read more on the [Scheduling API Documentation](https://apis.scottylabs.org/documentation/scheduling).
```javascript
{
  "course": {
    "department_id": 15,
    "number": "15122",
    "name": "Principles of Imperative Computation",
    "units": 10,
    "lectures":
    [
      ...
      {
        "instructors": "Gunawardena, Platzer",
        "meetings": [{
          "days": "TR",
          "location": "GHC 4401",
          "time_start": "09:00AM",
          "time_end": "10:20AM",
        }],
        "section": "Lec 1",
        "name": null,
        "recitations":
        [
          ...
          {
            "instructors": "Instructor TBA",
            "meetings": [{
              "days": "WF",
              "location": "GHC 5222",
              "time_start": "09:30AM",
              "time_end": "10:20AM",
            }],
            "section": "A",
            "name": null
          },
          {
            "instructors": "Instructor TBA",
            "meetings": [{
              "days": "WF",
              "location": "GHC 5222",
              "time_start": "10:30AM",
              "time_end": "11:20AM",
            }],
            "section": "B",
            "name": null
          },
          ...
        ]
      }
      ...
    ]
  }
}
```
