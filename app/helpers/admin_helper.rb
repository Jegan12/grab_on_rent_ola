module AdminHelper
  def driver_id(id)
    Driver.find_by_id(id)&.external_id
  end
end
