#!/bin/bash
source "$LSH_PATH/lib/param.sh"

# Define remote name and branch name
REMOTE="origin"
BRANCH="main"

# Check auto commit
if has_param '-c' "$@"; then
    git add .
    git status

    datetime="$(date +"%d/%m/%Y %T")"
    message="chore: changes until $datetime"

    echo "Add commit with message: $message"

    git commit -m "$message"
fi

echo "--- Starting Git Synchronization with $REMOTE/$BRANCH ---"

# 1. Fetch the latest changes from the remote repository
echo "Fetching latest changes from $REMOTE..."
git fetch $REMOTE

# Check if fetch was successful
if [ $? -ne 0 ]; then
    echo "Error: git fetch failed. Please check your network connection and permissions."
    exit 1
fi
echo "Fetch complete."

# 2. Pull (fetch and merge/rebase) changes into the local branch
echo "Pulling changes from $REMOTE/$BRANCH into local $BRANCH..."
# Using 'git pull --rebase' for a cleaner history, you can use 'git pull --no-rebase' (merge) instead if preferred
git pull --rebase $REMOTE $BRANCH

# Check if pull was successful or had conflicts
if [ $? -ne 0 ]; then
    echo "Error: git pull failed (likely merge conflicts). Please resolve conflicts manually and run the script again."
    # Optional: add a command to resolve conflicts here or prompt user
    exit 1
fi
echo "Pull complete, local branch is up-to-date with remote."

# 3. Push local commits to the remote repository (if any exist locally)
echo "Pushing local commits to $REMOTE/$BRANCH..."
git push $REMOTE $BRANCH

# Check if push was successful
if [ $? -ne 0 ]; then
    echo "Error: git push failed. Check if remote has new commits that need to be pulled first."
    exit 1
fi
echo "Push complete. Repositories are in sync."
