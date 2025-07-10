#!/usr/bin/env bash
# notify_audio.sh — play different sounds for different Claude hook events

EVENT="$1"                               # "question" | "done"
SOUND_DIR="/System/Library/Sounds"       # macOS system sounds

play_mac() { afplay "$SOUND_DIR/$1.aiff" & }   # background so hooks return instantly

case "$EVENT" in
  question)  play_mac "Sosumi"  ;;       # classic Mac alert sound
  done)      play_mac "Hero"    ;;       # satisfying completion sound
  *)         play_mac "Tink"    ;;       # gentle fallback
esac                                        # end case 