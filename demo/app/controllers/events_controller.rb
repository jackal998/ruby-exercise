class EventsController < ApplicationController

before_action :set_event, :only => [:show, :edit, :destroy,:update]

	def index
		@events = Event.page(params[:page]).per(10)
	end

	def new
		@event = Event.new
	end

	def create
	  @event = Event.new(event_params)
	  if @event.save
	  	flash[:notice] = "新增成功"
	  	redirect_to :action => :index
	  else
	  	render :action => :new
	  end
	end

	def show
		@page_title = @event.name
	end

	def edit
	end

	def destroy
		@event.destroy
		flash[:alert] = "刪除成功"
	  redirect_to :action => :index
	end

	def update
		if @event.update(event_params)
			flash[:notice] = "編輯成功"
			redirect_to :action => :show,:id => @event
		else
			render :action =>	:edit
		end
	end

	private

	def set_event
		@event = Event.find(params[:id])
	end

	def event_params
	  params.require(:event).permit(:name, :description)
	end	
end
