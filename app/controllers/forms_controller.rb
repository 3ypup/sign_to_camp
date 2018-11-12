class FormsController < ApplicationController

def authentificate
  before_action :authenticate_user!
end

$vegan = ["Нет", "Да"]



def new
@form = Form.new


end

def index

@forms=Form.all
@myforms=Form.where(author: current_user.email)

end


def create

    @form = Form.new(form_params)
      
      if  @form.save
        redirect_to @form
      else
        render action: 'new'
      end
  end

def show

  @form = Form.find(params[:id])

  
end


def edit
@form = Form.find(params[:id])
end

def update

  @form = Form.find(params[:id])
     if  @form.update(form_params) 
        redirect_to @form

      else
        render action: 'edit'
      end

 end     




  def form_params
    params.require(:form).permit(
      :author,
      :name_child,
      :date_of_birth,
      :name_parent,
      :phones_parent,
      :phone_child,
      :adress,
      :email,
      :food_allergy,
      :vegan,
      :psycho,
      :events,
      :also,
      :bonus_contacts,
      :friends,
      :notes,
      :validation,
      :payment,

      :photo_child,
      :photo_passport,
      :photo_medical)
  end
end
