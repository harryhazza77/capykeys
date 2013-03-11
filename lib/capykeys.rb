require "capykeys/version"

module Capykeys
  module KeyPress

    KEYS = {
        left: 37,
        right: 39,
        enter: 13,
        space: 32,
        delete: 46,
        backspace: 8,
        A: 65
    }

    def type_word
      press_letter 5
    end

    def type_sentence
      11.times do
        type_word
        press_space
      end
    end

    def type_paragraph
      7.times do
        type_sentence
      end
    end

    def press_letter(times = nil)
      times = 1 unless times
      Integer(times).times do
        trigger_keypress KEYS[:A]
      end
    end

    def press_left
      trigger_keypress KEYS[:left]
    end

    def press_right
      trigger_keypress KEYS[:right]
    end

    def press_enter
      trigger_keypress KEYS[:enter]
    end

    def press_space
      trigger_keypress KEYS[:space]
    end

    def press_delete
      trigger_keypress KEYS[:delete]
    end

    def press_backspace
      trigger_keypress KEYS[:backspace]
    end

    private
    def trigger_keypress(key)
      if page.evaluate_script("typeof jQuery === 'undefined'")
        raise 'Jquery needs to be in the page!'
      else
        page.driver.browser.execute_script("$(function(){var e = $.Event('keyup', { which: #{key} }); $(document).trigger(e);});")
        page.driver.browser.execute_script("$(function(){var e = $.Event('keypress', { which: #{key} }); $(document).trigger(e);});")
        page.driver.browser.execute_script("$(function(){var e = $.Event('keydown', { which: #{key} }); $(document).trigger(e);});")
      end
    end
  end
end