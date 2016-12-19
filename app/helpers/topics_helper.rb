module TopicsHelper
  def choose_new_or_edit
    if action_name == 'new'
      user_topics_path
    elsif action_name == 'edit'
      user_topic_path
    end
  end
end
