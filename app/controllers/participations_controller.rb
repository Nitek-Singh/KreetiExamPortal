class ParticipationsController < ApplicationController
  def index
    @exams = Exam.left_joins(registrations: { user: :college })
                 .select('exams.*, COUNT(registrations.id) as registration_count, COUNT(registrations.id) > 0 as has_registration')
                 .group('exams.id')
                 .having('registration_count > 0')
                 .includes(registrations: { user: :college })
  end
end
