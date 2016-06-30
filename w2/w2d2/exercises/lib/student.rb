class Student
    attr_accessor :first_name, :last_name, :courses

    def initialize(first_name, last_name)
      @first_name = first_name
      @last_name = last_name
      @courses = []
    end

    def name
      "#{first_name} #{last_name}"
    end

    def enroll(course)
      courses << course unless courses.include?(course) || has_conflict?(course)
      course.students << self
    end

    def has_conflict?(course)
      courses.each do |c|
        raise "confliction" if course.conflicts_with?(c)
      end
      false
    end

    def course_load
      department_hash = {}
      courses.each do |course|
        if department_hash[course.department]
          department_hash[course.department] += course.credits
        else
          department_hash[course.department] = course.credits
        end
      end
      department_hash
    end
end
