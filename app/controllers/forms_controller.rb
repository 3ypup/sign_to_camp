class FormsController < ApplicationController

def authentificate
  before_action :authenticate_user!
end

def new
@form = Form.new


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

      :photo_child,
      :photo_passport,
      :photo_medical)
  end
end
