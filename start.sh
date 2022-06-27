if [[ -n $UPSTREAM_BRANCH ]]; then
    BRAN = $UPSTREAM_BRANCH
else
    BRAN = 'master'
fi

if [[ -n "$UPSTREAM_REPO" ]] ; then
    [ -d ".git" ] && rm -rf .git*
    git init -q
    git config --global user.email usleech@gmail.com
    git config --global user.name usleech
    git add .
    git commit -sm update -q
    git remote add origin $UPSTREAM_REPO
    git fetch origin -q
    git reset --hard origin/$BRAN -q
else
    echo "Please set UPSTREAM_REPO"
    exit 0
fi

bash run
