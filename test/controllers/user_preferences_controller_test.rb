require 'test_helper'

class UserPreferencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_preference = user_preferences(:one)
  end

  test 'should get index' do
    get user_preferences_url, as: :json
    assert_response :success
  end

  test 'should create user_preference' do
    assert_difference('UserPreference.count') do
      post user_preferences_url,
           params: { user_preference: { name: @user_preference.name, option: @user_preference.option,
                                        string: @user_preference.string,
                                        terms_agreement: @user_preference.terms_agreement } }, as: :json
    end

    assert_response :created
  end

  test 'should show user_preference' do
    get user_preference_url(@user_preference), as: :json
    assert_response :success
  end

  test 'should update user_preference' do
    patch user_preference_url(@user_preference),
          params: { user_preference: { name: @user_preference.name, option: @user_preference.option,
                                       string: @user_preference.string,
                                       terms_agreement: @user_preference.terms_agreement } }, as: :json
    assert_response :success
  end

  test 'should destroy user_preference' do
    assert_difference('UserPreference.count', -1) do
      delete user_preference_url(@user_preference), as: :json
    end

    assert_response :no_content
  end
end
