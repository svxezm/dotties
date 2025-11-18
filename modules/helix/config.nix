{ ... }:
{
  theme = "rose_pine_moon";

  editor = {
    line-number = "relative";
    auto-completion = true;
    text-width = 80;
    bufferlie = "multiple";
    default-line-ending = "lf";

    whitespace = {
      render = "all";

      characters = {
        space = "·";
        nbsp = "⍽";
        nnbsp = "␣";
        tab = "→";
        newline = "⏎";
        tabpad = "·";
      };
    };
  };

  keys = {
    normal = {
      C-s = ":w";

      n = "move_char_left";
      N = "keep_selections";
      k = "search_next";
      K = "search_prev";
      e = "move_line_down";
      E = "join_selections";
      j = "move_next_word_end";
      J = "move_next_long_word_end";
      i = "move_char_right";
      I = "no_op";
      h = ["collapse_selection" "insert_mode"];
      H = "insert_at_line_start";
      u = "move_line_up";
      U = "no_op";
      l = "undo";
      L = "redo";
      a = ["collapse_selection" "append_mode"];
      A = ["collapse_selection" "insert_at_line_end"];
    };

    select = {
      n = "extend_char_left";
      N = "keep_selections";
      k = "extend_search_next";
      K = "extend_search_prev";
      e = "extend_visual_line_down";
      E = "join_selections";
      j = "extend_next_word_end";
      J = "extend_next_long_word_end";
      i = "extend_char_right";
      I = "no_op";
      h = "insert_mode";
      H = "insert_at_line_start";
      u = "extend_visual_line_up";
      U = "no_op";
      l = "undo";
      L = "redo";
    };

    insert = {
      C-s = [":w" "normal_mode"];
    };
  };
}
