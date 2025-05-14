if [ $# -eq 0 ]; then
	echo "Use like: $0 <directory>"
	exit 1
fi

for file in "$1"/*.fna; do
    echo "Processing: $file"
    grep -o "[GC]" "$file" | wc -l
done
