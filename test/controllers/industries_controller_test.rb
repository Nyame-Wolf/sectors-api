require 'test_helper'

class IndustriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @industry = industries(:one)
  end

  test 'should get index' do
    get industries_url, as: :json
    assert_response :success
  end

  test 'should create industry' do
    assert_difference('Industry.count') do
      post industries_url, params: { industry: { name: @industry.name } }, as: :json
    end

    assert_response :created
  end

  test 'should show industry' do
    get industry_url(@industry), as: :json
    assert_response :success
  end

  test 'should update industry' do
    patch industry_url(@industry), params: { industry: { name: @industry.name } }, as: :json
    assert_response :success
  end

  test 'should destroy industry' do
    assert_difference('Industry.count', -1) do
      delete industry_url(@industry), as: :json
    end

    assert_response :no_content
  end
end
