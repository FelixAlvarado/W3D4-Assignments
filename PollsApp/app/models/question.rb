# == Schema Information
#
# Table name: questions
#
#  id         :bigint(8)        not null, primary key
#  text       :string           not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  validates :text, presence: true

  belongs_to :poll,
  primary_key: :id,
  foreign_key: :poll_id,
  class_name: :Poll

  has_many :answer_choices,
  primary_key: :id,
  foreign_key: :question_id,
  class_name: :AnswerChoice

  has_many :responses,
  through: :answer_choices,
  source: :responses

  def results
    answer_choices =
    self.answer_choices
    .select('answer_choices.* , COUNT(responses.id)')
    .left_outer_joins(:responses, :question)
    .where(answer_choices: {question_id: self.id})
    .group(:id)

    results = {}
    answer_choices.each do |choice|
      results[choice] = choice.responses.length
    end

    results
  end


end