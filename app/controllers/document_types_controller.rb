class DocumentTypesController < ApplicationController
	def new
		@document_type = DocumentType.new
	end
	
	def create
	  @document_type = DocumentType.new(params[:document_type])

	  if @document_type.save
		redirect_to @document_type
	  else
		render 'new'
	  end
	end

	def show
	  @document_type = DocumentType.find(params[:id])
	end

	def index
	  @document_types = DocumentType.all
	end

	def edit
	  @document_type = DocumentType.find(params[:id])
	end

	def update
	  @document_type = DocumentType.find(params[:id])
	 
	 if @document_type.update_attributes(params[:document_type].permit(:description))
		redirect_to @document_type
	  else
		render 'edit'
	 end
	end

	def destroy
	  @document_type = DocumentType.find(params[:id])
	  @document_type.destroy
	 
	  redirect_to document_types_path
	end
	
end
