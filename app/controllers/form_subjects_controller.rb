class FormSubjectsController < ApplicationController

  def create

    return unless params.has_key?(:subjects) 
    form = FormSubject.create_form_subject(params[:form_id], params[:subjects])
    respond_to do |format|
      if form[0]
        format.html { redirect_to forms_url, notice: "Subject(s) successfully added to class" }
        format.json { render :show, status: :created }
      else
        format.html { redirect_to forms_url, notice: "Action Failed" }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
   
  end

  def destroy
    form_subject = FormSubject.find(params[:id])
    form_subject.destroy
    redirect_back_or_to root_path,  notice: "Action completed successifully"
  end

end
