class LeaderboardsController < ApplicationController
    def index
      @exams = Exam.joins(:registrations).where.not(registrations: { score: nil }).group(:id).order('MAX(registrations.score) DESC')
    end
  end