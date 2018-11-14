class FormsController < ApplicationController

def authentificate
  before_action :authenticate_user!
end

$vegan = ["Нет", "Да"]

def recount
@forms_count = Form.where(refresh: 1) 

@count = @forms_count.count
end


def new


@form = Form.new




end

def refreshed

recount

end

def index


@user = current_user

@forms=@user.forms.all


recount


respond_to do | format |  
    format.html # index.html.erb
    format.json { render :json => @forms }
    format.xlsx {
      xlsx_package = Form.to_xlsx
      begin 
        temp = Tempfile.new("forms.xlsx") 
        xlsx_package.serialize "/tmp/forms"
        send_file "/tmp/forms", :filename => "Список участников.xlsx", :type => "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
      ensure
        temp.close 
        temp.unlink
    end
 }  
end
end

def create
 
    @user = User.find(params[:user_id])
    @form = @user.forms.new(form_params)

      if  @form.save
        redirect_to user_forms_path(@user)
      else
        render action: 'new'
      end
     

end

def show
recount

  @user = User.find(params[:user_id])

  @form = current_user.forms.find(params[:id])


  


  
end


def edit
@form = Form.find(params[:id])
end

def update

  @form = Form.find(params[:id])
     if  @form.update(form_params) 
        redirect_to user_form_path(@form.user_id)



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
      :refresh,

      :photo_child,
      :photo_passport,
      :photo_medical)
  end
end
