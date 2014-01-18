cmujs
=====

Aspiring to be a JavaScript library for CMU data. Basically a wrapper for [ScottyLabs CMU APIs](https://apis.scottylabs.org).


### Usage

1. First, [register your application](https://apis.scottylabs.org/apps) to get an app ID and an app secret key.

2. Include [cmu.js](https://github.com/ryhan/cmujs/blob/master/cmu.js), and supply your app information using the following.
```javascript
  var cmu = new CMUApi({
    id: // YOUR APP ID , 
    secret: // YOUR APP SECRET KEY
  });
```
If you're confused, look at [this sample html file](https://github.com/ryhan/cmujs/blob/master/sample.html).

#### Scheduling Data

To get a JSON object containing information about a course, simply pass a course number and semester (three characters, such as "S14") to `cmu.schedule.getCourse( course, semester )`. For example
```javascript
cmu.schedule.getCourse("15251", "S14");

/* returns */
{
  department_id: 15,
  lectures: [
    {
      days: "TR"
      instructors: "Sleator, Sutner"
      location: "WEH 7500"
      meetings: Array[1]
      recitations: Array[7]
      section: "Lec 1"
      time_end: "04:20PM"
      time_start: "03:00PM"
    },
    {
      days: "MW"
      instructors: "Kapoutsis"
      location: "CMB 1064"
      meetings: Array[1]
      recitations: Array[1]
      section: "Lec 2"
      time_end: "02:50PM"
      time_start: "01:30PM"
    }],
  name: "Great Theoretical Ideas in Computer Science",
  number: "15251",
  units: 12
}
```

