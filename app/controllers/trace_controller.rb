class TraceController < ApplicationController

  def update
    person = params.require(:trace).require(:person).downcase
    location = params.require(:trace).require(:location).downcase

    tracker = Tracker.find_by_person(person)
    if tracker.nil?
      tracker = Tracker.create({person: person, location: location})
    else
      tracker.update({person: person, location: location})
    end
    render json: { updated: true }.to_json
  end

  def track
    person = params.require(:trace).require(:person).downcase
    tracker = Tracker.find_by_person(person)
    if(tracker.nil?)
      render json: { location: "unknown" }
    else
      render json: { location: tracker.location }
    end
  end

end
