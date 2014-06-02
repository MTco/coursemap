require 'open-uri'
namespace :import do
  desc "imports course data from providers"

  task coursera: :environment do
    desc "import from coursera"
    url = "https://api.coursera.org/api/catalog.v1/courses?fields=name,largeIcon,photo,shortDescription,video,aboutTheCourse"
    json = JSON.load(open(url))
    courses = json['elements']
    courses.each do |course|
      Course.find_or_create_by(
        name: course["name"]
      ) do |c|
        c.name = course["name"]
        c.largeIcon = course["largeIcon"]
        c.photo = course["photo"]
        c.shortDescription = course["shortDescription"]
        c.video = course["video"]
        c.longDescription = course["aboutTheCourse"]
      end
    end
  end

end
