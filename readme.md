# Claude Code Audio Notifications

This repository contains a lightweight pattern that turns Claude Code's **Notification**, **Stop**, and **SubagentStop** hook events into macOS system sounds, so you hear audio feedback when Claude needs your input and when it's finished.

## Files Structure

```
~/claude/hooks/notify_audio.sh    # Audio notification script
~/.claude/settings.json           # Claude Code hook configuration
```

## Required File Permissions

### Shell Script Executable Permissions

The shell script **must** be executable for Claude Code hooks to run it properly:

```bash
chmod +x ~/claude/hooks/notify_audio.sh
```

**Why this is required:**
- Claude Code hooks execute shell commands as subprocesses
- Without execute permissions (`+x`), the system cannot run the script
- The hook will fail silently if permissions are incorrect

### Verification Commands

Check if permissions are set correctly:

```bash
# Check if script is executable
ls -la ~/claude/hooks/notify_audio.sh

# Should show: -rwxr-xr-x (note the 'x' characters)
# If you see -rw-r--r-- instead, the script is NOT executable
```

### Troubleshooting Permissions

If audio notifications aren't working:

1. **Verify script exists and is executable:**
   ```bash
   ls -la ~/claude/hooks/notify_audio.sh
   ```

2. **Make executable if needed:**
   ```bash
   chmod +x ~/claude/hooks/notify_audio.sh
   ```

3. **Test script manually:**
   ```bash
   ~/claude/hooks/notify_audio.sh question  # Should play Sosumi sound
   ~/claude/hooks/notify_audio.sh done      # Should play Hero sound
   ```

4. **Check Claude Code hook configuration:**
   ```bash
   cat ~/.claude/settings.json
   ```

## Sound Mappings

| Hook Event | When it fires | Sound | Purpose |
|------------|---------------|-------|---------|
| **Notification** | Claude needs permission/input | Sosumi | Classic Mac alert |
| **Stop** | Main agent finishes | Hero | Satisfying completion |
| **SubagentStop** | Sub-agent finishes | Hero | Task completion |

## Setup Notes

- Hook settings are loaded at Claude Code startup - restart after changes
- Ensure system volume is up and Do Not Disturb is off
- The script runs sounds in background (`&`) so hooks return immediately
- Uses macOS system sounds from `/System/Library/Sounds/`
