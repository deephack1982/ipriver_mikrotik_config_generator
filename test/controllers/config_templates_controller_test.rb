require 'test_helper'

class ConfigTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @config_template = config_templates(:one)
  end

  test "should get index" do
    get config_templates_url
    assert_response :success
  end

  test "should get new" do
    get new_config_template_url
    assert_response :success
  end

  test "should create config_template" do
    assert_difference('ConfigTemplate.count') do
      post config_templates_url, params: { config_template: { config_text: @config_template.config_text, description: @config_template.description, name: @config_template.name } }
    end

    assert_redirected_to config_template_url(ConfigTemplate.last)
  end

  test "should show config_template" do
    get config_template_url(@config_template)
    assert_response :success
  end

  test "should get edit" do
    get edit_config_template_url(@config_template)
    assert_response :success
  end

  test "should update config_template" do
    patch config_template_url(@config_template), params: { config_template: { config_text: @config_template.config_text, description: @config_template.description, name: @config_template.name } }
    assert_redirected_to config_template_url(@config_template)
  end

  test "should destroy config_template" do
    assert_difference('ConfigTemplate.count', -1) do
      delete config_template_url(@config_template)
    end

    assert_redirected_to config_templates_url
  end
end
