# == Schema Information
#
# Table name: responses
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer          not null
#  answer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Response < ApplicationRecord

  validate :not_duplicate_response, :author_cant_respond?

  belongs_to :answer_choice,
  primary_key: :id,
  foreign_key: :answer_id,
  class_name: :AnswerChoice

  belongs_to :respondent,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  has_one :question,
  through: :answer_choice,
  source: :question

  def author_cant_respond?
    answer_choice.question.poll.author_id != self.user_id
    # != answer_choice.question.poll.where.not(author_id: self.user_id)
  end

  def not_duplicate_response
    !respondent_already_answered?
  end

  def respondent_already_answered?
    sibling_responses != sibling_responses.where.not(user_id: self.user_id)
  end

  def sibling_responses
    question.responses.where.not(id: self.id)
  end
end
