FUZZY_MATCH=$1
make main
echo "\n----\n"
cat prompt.go
echo "\n>>>>\n\n"
if [ -z "$FUZZY_MATCH" ]; then
    MAX_TOKENS="-n 30"
fi
for i in {1..100}; do
    ./main -m models/deepseek-coder-1.3b-base.Q5_K_M.gguf $MAX_TOKENS --temp 0.8 --color -f prompt.go --no-penalize-nl --log-disable --fuzzy "$FUZZY_MATCH"
    echo
    echo "----"
done
