class Thirdspace::ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params) 

    if @contact.save
      flash[:notice] = 'Your message has been submitted successfully'
      redirect_to thirdspace_dashboard_path
    else
      flash[:alert] = 'There was an error submitting your message. Please try again.'
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:subject, :description)
  end
end
