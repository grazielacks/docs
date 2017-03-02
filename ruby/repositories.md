# Repositories

```sh
class ApplicationRepository
  extend self
  
  def new attributes
    model_class.new attributes
  end

  def create attributes
    model_class.create attributes
  end

  def destroy id
    object = find id
    object.destroy
  end

  def find id
    model_class.find id
  end

  def all
    model_class.all
  end

  def paginate page
    model_class.page page
  end    

  def model_class
    raise NotImplementedError
  end
end

class ProductRepository < ApplicationRepository
  def model_class
    Product
  end
end

class ProductsController < ApplicationController
  def index
    @products = repository.paginate params[:page]
  end
  
  private
    def repository
      @repository ||= ProductRepository.new
    end
end

class InvoiceRepository < ApplicationRepository
  module Delegation
    def create attributes
      object = model_class.create attributes
      
      if object.persisted?
        InvoiceMailer.new_message(object).delivery_now
        
        OtherActionService.new(object).perform 
      end
      
      object
    end
    
    def model_class
      Invoice
    end
  end
end

class InvoicesController < ApplicationController
  def index
    @invoices = InvoiceRepository.paginate params[:page]
  end
  
  def show
    @invoice = InvoiceRepository.find params[:id]
  end  
  
  def new
    @invoice = InvoiceRepository.new name: 'teste'
  end
  
  def create
    @invoice = InvoiceRepository.create invoice_params
  end
  
  def edit
    @invoice = InvoiceRepository.find params[:id]
  end

  def update
    @invoice = InvoiceRepository.update invoice_params, params[:id]
  end
  
  def destroy
    @invoice = InvoiceRepository.destroy params[:id]
  end
end
```
