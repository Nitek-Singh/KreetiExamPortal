class ParticipationsController < ApplicationController

    def index
     @exams = Exam.joins(:registrations).select("exams.*, COUNT(registrations.id) as registration_count").group("exams.id").having("registration_count > 0")
    end
end
        