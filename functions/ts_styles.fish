function ts_styles
    set -l app
    set -l light
    set -l dark
    set -l style

    if set -q ZED_TERM
        switch "$__CFBundleIdentifier"
            case "dev.zed.Zed-Preview"
                set app zed_preview
            case "dev.zed.Zed"
                set app zed
        end
    else if set -q ALACRITTY_WINDOW_ID
        set app alacritty
    end

    set -l zed_preview bg=#f3edda bg=#14222c
    set -l zed bg=#14222c
    set -l alacritty bg=#2f383f

    set -l style $$app
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
