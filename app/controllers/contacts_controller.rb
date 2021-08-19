class ContactsController < ApplicationController
  before_action :set_contact, only: [:destroy]
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_path
    else
      render :new
    end
  end

  def destroy
    if @contact.destroy
      redirect_to contacts_path
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :number, :email)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end
end
