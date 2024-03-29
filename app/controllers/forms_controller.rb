class FormsController < ApplicationController

def authentificate
  before_action :authenticate_user!
end



$vegan = ["Нет", "Да"]




def new


@form = Form.new



end



def refreshed

recount

end




def index


@user = current_user

if current_user.level >1

  @formsall = Form.where(archive: "false")
  @forms = @formsall.order("name_child")
  @validate_result = Form.where(validation: "1").count
 # @payment_result = Form.where(payment: "1", payment2: "1", payment3: "1").count
 # @success_result = Form.where(validation: "1", payment: "1", payment2: "1", payment3: "1").count


  @payment_result = Form.where(payment: "1").count
  @success_result = Form.where(validation: "1", payment: "1").count

else

  @forms=@user.forms.all

end
recount

  
respond_to do | format |  

    format.html # index.html.erb
    format.json { render :json => @forms }
    format.xlsx {
      xlsx_package = @forms.to_xlsx
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

def archive


@user = current_user

if current_user.level >1

  @forms = Form.where(archive: true)

else

  @forms=@user.forms.all

end
recount


respond_to do | format |  
    format.html # index.html.erb
    format.json { render :json => @forms }
    format.xlsx {
      xlsx_package = @forms.to_xlsx
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


def myforms


@user = current_user


  @forms=@user.forms.all


recount


respond_to do | format |  
    format.html # index.html.erb
    format.json { render :json => @forms }
    format.xlsx {

        xlsx_package = Form.where(email: current_user.email).to_xlsx
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
    @url = user_forms_url(@user)
    @admins = User.where(level:4)

      if  @form.save
        @admins.each do |admin|
        UserMailer.new_form(admin, @url).deliver
        end
        redirect_to user_forms_path(@user)
      else
        render action: 'new'
      end
     

end

def show
recount

@user = User.find(params[:user_id])

if current_user.level > 1

  @form = @user.forms.find(params[:id])


else
  @form = current_user.forms.find(params[:id])

end

  
end


def edit
  @form = Form.find(params[:id])


end

def update


@admins = User.where(level:4)

  @form = Form.find(params[:id])
  @notes = @form.notes

  
     if  @form.update(form_params) 

        if current_user.level>1
        @url = user_form_url(form_params)

              if @form.validation == 1
                  #if @form.payment + @form.payment2 == 2
                  if @form.payment == 1
                      UserMailer.success_confirmation(@form, @url).deliver
                  
                    else
                       UserMailer.success_confirmation_first(@form, @url).deliver

                  end
              

              else
              UserMailer.signup_confirmation(@form, @url).deliver

             end

         
         else
         @admins.each do |admin|   
         UserMailer.new_form(admin, @url).deliver
        end
          

        
         end
          redirect_to user_form_path(@form.user_id)


      else
        render action: 'edit'
      end

 end     

def passports

  @user = current_user

  if current_user.level >1

  @formsall = Form.where(archive: "false")
  @forms = @formsall.order("name_child")
  @validate_result = Form.where(validation: "1").count
  #@payment_result = Form.where(payment: "1", payment2: "1", payment3: "1").count
  #@success_result = Form.where(validation: "1", payment: "1", payment2: "1", payment3: "1").count

  @payment_result = Form.where(payment: "1").count
  @success_result = Form.where(validation: "1", payment: "1").count

else

  @forms=@user.forms.all

end
recount

  
respond_to do | format |  

    format.html # index.html.erb
    format.json { render :json => @forms }
    format.xlsx {
      xlsx_package = @forms.to_xlsx
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
      :accept,
      :archive,
      :payment2,
      :payment3,


      :photo_child,
      :photo_passport,
      :photo_medical,

      :passport,
      :sex,
      :history)
  end
end
