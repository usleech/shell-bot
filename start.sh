if [[ -z "$UPSTREAM_BRANCH" ]] ; then
    BRAN = 'master'
else
    BRAN = "$UPSTREAM_BRANCH"
fi
if [[ -z "$UPSTREAM_REPO" ]] ; then
    echo "Please set UPSTREAM_REPO"
    exit 0
else
    [ -d ".git" ] && rm -rf .git*
    git init -q
    git config --global user.email usleech@gmail.com
    git config --global user.name usleech
    git add .
    git commit -sm update -q
    git remote add origin "$UPSTREAM_REPO"
    git fetch origin -q
    git reset --hard origin/"$BRAN" -q
fi

bash run
