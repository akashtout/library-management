class Borrow < ApplicationRecord
  belongs_to :librarian
  belongs_to :book

  scope :showrequestedbook, -> { where(status: false) }
  scope :returnsbook, -> { where(status: nil) }
  scope :borrowbooks, ->(librarian) { where(student: librarian.name,status: true)}
  scope :studentrequestbook, ->(librarian) { where(student: librarian.name, status: false).or(where(student: librarian.name,status: true))}
  scope :starts_with, ->(id) { where("#{id}").update(status: nil)}
  scope :updatetrue, -> { update(status: true) }
end
