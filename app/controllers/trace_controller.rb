class TraceController < ApplicationController

  def update
    person = params.require(:trace).require(:person)
    location = params.require(:trace).require(:location)

    tracker = Tracker.find_by_person(person)
    if tracker.nil?
      tracker = Tracker.create({person: person, location: location})
    else
      tracker.update({person: person, location: location})
    end
    render json: { updated: true }.to_json
  end

end
