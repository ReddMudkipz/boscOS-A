/* APPEARANCE */

// Windows
static const unsigned int borderpx      = 3;      /* width of window borders */
static const unsigned int snap          = 5;      /* proximity for edge snap */
static const unsigned int gappx         = 10;     /* width of gaps between windows */
static const unsigned int gappxMin      = gappx;  /* minimum size of gaps */

// Topbar
static const int showbar            = 1;                        /* 0 means no bar */
static const int topbar             = 0;                        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=10" };  /* topbar font */

// Colors
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_gray5[]       = "#151515";
static const char col_black[]       = "#000000";
static const char col_burgundy[]    = "#a93226";
static const char col_burgundy2[]    = "#800020";
static const char col_burgundy3[]    = "#34000d";
static const char col_cyan[]        = "#005577";

static const char *colors[][3]      = {
  /*               fg          bg             border   */
  [SchemeNorm] = { col_gray3,  col_gray1,     col_black },
  [SchemeSel]  = { col_gray4,  col_burgundy2,  col_burgundy2  },
  [SchemeUns]  = { col_gray2,  col_gray1,     col_black },
  [SchemeUnf]  = { col_gray4,  col_gray1,  col_black  },
  [SchemeHid]  = { col_gray5,  col_gray1,     col_black  },
  [SchemeInv]  = { col_gray3,  col_gray1,     col_black },
};

// Layout symbols
/* first entry is default */
static const Layout layouts[] = {
  /* symbol     arrange function */
  { "[M]",      monocle },
  { "[]=",      tile },
  /* { "><>",      NULL },    no layout function means floating behavior. */
};

/* TAGGING */

// Tag names
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

// Tag labels
static const char ptagf[] = "[%s %s]";  /* format for tag label in use */
static const char etagf[] = "[%s]";     /* format for empty tag labe l */
static const int lcaselbl = 0;          /* 0, tag labels default. 1, tag labels lowercase. */

// Tag defaults for applications
static const Rule rules[] = {
  /* xprop(1):
   *  WM_CLASS(STRING) = instance, class
   *  WM_NAME(STRING) = title
   */
  /* class      instance    title       tags mask     isfloating   monitor */
  { "steam",    NULL,       NULL,       0,            0,           -1 },
};

// Window following
#define WFACTIVE '>'
#define WFINACTIVE 'v'
#define WFDEFAULT WFACTIVE

/* LAYOUT OPTIONS */

// Master and focus
static const float mfact     = 0.5;   /* size of master area */
static const int nmaster     = 1;     /* number of clients in master area */
static const int resizehints = 1;     /* 1, respect size hints in tiled resizal */
static const int lockfullscreen = 0;  /* 1, force focus on fullscreen window */

/* SHORTCUTS */

// Modifier definitions
#define MODKEY Mod1Mask  /* Alt key */
#define SUPKEY Mod4Mask  /* GUI key */

// Tagkeys
#define TAGKEYS(KEY,TAG)                                                \
  { SUPKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
  { SUPKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
  { SUPKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
  { SUPKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

// Shell command helper
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* Aliases */
// Default
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-p", "boscOS:", NULL };  /* dmenu */
static const char *termcmd[]  = { "alacritty", NULL };                                   /* terminal of choice */
static const char *slock[]  = { "slock", NULL };                                         /* lock screen */
static const char *screenCapture[]  = { "flameshot","gui", NULL };                       /* screen capture */

// App launcher
static const char *emacs[]  = { "emacsclient","-c","-a","''", NULL }; /* opens emacs as client, or starts daemon */
static const char *copyq[]  = { "copyq","menu", NULL }; /* shows copyq window */

// Dmenu
static const char dmpower[] = "bash $HOME/.dotfiles/dmenu/scripts/dmpower"; /* power options */
static const char dmnix[] = "bash $HOME/.dotfiles/dmenu/scripts/dmnix"; /* nix commands */
static const char dmfirefox[] = "bash $HOME/.dotfiles/dmenu/scripts/dmfirefox"; /* select specific firefox profile */

// Media controls
static const char *mutecmd[] = { "amixer", "-q", "set", "Master", "toggle", NULL };            /* mute */
static const char *volupcmd[] = { "amixer", "-q", "set", "Master", "5%+", "unmute", NULL };    /* volume up */
static const char *voldowncmd[] = { "amixer", "-q", "set", "Master", "5%-", "unmute", NULL };  /* volume down */
static const char *miccmd[] = { "amixer", "set", "Capture", "toggle", NULL };                  /* toggle mic */
static const char *medplaypausecmd[] = { "playerctl", "play-pause", NULL };                    /* play/pause */
static const char *mednextcmd[] = { "playerctl", "next", NULL };                               /* next */
static const char *medprevcmd[] = { "playerctl", "previous", NULL };                           /* previous */

// Brightness
static const char *brupcmd[] = { "brightnessctl", "set", "10%+", NULL };    /* brightness up */
static const char *brdowncmd[] = { "brightnessctl", "set", "10%-", NULL };  /* brightness down */

/* Additional modules */
#include <X11/XF86keysym.h> /* allows dwm to listen for XF86 keys */

/* Keyboard Shortcuts */
static const Key keys[] = {
  /* modifier                     key        function        argument */
  // Default
  { SUPKEY,                       XK_r,      spawn,          {.v = dmenucmd } },       /* open dmenu */
  { SUPKEY,                       XK_Return, spawn,          {.v = termcmd } },        /* open terminal */
  { SUPKEY,                       XK_l,      spawn,          {.v = slock } },          /* lock screen */
  { SUPKEY,                       XK_Print,  spawn,          {.v = screenCapture } },  /* screen capture */
  { SUPKEY,                       XK_b,      togglebar,      {0} },                    /* toggle status bar */
  { SUPKEY|ShiftMask,                       XK_w,      killclient,     {0} },                    /* close window */

  // Media controls
  { 0, XF86XK_AudioMute, spawn, {.v = mutecmd } },            /* toggle mute */
  { 0, XF86XK_AudioLowerVolume, spawn, {.v = voldowncmd } },  /* volume up */
  { 0, XF86XK_AudioRaiseVolume, spawn, {.v = volupcmd } },    /* volume down */
  { 0, XF86XK_AudioMicMute, spawn, {.v = miccmd } },    /* volume down */
  { 0, XF86XK_AudioPlay, spawn, {.v = medplaypausecmd } },    /* play/pause */
  { 0, XF86XK_AudioNext, spawn, {.v = mednextcmd } },         /* next */
  { 0, XF86XK_AudioPrev, spawn, {.v = medprevcmd } },         /* previous */

  // Brightness controls
  { 0, XF86XK_MonBrightnessUp, spawn, {.v = brupcmd} },       /* brightness up */
  { 0, XF86XK_MonBrightnessDown, spawn, {.v = brdowncmd} },   /* brightness down */

  // Programs
  { SUPKEY,                       XK_e,      spawn,          {.v = emacs } },  /* opens emacs as client, if not start daemon */
  { SUPKEY,                       XK_v,      spawn,          {.v = copyq } },  /* opens emacs as client, if not start daemon */

  // For Sunshine
  { MODKEY|ControlMask|ShiftMask,                       XK_r,      spawn,          {.v = dmenucmd } },       /* open dmenu, for use in sunshine */
  { MODKEY|ControlMask|ShiftMask,                       XK_b,      togglebar,      {0} },                    /* toggle status bar */
  { MODKEY|ControlMask|ShiftMask,                       XK_l,      spawn,          {.v = slock } },          /* lock screen */

  // Dmenu
  { SUPKEY|ShiftMask,             XK_q,      spawn,          SHCMD(dmpower) },  /* power options */
  { SUPKEY|ShiftMask,             XK_n,      spawn,          SHCMD(dmnix) },    /* nix menu */
  { SUPKEY|ShiftMask,             XK_f,      spawn,          SHCMD(dmfirefox) },    /* select specific firefox profile */

  // Focus
  /* Cycle between visible windows */
  { SUPKEY,                       XK_j,      focusstackvis,  {.i = +1 } },
  { SUPKEY,                       XK_k,      focusstackvis,  {.i = -1 } },
  /* Cycle with hidden windows as well */
  { SUPKEY|ShiftMask,             XK_j,      focusstackhid,  {.i = +1 } },
  { SUPKEY|ShiftMask,             XK_k,      focusstackhid,  {.i = -1 } },

  { SUPKEY,                       XK_h,      hide,           {0} },  /* hide window */
  { SUPKEY,                       XK_s,      show,           {0} },  /* show window */
  { SUPKEY|ShiftMask,             XK_s,      showall,        {0} },  /* show all windows */

  // Alignment
  { SUPKEY,                       XK_m,      setlayout,      {.v = &layouts[0]} },  /* switch to monocle mode */
  { SUPKEY,                       XK_t,      setlayout,      {.v = &layouts[1]} },  /* switch to tile mode */
  /* { SUPKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },  switch to float mode */
  { SUPKEY,                       XK_space,  setlayout,      {0} },                 /* previous mode */
  { SUPKEY|ShiftMask,             XK_space,  togglefloating, {0} },                 /* toggle window floating */

  // Tile windows \\

  // Master
  { SUPKEY|ShiftMask,                       XK_i,      incnmaster,     {.i = +1 } },  /* increase number of clients in master area */
  { SUPKEY|ShiftMask,                       XK_u,      incnmaster,     {.i = -1 } },  /* decrease number of clients in master area */
  { SUPKEY,                       XK_u,      setmfact,       {.f = -0.05} },          /* increase size of master area */
  { SUPKEY,                       XK_i,      setmfact,       {.f = +0.05} },          /* decrease size of master area */
  { SUPKEY,                       XK_o, zoom,           {0} },                        /* swap primary window */

  // Layout \\

  // Gaps
  { SUPKEY,                       XK_minus,  setgaps,        {.i = -1 } },  /* decrease gap width */
  { SUPKEY|ShiftMask,             XK_equal,  setgaps,        {.i = +1 } },   /* increase gap width*/
  { SUPKEY,                       XK_equal,  setgaps,        {.i = 0  } },      /* reset gap width */

  // Floating windws \\

  // Move
  { SUPKEY,                       XK_Down,   moveresize,     {.v = "0x 25y 0w 0h" } },   /* move window down */
  { SUPKEY,                       XK_Up,     moveresize,     {.v = "0x -25y 0w 0h" } },  /* move window up */
  { SUPKEY,                       XK_Right,  moveresize,     {.v = "25x 0y 0w 0h" } },   /* move window right */
  { SUPKEY,                       XK_Left,   moveresize,     {.v = "-25x 0y 0w 0h" } },  /* move window left */

  // Move (to edge)
  { SUPKEY|ControlMask,           XK_Up,     moveresizeedge, {.v = "t"} },  /* snap to top edge */
  { SUPKEY|ControlMask,           XK_Down,   moveresizeedge, {.v = "b"} },  /* snap to bottom edge */
  { SUPKEY|ControlMask,           XK_Left,   moveresizeedge, {.v = "l"} },  /* snap to left edge */
  { SUPKEY|ControlMask,           XK_Right,  moveresizeedge, {.v = "r"} },  /* snap to right edge */

  // Resize
  { SUPKEY|ShiftMask,             XK_Down,   moveresize,     {.v = "0x 0y 0w 25h" } },   /* increase height */
  { SUPKEY|ShiftMask,             XK_Up,     moveresize,     {.v = "0x 0y 0w -25h" } },  /* decrease height */
  { SUPKEY|ShiftMask,             XK_Right,  moveresize,     {.v = "0x 0y 25w 0h" } },   /* increase width */
  { SUPKEY|ShiftMask,             XK_Left,   moveresize,     {.v = "0x 0y -25w 0h" } },  /* decrease width */

  // Resise (to edge)
  { SUPKEY|ControlMask|ShiftMask, XK_Up,     moveresizeedge, {.v = "T"} },  /* snap height to top edge */
  { SUPKEY|ControlMask|ShiftMask, XK_Down,   moveresizeedge, {.v = "B"} },  /* snap height to bottom edge */
  { SUPKEY|ControlMask|ShiftMask, XK_Left,   moveresizeedge, {.v = "L"} },  /* snap width to left edge */
  { SUPKEY|ControlMask|ShiftMask, XK_Right,  moveresizeedge, {.v = "R"} },  /* snap width to right edge */

  // Multi-monitor
  { SUPKEY,                       XK_comma,  focusmon,       {.i = -1 } },  /* focus monitor on left */
  { SUPKEY,                       XK_period, focusmon,       {.i = +1 } },  /* focus monitor on right */
  { SUPKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },  /* move window to monitor on left */
  { SUPKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },  /* move window to monitor on right */

  // Tags
  { SUPKEY,                       XK_Tab,    view,           {0} },          /* view previous tag */
  { SUPKEY,                       XK_0,      view,           {.ui = ~0 } },  /* view all tags*/
  { SUPKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },  /* assign all tags to window */
  { SUPKEY,                       XK_Page_Down,  viewnext,       {0} },          /* view tag to the right */
  { SUPKEY,                       XK_Page_Up,   viewprev,       {0} },          /* view tag to the left */
  { SUPKEY|ShiftMask,             XK_Page_Down,  tagtonext,      {0} },          /* assign to tag to the right */
  { SUPKEY|ShiftMask,             XK_Page_Up,   tagtoprev,      {0} },          /* assign to tag to the left */
  { SUPKEY,                       XK_n,      togglefollow,   {0} },

  // Default tag controls
  TAGKEYS(                        XK_1,                      0)
  TAGKEYS(                        XK_2,                      1)
  TAGKEYS(                        XK_3,                      2)
  TAGKEYS(                        XK_4,                      3)
  TAGKEYS(                        XK_5,                      4)
  TAGKEYS(                        XK_6,                      5)
  TAGKEYS(                        XK_7,                      6)
  TAGKEYS(                        XK_8,                      7)
  TAGKEYS(                        XK_9,                      8)
};

// Mouse functionality \\

static const Button buttons[] = {
  /* click                event mask      button          function        argument */
  { ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
  { ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
  { ClkWinTitle,          0,              Button1,        togglewin,      {0} },
  { ClkFollowSymbol,      0,              Button1,        togglefollow,   {0} },
  { ClkWinTitle,          0,              Button2,        zoom,           {0} },
  { ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
  { ClkClientWin,         SUPKEY,         Button1,        movemouse,      {0} },
  { ClkClientWin,         SUPKEY,         Button2,        togglefloating, {0} },
  { ClkClientWin,         SUPKEY,         Button3,        resizemouse,    {0} },
  { ClkTagBar,            0,              Button1,        view,           {0} },
  { ClkTagBar,            0,              Button3,        toggleview,     {0} },
  { ClkTagBar,            SUPKEY,         Button1,        tag,            {0} },
  { ClkTagBar,            SUPKEY,         Button3,        toggletag,      {0} },
};
