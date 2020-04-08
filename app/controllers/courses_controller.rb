class CoursesController < ApplicationController
  def get_courses_by_location
    @courses = Course.where("location_id = ?", params[:location_id])
    respond_to do |format|
      format.json { render :json => @courses }
    end
  end

  def course_search
    if params[:location].present? && params[:location].strip != ""
      @courses = Course.where("location_id = ?", params[:location])
    else
      @courses = Course.all
    end
  end
end
