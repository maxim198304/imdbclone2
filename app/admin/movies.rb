ActiveAdmin.register Movie do
  permit_params :title, :text, :rating, :category, :published_at, :user_id

  action_item :publish, only: :show do
    # link_to "Publish", publish_admin_movies_path(movies), method: :put if !movies.published_at?
  end

  member_action :publish, method: :put do
    movies = Movie.find(params[:id])
    movies.update(published_at: Time.zone.now)
    redirect_to admin_movies_path(movies)
  end
end
