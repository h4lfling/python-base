param (
    [string]$fileName
)
uv add --dev snakeviz;;uv run python -m cProfile -o profile.prof $fileName;;uv run snakeviz profile.prof