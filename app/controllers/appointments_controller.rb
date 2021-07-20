class AppointmentsController < ApplicationController
  def index
    @appointments = Appointments.all
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def show_by_user
    @appointments = current_user.appointments.sort_by
  end

  def new
    @types = Type.all
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new
    @appointment.name = appointment_params[:name]
    @appointment.adress = appointment_params[:adress]
    @appointment.phone = appointment_params[:phone]
    @appointment.type = Type.find(appointment_params[:type])
    @appointment.athonme = false
    @appointment.date = Time.now
    @appointment.user = current_user

    if @appointment.save

      redirect_to user_appointment_path(current_user)
    else
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:name, :adress, :phone, :date, :athonme, :type)
  end
end
