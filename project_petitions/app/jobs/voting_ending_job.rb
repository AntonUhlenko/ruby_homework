class VotingEndingJob < ActiveJob::Base
  queue_as :default

  def perform
    @petitions = Petition.all
    @petitions.each do |petition|
      if @petitions.votes.count >= Petition::VOTES_THRESHOLD
        UserMailer.petition_accepted(petition).deliver_later
        AdminMailer.new_accepted_petition(petition).deliver_later
      else
        UserMailer.petition_rejected(petition).deliver_later
      end
    end
  end

end

