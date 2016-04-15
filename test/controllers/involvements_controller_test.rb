require 'test_helper'

class InvolvementsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @owner = users(:leonhart)
    @other = users(:lc)
    @book = books(:one)
  end

  test "create should require logged-in user" do
    assert_no_difference 'Involvement.count' do
      post involvements_path
    end
    assert_redirected_to new_user_session_path
  end

  test "destroy should require logged-in user" do
    assert_no_difference 'Involvement.count' do
      delete involvement_path(involvements(:one).id)
    end
    assert_redirected_to new_user_session_path
  end

  test "create should require owner" do
    log_in_as @other
    assert_no_difference 'Involvement.count' do
      post involvements_path, params: {
        involvement: { user: @other.name },
        book_id: @book.id
      }
    end
  end

  test "destroy should require owner" do
    log_in_as @other
    assert_no_difference 'Involvement.count' do
      delete involvement_path(involvements(:one).id)
    end
  end
end
