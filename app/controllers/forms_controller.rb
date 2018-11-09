class FormsController < ApplicationController





  def form_params
    params.require(:form).permit(
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
      :medical)
  end
end
