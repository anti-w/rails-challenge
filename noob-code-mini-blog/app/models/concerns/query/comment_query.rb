module CommentQuery
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
          user_id: params[:user_id],
          post_id: params[:post_id]
        }
      end
  
      def format_order(order = '')
        return Arel.sql(order) if order.present?
  
        [Arel.sql('id DESC NULLS LAST')]
      end
    end
  end
  