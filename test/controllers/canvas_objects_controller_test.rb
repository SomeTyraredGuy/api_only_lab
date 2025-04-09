require "test_helper"

class CanvasObjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @canvas_object = canvas_objects(:one)
  end

  test "should get index" do
    get canvas_objects_url, as: :json
    assert_response :success
  end

  test "should create canvas_object" do
    assert_difference("CanvasObject.count") do
      post canvas_objects_url, params: { canvas_object: { board_id: @canvas_object.board_id, height: @canvas_object.height, width: @canvas_object.width, x: @canvas_object.x, y: @canvas_object.y } }, as: :json
    end

    assert_response :created
  end

  test "should show canvas_object" do
    get canvas_object_url(@canvas_object), as: :json
    assert_response :success
  end

  test "should update canvas_object" do
    patch canvas_object_url(@canvas_object), params: { canvas_object: { board_id: @canvas_object.board_id, height: @canvas_object.height, width: @canvas_object.width, x: @canvas_object.x, y: @canvas_object.y } }, as: :json
    assert_response :success
  end

  test "should destroy canvas_object" do
    assert_difference("CanvasObject.count", -1) do
      delete canvas_object_url(@canvas_object), as: :json
    end

    assert_response :no_content
  end
end
