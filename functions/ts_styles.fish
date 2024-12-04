function ts_styles
    set -l style bg=#f3edda bg=#14222c
    set -l light_style $style[1]
    set -l dark_style $style[2]
    test -n "$dark_style" || set dark_style $light_style

    switch (dark)
        case dark
            set -gx ts_indent_guide_style $dark_style
        case light
            set -gx ts_indent_guide_style $light_style
    end
end
