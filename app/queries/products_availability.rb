class ProductsAvailability
  attr_accessor :initial_scope

  def initialize(initial_scope)
    @initial_scope = initial_scope
  end

  def call(params)
    scoped = filter_by_date(initial_scope, params[:date])
    scoped = filter_by_location(scoped, params[:location])
    location_ids = scoped.pluck(:location_id).uniq
    scoped_hash = {}
    calculation(scoped, location_ids, scoped_hash)
    scoped_hash
  end

  private

  def filter_by_date(scope, date)
    date ? scope.where('created_at <= ?', date) : scope
  end

  def filter_by_location(scoped, location)
    location ? scoped.where(location_id: location.id) : scoped
  end

  def calculation(scoped, location_ids, scoped_hash)
    location_ids.each do |location_id|
      scoped_by_location = scoped.where(location_id: location_id)
      product_ids = scoped_by_location.pluck(:product_id).uniq
      scoped_hash[location_id] = []
      product_ids.each do |product_id|
        product_sum = scoped_by_location.where(product_id: product_id).sum(:quantity)
        scoped_hash[location_id] << { product_id => product_sum }
      end
    end
  end
end
