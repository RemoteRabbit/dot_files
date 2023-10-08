# web_search from terminal

function web_search() {
  emulate -L zsh

  local open_cmd
  [[ "$OSTYPE" = linux* ]] && open_cmd='xdg-open'
  [[ "$OSTYPE" = darwin* ]] && open_cmd='open'

  # define search engine URLS
  typeset -A urls
  urls=(
    $ZSH_WEB_SEARCH_ENGINES
    brave           "https://search.brave.com/search?q="
    duckduckgo      "https://www.duckduckgo.com/?q="
    startpage       "https://www.startpage.com/do/search?q="
    github          "https://github.com/search?q="
    wolframalpha    "https://www.wolframalpha.com/input/?i="
    archive         "https://web.archive.org/web/*/"
    scholar         "https://scholar.google.com/scholar?q="
    youtube         "https://www.youtube.com/results?search_query="
  )

  # check whether the search engine is supported
  if [[ -z "$urls[$1]" ]]; then
    echo "Search engine '$1' not supported."
    return 1
  fi

  # search or go to main page depending on number of arguments passed
  if [[ $# -gt 1 ]]; then
    # build search url:
    # join arguments passed with '+', then append to search engine URL
    url="${urls[$1]}${(j:+:)@[2,-1]}"
    # url="${urls[$1]}$(omz_urlencode ${@[2,-1]})"
  else
    # build main page url:
    # split by '/', then rejoin protocol (1) and domain (2) parts with '//'
    url="${(j://:)${(s:/:)urls[$1]}[1,2]}"
  fi

  # Open in background process
  $open_cmd "$url" &> /dev/null &
}


alias brs='web_search brave'
alias ddg='web_search duckduckgo'
alias sp='web_search startpage'
alias github='web_search github'
alias wolframalpha='web_search wolframalpha'
alias archive='web_search archive'
alias scholar='web_search scholar'
alias youtube='web_search youtube'

#add your own !bang searches here
alias wiki='web_search duckduckgo \!w'
alias news='web_search duckduckgo \!n'
alias map='web_search duckduckgo \!m'
alias image='web_search duckduckgo \!i'
alias ducky='web_search duckduckgo \!'

# other search engine aliases
if [[ ${#ZSH_WEB_SEARCH_ENGINES} -gt 0 ]]; then
  typeset -A engines
  engines=($ZSH_WEB_SEARCH_ENGINES)
  for key in ${(k)engines}; do
    alias "$key"="web_search $key"
  done
  unset engines key
fi
