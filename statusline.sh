#!/bin/bash
# Claude Code Status Line - GSD Bar with Cost, Context & Skills
input=$(cat)

# Extract values
MODEL=$(echo "$input" | jq -r '.model.display_name // "Claude"')
COST=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
TRANSCRIPT=$(echo "$input" | jq -r '.transcript_path // ""')

# Calculate context usage percentage from token counts
INPUT_TOKENS=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
OUTPUT_TOKENS=$(echo "$input" | jq -r '.context_window.total_output_tokens // 0')
CONTEXT_SIZE=$(echo "$input" | jq -r '.context_window.context_window_size // 200000')

# Calculate percentage: (input + output) / context_size * 100
if [ "$CONTEXT_SIZE" -gt 0 ] 2>/dev/null; then
  USED_TOKENS=$((INPUT_TOKENS + OUTPUT_TOKENS))
  PERCENT=$(echo "scale=1; $USED_TOKENS * 100 / $CONTEXT_SIZE" | bc)
else
  PERCENT=0
fi

# Round percent to integer
PERCENT=${PERCENT%.*}
[ -z "$PERCENT" ] && PERCENT=0

# Count skills used from transcript
SKILLS=0
if [ -n "$TRANSCRIPT" ] && [ -f "$TRANSCRIPT" ]; then
  SKILLS=$(grep -c '"name":"Skill"' "$TRANSCRIPT" 2>/dev/null | tr -d '\n' || echo 0)
  [ -z "$SKILLS" ] && SKILLS=0
fi

# Create visual GSD bar (20 chars wide)
BAR_LENGTH=$((PERCENT / 5))
[ $BAR_LENGTH -gt 20 ] && BAR_LENGTH=20
[ $BAR_LENGTH -lt 0 ] && BAR_LENGTH=0

BAR=""
EMPTY=""
for ((i=0; i<BAR_LENGTH; i++)); do BAR+="█"; done
for ((i=BAR_LENGTH; i<20; i++)); do EMPTY+="░"; done

# Format cost (2 decimal places)
COST_FMT=$(printf "%.2f" "$COST")

# Output: [Model] $Cost | Skills: N | [GSD Bar] Context%
echo "[$MODEL] \$$COST_FMT | Skills: $SKILLS | $BAR$EMPTY ${PERCENT}%"
