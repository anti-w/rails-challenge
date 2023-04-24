module PostQuery
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
        title_cont: params[:title],
        description_cont: params[:description],
        comments_comment_cont: params[:comment],
        category_id_eq: params[:category_id],
        user_id_eq: params[:user_id]
      }
    end

    def format_order(order = '')
      return Arel.sql(order) if order.present?

      [Arel.sql('id DESC NULLS LAST')]
    end
  end
end
