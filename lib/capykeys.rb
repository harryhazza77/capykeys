require "capykeys/version"

module Capykeys
  module KeyPress

    KEYS = {
        enter: 13,
        space: 32,
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

    def press_enter
      trigger_keypress KEYS[:enter]
    end

    def press_space
      trigger_keypress KEYS[:space]
    end

    private
    def trigger_keypress(key)
      page.driver.browser.execute_script("$(function(){var e = $.Event('keypress', { which: #{key} }); $(document).trigger(e);});")
    end
  end
end
