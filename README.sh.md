```python
#!/usr/bin/env bash
#
# migrate-to-dotfiles.sh
#
# For each directory in ~/dotfiles/.config/, pull in the current
# content of the matching ~/.config/<name>/, then rename the original
# to <name>-backup so `stow .` (run from ~/dotfiles) can symlink it
# back into place afterwards.
#
# Usage:
#   ./migrate-to-dotfiles.sh            # do it
#   ./migrate-to-dotfiles.sh --dry-run  # show what would happen, change nothing

set -euo pipefail

DOTFILES_CONFIG="$HOME/dotfiles/.config"
REAL_CONFIG="$HOME/.config"
DRY_RUN=false

if [[ "${1:-}" == "--dry-run" ]]; then
    DRY_RUN=true
fi

if [[ ! -d "$DOTFILES_CONFIG" ]]; then
    echo "Error: $DOTFILES_CONFIG does not exist." >&2
    exit 1
fi

shopt -s nullglob

for dotfile_dir in "$DOTFILES_CONFIG"/*/; do
    name="$(basename "$dotfile_dir")"
    real_dir="$REAL_CONFIG/$name"

    if [[ ! -d "$real_dir" ]]; then
        echo "Skip '$name': no matching dir in $REAL_CONFIG"
        continue
    fi

    if [[ -L "$real_dir" ]]; then
        echo "Skip '$name': already a symlink (looks already stowed)"
        continue
    fi

    echo "== $name =="
    echo "  copy:   $real_dir/*  ->  $dotfile_dir"
    echo "  rename: $real_dir  ->  $real_dir-backup"

    if [[ "$DRY_RUN" == false ]]; then
        cp -a "$real_dir"/. "$dotfile_dir"
        mv "$real_dir" "$real_dir-backup"
    fi
done

echo
if [[ "$DRY_RUN" == true ]]; then
    echo "Dry run only, nothing changed. Re-run without --dry-run to apply."
else
    echo "Done. Review diffs, then run 'stow .' from ~/dotfiles."
fi
```
