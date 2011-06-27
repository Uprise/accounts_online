require 'spec_helper'

describe BankAccount do
  pending "add some examples to (or delete) #{__FILE__}"
end


# == Schema Information
#
# Table name: bank_accounts
#
#  id                     :integer         not null, primary key
#  bank                   :string(255)
#  branch                 :string(255)
#  account                :string(255)
#  suffix                 :string(255)
#  application_form_id    :integer
#  order                  :integer
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  needs_cheques          :boolean
#  pays_subscription      :boolean
#  number_of_transactions :integer
#

