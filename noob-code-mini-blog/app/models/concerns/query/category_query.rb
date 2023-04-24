module CategoryQuery
  extend ActiveSupport::Concern

  include BaseQuery

  included do

    extend ClassMethods

  end

  module ClassMethods
    def format_params(params)
      return {} unless params

      {
        id_eq: params[:id],
        name_eq: params[:name]
      }
    end

    def format_order(order = '')
      return Arel.sql(order) if order.present?

      [Arel.sql('id DESC NULLS LAST')]
    end
  end
end
