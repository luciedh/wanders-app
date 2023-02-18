if @comment.persisted?
  json.inserted_item render(partial: "shared/comments",
                            formats: :html,
                            locals:{comment: @comment})
end
