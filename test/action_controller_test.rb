require_relative 'test_helper'

class ActionControllerIntegration < MiniTest::Test
  def test_logs_write_fragment
    instrument "write_fragment"

    assert_timer "action_controller.write_fragment.foo.bar"
  end

  def test_logs_read_fragment
    instrument "read_fragment"

    assert_timer "action_controller.read_fragment.foo.bar"
  end

  def test_logs_expire_fragment
    instrument "expire_fragment"

    assert_timer "action_controller.expire_fragment.foo.bar"
  end

  def test_logs_process_action
    instrument "process_action"

    assert_timer "action_controller.process_action.foo.bar"
  end

  def test_logs_send_file
    instrument "send_file"

    assert_timer "action_controller.send_file.foo.bar"
  end

  def instrument(event)
    super "#{event}.action_controller", { controller: 'foo', action: 'bar' }
  end
end
