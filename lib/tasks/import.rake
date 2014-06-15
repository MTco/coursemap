require 'open-uri'
require 'csv'
namespace :import do
  desc "imports course data from providers"

  task coursera: :environment do
    desc "import from coursera"
    fields = "name,shortName,photo,video,aboutTheCourse,instructor"
    url = "https://api.coursera.org/api/catalog.v1/courses?fields=#{fields}"
    json = JSON.load(open(url))
    courses = json['elements']
    courses.each do |course|
      Course.find_or_create_by(
        name: course["shortName"]
      ) do |c|
        c.name        = course["name"]
        c.shortName   = course["shortName"]
        c.description = course["aboutTheCourse"]
        c.photo       = course["photo"]
        c.video       = course["video"]
        c.instructors  = course["instructor"]
      end
    end
  end

  task edx: :environment do
    desc "import from edx"
    url = "https://www.edx.org/api/report/course-feed/export"
    courses = CSV.read(open(url), headers: true)
    courses.each do |course|
      Course.find_or_create_by(name: course["Course Number"]) do |c|
        c.name        = course["Course Title"]
        c.shortName   = course["Course Number"]
        c.description = course["About This Course"]
        c.photo       = course["Course Image: Banner"]
        c.video       = course["Course Video Link (YouTube)"][/(?<=[?&]v=)[^&$]+/]
        c.url         = course["Path"]
        c.instructors = course["Course Staff"]
        #c.category    = course["Subject"]
        #c.startDate   = course["Classes Start"]
        #c.endDate     = course["Classes End"]
        #"Post date"
        #"Updated date"
        #"Subject"
        #"Filter by School"
        #"Course Title"
        #"Course Number"
        #"Course Staff"
        #"Classes Start"
        #"Classes End"
        #"Path"
        #"Course Video Link (YouTube)"
        #"Course Image: Banner"
        #"About This Course"
      end

    end
  end
end
