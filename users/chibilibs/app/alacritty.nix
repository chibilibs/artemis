{ pkgs, ... } =
{
    programs.alacritty = {
        enable = true;
        config = {
            font = {
                normal = {
                    family = "Hack Nerd Font";
                    style = "Regular";
                };
                bold = {
                    family = "Hack Nerd Font";
                    style = "Bold";
                };
                italic = {
                    family = "Hack Nerd Font";
                    style = "Italic";
                };

                size = 8.5;
            };

            colors = {
                primary = {
                    background =        "#080808";
                    foreground =        "#bdbdbd";
                    bright_foreground = "#eeeeee";
                };
                cursor = {
                    text =   "#080808";
                    cursor = "#9e9e9e";
                };
                selection = {
                    text =       "#080808";
                    background = "#b2ceee";
                };
                normal = {
                    black =   "#323437";
                    red =     "#ff5454";
                    green =   "#8cc85f";
                    yellow =  "#e3c78a";
                    blue =    "#80a0ff";
                    magenta = "#cf87e8";
                    cyan =    "#79dac8";
                    white =   "#c6c6c6";
                };
                bright = {
                    black =   "#949494";
                    red =     "#ff5189";
                    green =   "#36c692";
                    yellow =  "#c2c292";
                    blue =    "#74b2ff";
                    magenta = "#ae81ff";
                    cyan =    "#85dc85";
                    white =   "#e4e4e4";
                };
            };
        };
    }
}
