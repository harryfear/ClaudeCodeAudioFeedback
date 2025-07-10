#!/usr/bin/env bash
# notify_audio.sh — play different sounds for different Claude hook events

EVENT="$1"                               # "question" | "done" | "subagent"
SOUND_DIR="/System/Library/Sounds"       # macOS system sounds

play_mac() { afplay "$SOUND_DIR/$1.aiff" & }   # background so hooks return instantly

case "$EVENT" in
  question)  play_mac "Hero"    ;;       # prominent alert sound
  done)      play_mac "Sosumi"  ;;       # general completion sound
  subagent)  play_mac "Purr"    ;;       # gentle subagent completion sound
  *)         play_mac "Tink"    ;;       # gentle fallback
esac                                        # end case 