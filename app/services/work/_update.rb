class Work::Update
  def perform
    return Work::Edit.call(work, params) if params[:edit_button]
    return Work::Preview.call(work, params) if params[:preview_button]
    return Work::Post.call(work, params) if params[:post_button]
  end
end
