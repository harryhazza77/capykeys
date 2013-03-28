require "capykeys/version"

module Capykeys
  module KeyPress

    KEYS = {
      left: {keydown: 37, keypress: -1, keyup: 37},
      up: {keydown: 38, keypress: -1, keyup: 38},
      right: {keydown: 39, keypress: -1, keyup: 39},
      down: {keydown: 40, keypress: -1, keyup: 40},
      enter: {keydown: 13, keypress: 13, keyup: 13},
      space: {keydown: 32, keypress: 32, keyup: 32},
      delete: {keydown: 46, keypress: -1, keyup: 46},
      backspace: {keydown: 8, keypress: -1, keyup: 8},
      A: {keydown: 65, keypress: 65, keyup: 65},
      B: {keydown: 66, keypress: 66, keyup: 66},
    }

    CHARS_IN_A_WORD = 5
    WORDS_IN_A_SENTENCE = 11
    SENTENCES_IN_A_PARAGRAPH = 7

    def type_word
      press_letter CHARS_IN_A_WORD
    end

    def fill_line
      type_sentence
      press_letter 3
    end

    def type_sentence
      WORDS_IN_A_SENTENCE.times do
        type_word
        press_space
      end
    end

    def type_paragraph
      SENTENCES_IN_A_PARAGRAPH.times do
        type_sentence
      end
    end

    def press_letter(times = nil)
      times = 1 unless times
      Integer(times).times do
        trigger_keypress KEYS[:A]
      end
    end

    def press_letter_b(times = nil)
      times = 1 unless times
      Integer(times).times do
        trigger_keypress KEYS[:B]
      end
    end

    def press_left
      trigger_keypress KEYS[:left]
    end

    def press_right
      trigger_keypress KEYS[:right]
    end

    def press_up
      trigger_keypress KEYS[:up]
    end

    def press_down
      trigger_keypress KEYS[:down]
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
        page.driver.browser.execute_script("$(function(){var e = $.Event('keydown', { which: #{key[:keydown]} }); $(document).trigger(e);});")        
        page.driver.browser.execute_script("$(function(){var e = $.Event('keypress', { which: #{key[:keypress]} }); $(document).trigger(e);});")
        page.driver.browser.execute_script("$(function(){var e = $.Event('keyup', { which: #{key[:keyup]} }); $(document).trigger(e);});")
      end
    end
  end
end