-- Datarefs for Avidyne PFD
--
DataRef( "lft_hil", "sim/cockpit/avidyne/lft_hil", readonly)
DataRef( "rgt_hil", "sim/cockpit/avidyne/rgt_hil", readonly)
DataRef( "alt_knob", "sim/cockpit/avidyne/alt_hil", readonly)
DataRef( "autopilot_source", "sim/cockpit/avidyne/src", readonly)
--DataRef( "src3_knob", "sim/cockpit/avidyne/src[3]", readonly)
DataRef( "hsi_mode", "sim/cockpit/avidyne/hsi_mode", readonly)
DataRef( "heading_bug", "sim/cockpit2/autopilot/heading_dial_deg_mag_pilot", writable )
DataRef( "altitude_bug", "sim/cockpit2/autopilot/altitude_dial_ft", writable )
DataRef( "vertical_speed", "sim/cockpit/autopilot/vertical_velocity", readonly )
DataRef( "barometer_setting", "sim/cockpit/misc/barometer_setting", readonly )

DataRef( "hsi_course2", "sim/cockpit2/radios/actuators/hsi_obs_deg_mag_pilot", writable )

-- PFD Left side buttons
-- Nav button
-- sets: lft_hil=0
-- then src[3] to
-- [0,1,3] for NAV1
-- [1,1,3] for NAV2
-- [4,1,3] for GPS1
-- [5,1,3] for GPS2

-- Bearing button
-- sets lft_hil=1
-- then src[3] to
--   [0,1,5] = NAV-2
--   [0,2,5] = ADF-1

-- AUX button
--  sets lft_hil=2
--  then src[3] to
--  [0,2,-1 thru 5]
--  where:
--   -1 = nothing
--   0 = NAV-1
--   1 = NAV-2
--   2 = ADF-1
--   3 = ADF-2
--   4 = GPS-1
--   5 = GPS-2

-- RANGE - VIEW button
-- HSI view half or full
--  sets lft_hil=3
--  then hsi_mode to: [0,1,2,3] even: full, odd: half


-- PFD right side
-- HDG bug
-- sets rht_hil=0
-- then up/dwn sim/cockpit/autopilot/heading
--
-- ALT bug
-- sets rht_hil=1
-- then up/down sim/cockpit/autopilot/altitude

-- VSI bug
-- sets rht_hil=2
-- then up/down sim/cockpit/misc/vertical_velocity

-- Barometer
-- sets rht_hil=3
-- then up/down sim/cockpit/misc/barometer_setting

-- debug output
function check_dataref()
    x, y = MOUSE_X, MOUSE_Y
    y = bubble(x, y, 'left button selection ' .. lft_hil )
    y = bubble(x, y, 'right button selection ' .. rgt_hil )
    y = bubble(x, y, 'alt knob ' .. alt_knob )
    y = bubble(x, y, 'AP source selection ' .. autopilot_source )
    y = bubble(x, y, 'hsi selection ' .. hsi_mode )
    y = bubble(x, y, 'left knob value ' .. pfd_lk )
    y = bubble(x, y, 'right knob value ' .. pfd_rk )
end

-- Set some values for our knob commands
pfd_lk = 100
pfd_rk = 100

-- Setup Left PFD Knob control
create_command("FlyWithLua/avidyne/pfd_left_knob_up",
  "Avidyne PFD left knob up",
  "",
  "pfd_lk = pfd_lk + 1",
  "")

create_command("FlyWithLua/avidyne/pfd_left_knob_down",
  "Avidyne PFD left knob down",
  "",
  "pfd_lk = pfd_lk - 1",
  "")

-- Setup Right PFD Knob control
create_command("FlyWithLua/avidyne/pfd_right_knob_up",
  "Avidyne PFD right knob up",
  "",
  "pfd_rk = pfd_rk + 1",
  "")

create_command("FlyWithLua/avidyne/pfd_right_knob_down",
  "Avidyne PFD right knob down",
  "",
  "pfd_rk = pfd_rk - 1",
  "")


do_every_draw("check_dataref()")
