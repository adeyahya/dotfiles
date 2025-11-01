# vim:set ft=tmux:
#
# --> THE VAGUE "GHOST" THEME (Based on Mocha structure)
#
# Use very dark shades for backgrounds and light, subtle shades for foregrounds.

# --- Core Backgrounds & Foreground ---
set -ogq @thm_crust "#111111"       # Deepest Black/BG (Original Crust)
set -ogq @thm_mantle "#1a1a1a"      # Main BG for status line
set -ogq @thm_bg "#222222"          # Dark BG (Used for inactive segments)
set -ogq @thm_fg "#dddddd"          # Main Light Text (Foreground)

# --- Surfaces and Subtext (Used for low-contrast elements) ---
set -ogq @thm_surface_0 "#444444"   # Subtly darker inactive window text
set -ogq @thm_subtext_0 "#777777"   # Secondary text / separator color
set -ogq @thm_subtext_1 "#aaaaaa"   # Muted Active element text

# --- Accent Colors (Desaturated and subtle) ---
# Replace all bright pastels with a cold, desaturated blue/gray, or a secondary gray.
set -ogq @thm_rosewater "#777777"   # Muted Gray
set -ogq @thm_flamingo "#778899"    # Cold Gray/Blue Accent (e.g., Active window fill)
set -ogq @thm_pink "#99aacc"        # Light Cold Accent (e.g., Active window text)
set -ogq @thm_mauve "#99aacc"       # Light Cold Accent (Used for session name)
set -ogq @thm_red "#cc6666"         # If an alert is absolutely needed (e.g., hard-error)
set -ogq @thm_yellow "#999999"      # Time/Date accent

# Placeholder overrides (keep them muted)
set -ogq @thm_maroon "#555555"
set -ogq @thm_peach "#555555"
set -ogq @thm_green "#555555"
set -ogq @thm_teal "#555555"
set -ogq @thm_sky "#555555"
set -ogq @thm_sapphire "#555555"
set -ogq @thm_blue "#555555"
set -ogq @thm_lavender "#555555"
set -ogq @thm_overlay_2 "#333333"
set -ogq @thm_overlay_1 "#333333"
set -ogq @thm_overlay_0 "#333333"
set -ogq @thm_surface_2 "#333333"
set -ogq @thm_surface_1 "#
