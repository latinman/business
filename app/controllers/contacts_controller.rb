class ContactsController < ApplicationController


  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]

      flash[:success] = "Message sent"
      redirect_to new_contact_path
    else
      flash[:danger] = "Message couldn't be sent."
      render "new"
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :comments)
  end
end