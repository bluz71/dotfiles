#!/usr/bin/env bash

_yarn_completion() {
  local curr prev opts commands comp get_scripts get_dependencies get_global_dependencies yarn_config

  COMPREPLY=()
  curr="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  yarn_config="$HOME/.config/yarn"
  commands="access add autoclean bin cache check config create exec generate-lock-entry global help import info init install licenses link list login logout outdated owner pack publish remove run tag team unlink upgrade upgrade-interactive version versions why workspace"
  opts="-h --help -v --version --verbose --offline --prefer-offline --strict-semver --json --ignore-scripts --har --ignore-platform --ignore-engines --ignore-optional --force --skip-integrity-check --check-files --no-bin-links --flat --prod --production --no-lockfile --pure-lockfile --frozen-lockfile --link-duplicates --link-folder --global-folder --modules-folder --preferred-cache-folder --cache-folder --mutex --emoji -s --silent --cwd --proxy --https-proxy --registry --no-progress --network-concurrency --network-timeout --non-interactive --scripts-prepend-node-path --no-node-version-check"

  # Node scripts
  get_scripts="const pkg = require('./package.json'); \
    const scripts = pkg.scripts ? Object.keys(pkg.scripts) : [];
    console.log(scripts.join(' '))"
  get_dependencies="const pkg = require('./package.json'); \
    const deps = pkg.dependencies ? Object.keys(pkg.dependencies) : [];
    const devDeps = pkg.devDependencies ? Object.keys(pkg.devDependencies) : []; \
    console.log(deps.concat(devDeps).join(' '));"
  get_global_dependencies="const path = require('path'); \
    const yarnPath = '.config/yarn/global/package.json';
    const pkg = require(path.join(process.env.HOME, yarnPath)); \
    const deps = pkg.dependencies ? Object.keys(pkg.dependencies) : [];
    console.log(deps.join(' '));"

  # Options
  if [[ "$curr" == -* ]]; then
    case "${COMP_WORDS[1]}" in
      add)
        opts="$opts -W --ignore-workspace-root-check -D --dev -P --peer -O --optional -E --exact -T --tilde"
        ;;
      autoclean)
        opts="$opts -I --init -F --force"
        ;;
      cache)
        opts="$opts --pattern"
        ;;
      check)
        opts="$opts --integrity --verify-tree"
        ;;
      generate-lock-entry)
        opts="$opts --use-manifest --resolved --registry"
        ;;
      global)
        opts="$opts --prefix --latest"
        ;;
      init)
        opts="$opts -y --yes -p --private"
        ;;
      list)
        opts="$opts --depth --pattern"
        ;;
      pack)
        opts="$opts -f --filename"
        ;;
      publish)
        opts="$opts --new-version --message --no-git-tag-version --access --tag"
        ;;
      upgrade|upgrade-interactive)
        opts="$opts -S --scope -L --latest -E --exact -P --pattern -T --tilde -C --caret"
        ;;
      version)
        opts="$opts --new-version --message --no-git-tag-version"
        ;;
    esac

    COMPREPLY=($(compgen -W "$opts" -- "$curr"))
    return 0
  fi

  # Command expected
  if [[ $COMP_CWORD == 1 ]]; then
    COMPREPLY=($(compgen -W "$commands" -- "$curr"))
    return 0
  fi

  # First argument to commands
  if [[ $COMP_CWORD == 2 ]]; then
    case "${COMP_WORDS[1]}" in
      access)
        comp="public restricted grant revoke ls-packages ls-collaborators edit"
        ;;
      cache)
        comp="list dir clean"
        ;;
      config)
        comp="set get delete list current"
        ;;
      create)
        comp="react-app react-native-app next-app vue-app elm-app xp-app"
        ;;
      global)
        comp="add bin dir list remove upgrade upgrade-interactive"
        ;;
      help)
        comp="$commands"
        ;;
      licenses)
        comp="list generate-disclaimer"
        ;;
      link|unlink)
        if [[ -d "$yarn_config/link" ]]; then
          comp=$(find "$yarn_config/link" -type l | sed -e "s#$yarn_config/link/##")
        fi
        ;;
      owner)
        comp="add remove list"
        ;;
      info|outdated|remove|upgrade)
        if [[ -f "./package.json" ]]; then
          comp=$(node -e "$get_dependencies")
        fi
        ;;
      run)
        if [[ -f "./package.json" ]]; then
          comp=$(node -e "$get_scripts")
        fi
        ;;
      tag)
        comp="add remove list"
        ;;
      team)
        comp="create destroy add remove list"
        ;;
      why)
        if [[ -d "./node_modules" ]]; then
          comp=$(ls node_modules)
        fi
        ;;
    esac

    COMPREPLY=($(compgen -W "$comp" -- "$curr"))
    return 0
  fi

  # Commands with more than one argument
  case "${COMP_WORDS[1]}" in
    global)
      case "${COMP_WORDS[2]}" in
        remove|upgrade)
          if [[ -f "$yarn_config/global/package.json" ]]; then
            comp=$(node -e "$get_global_dependencies")
          fi
          ;;
      esac
      ;;
    link|unlink)
      if [[ -d "$yarn_config/link" ]]; then
        comp=$(find "$yarn_config/link" -type l | sed -e "s#$yarn_config/link/##")
      fi
      ;;
    outdated|remove|upgrade)
      if [[ -f "./package.json" ]]; then
        comp=$(node -e "$get_dependencies")
      fi
      ;;
  esac

  COMPREPLY=($(compgen -W "$comp" -- "$curr"))
  return 0
}

complete -o default -F _yarn_completion yarn
