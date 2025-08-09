static const char norm_fg[] = "#c7c5c2";
static const char norm_bg[] = "#22190e";
static const char norm_border[] = "#72695e";

static const char sel_fg[] = "#c7c5c2";
static const char sel_bg[] = "#55B5A9";
static const char sel_border[] = "#c7c5c2";

static const char urg_fg[] = "#c7c5c2";
static const char urg_bg[] = "#60708A";
static const char urg_border[] = "#60708A";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
