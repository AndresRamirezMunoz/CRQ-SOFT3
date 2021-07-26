class AppointmentsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @appointments = Appointment.all.order(created_at: :desc).page params[:page]
    @appointments.sort { |a, b| a.created_at <=> b.created_at }
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def show_by_user
    @appointments = current_user.appointments.order(created_at: :desc).page params[:page]
    @appointments.sort { |a, b| a.created_at <=> b.created_at }
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def new
    @types = Type.all
    @appointment = Appointment.new
  end

  def update_athome
    appointment = Appointment.find(params[:id])
    appointment.athonme = true

    if appointment.save
    end
    redirect_to appointments_path
  end

  def update
    @appointment = Appointment.find(params[:id])

    if appointment_params.keys.count > 1
      @appointment.name = appointment_params[:name]
      @appointment.adress = appointment_params[:adress]
      @appointment.phone = appointment_params[:phone]
      @appointment.type = Type.find(appointment_params[:type])

      if @appointment.save
        redirect_to user_appointment_path(current_user)
      else
        render :edit
      end
    else
      recuperator = Recuperator.find(appointment_params[:recuperator])

      if recuperator != Recuperator.first
        @appointment.recuperator = recuperator
        @appointment.save
      end
      redirect_to appointments_path
    end
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
    @appointment.recuperator = Recuperator.first

    if @appointment.save
      redirect_to user_appointment_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

    redirect_to user_appointment_path(current_user)
  end

  private

  def appointment_params
    params.require(:appointment).permit(:name, :adress, :phone, :date, :athonme, :type, :recuperator)
  end
end
