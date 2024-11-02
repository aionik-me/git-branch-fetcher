#!/bin/bash

# Check if repository URL is provided
if [ $# -eq 0 ]; then
    echo "Please provide the repository URL"
    echo "Usage: ./fetch_all_branches.sh <repository_url>"
    exit 1
fi

REPO_URL=$1
REPO_NAME=$(basename "$REPO_URL" .git)
PARENT_DIR="$REPO_NAME-all-branches"

# Remove existing directories if they exist
if [ -d "$PARENT_DIR" ]; then
    echo "Directory exists. Removing..."
    rm -rf "$PARENT_DIR"
fi

# Create parent directory and move into it
mkdir "$PARENT_DIR"
cd "$PARENT_DIR"

# First, do a shallow clone to get the branch list
echo "Doing initial shallow clone..."
git clone --depth 1 "$REPO_URL" "$REPO_NAME"
cd "$REPO_NAME"

# Get list of all remote branches
echo "Getting list of branches..."
branches=$(git ls-remote --heads origin | awk '{print $2}' | sed 's/refs\/heads\///')

# Process each branch separately
for branch in $branches; do
    echo "Processing branch: $branch"
    
    # Create directory for this branch
    branch_dir="../$branch"
    mkdir -p "$branch_dir"
    
    # Clone just this branch with full history
    echo "Cloning $branch..."
    git clone \
        --branch "$branch" \
        --single-branch \
        --no-tags \
        "$REPO_URL" \
        "$branch_dir" \
        || echo "Failed to clone $branch, continuing..."
    
    echo "Completed $branch"
done

echo "All branches have been downloaded to: $PARENT_DIR"
echo "Each branch is in its own directory:"
ls -la ../ | grep -v "\.git"
