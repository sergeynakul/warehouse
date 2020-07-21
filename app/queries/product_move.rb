class ProductMove
  attr_accessor :new_products_movement

  def initialize(new_products_movement)
    @new_products_movement = new_products_movement
  end

  def call(params)
    new_products_movement.quantity = -new_products_movement.quantity if params[:move_type] == :shipment
    new_products_movement.save!
  end
end
