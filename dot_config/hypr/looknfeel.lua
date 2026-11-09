-- Change the default Omarchy look'n'feel.

-- Prevent apps from stealing focus/workspace when they request activation on
-- launch (e.g. Signal/Spotify autostarting and yanking focus away from
-- whatever workspace was set as default on login).
hl.config({
  misc = {
    focus_on_activate = false,
  },
})

-- Snap floating windows to each other and to the monitor edges.
-- Gaps are matched to Omarchy's tiling gaps (gaps_in = 5, gaps_out = 10) and
-- respect_gaps keeps that same spacing after a window snaps, instead of
-- slamming windows flush together.
hl.config({
  general = {
    snap = {
      enabled = true,
      window_gap = 10, -- snap distance to other windows
      monitor_gap = 10, -- snap distance to monitor edges
      respect_gaps = true,
      border_overlap = false,
    },
  },
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#general
-- hl.config({
--   general = {
--     -- No gaps between windows or borders.
--     gaps_in = 0,
--     gaps_out = 0,
--     border_size = 0,
--
--     -- Change to niri-like side-scrolling layout.
--     layout = "scrolling",
--   },
-- })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
-- hl.config({
--   decoration = {
--     -- Use round window corners.
--     rounding = 8,
--
--     -- Dim unfocused windows (0.0 = no dim, 1.0 = fully dimmed).
--     dim_inactive = true,
--     dim_strength = 0.15,
--   },
-- })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#animations
-- hl.config({
--   animations = {
--     -- Disable all animations.
--     enabled = false,
--   },
-- })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#layout
-- hl.config({
--   layout = {
--     -- Avoid overly wide single-window layouts on wide screens.
--     single_window_aspect_ratio = { 1, 1 },
--   },
-- })

-- https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/
-- hl.config({
--   scrolling = {
--     -- See only one column per screen instead of two.
--     column_width = 0.97,
--   },
-- })

-- Opt another application in to Omarchy's standard transparency.
-- Find its class with: hyprctl clients
-- o.transparent_window("my-app")
-- o.transparent_window("my-app", "0.9 0.85") -- Custom active/inactive opacity.

-- Herdr desktop app: same transparency as the terminals (e.g. Ghostty).
o.transparent_window("herdr-app")
