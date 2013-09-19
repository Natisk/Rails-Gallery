ActiveAdmin.register VisitedLink do

  menu false

  index title: proc{params[:user_id].blank? ? 'Navigation' : "Navigation > #{User.find(params[:user_id]).email}"} do
    selectable_column
    column :id
    column :link
    column :created_at
  end

  controller do

    def scoped_collection
      VisitedLink.where('user_id = :user_id', user_id: params[:user_id])
    end

  end

end