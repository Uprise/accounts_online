class PdfsController < ApplicationController
  def show
    @application_form = current_user.application_form
    @ba1 = @application_form.bank_accounts[0] ? @application_form.bank_accounts[0] : BankAccount.new
    @ba2 = @application_form.bank_accounts[1] ? @application_form.bank_accounts[1] : BankAccount.new
    @ba3 = @application_form.bank_accounts[2] ? @application_form.bank_accounts[2] : BankAccount.new
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "show", :layout => "pdfs"
      end
    end
  end
end
