class FormSubjectsController < ApplicationController
  def index
  end

  def new
  end

  def create

    params[:subjects].each do |subject_id|

      return redirect_to_or root_path ,notice: "Subject does not exist" unless Subject.exists?(subject_id) 
      FormSubject.create(form_id: params[:form_id], subject_id: subject_id)
    end
    
    respond_to do |format|
      if @form.save
        format.html { redirect_to forms_url, notice: "Form was successfully created." }
        format.json { render :show, status: :created, location: @form }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end
end
