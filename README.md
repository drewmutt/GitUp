# GitUp

`ghnew`: turn any folder into a GitHub repo with one command.

```sh
curl -fsSL https://raw.githubusercontent.com/drewmutt/GitUp/main/install.sh | bash
```

## Usage

```sh
cd path/to/your/project
ghnew
```

It asks whether the repo should be public or private, then for a title and an optional description. Then it:

- creates a `.gitignore` suited to the project (Node, Python, Rust, Go, Java/Kotlin, .NET, Swift/Xcode, C/C++, PlatformIO, Ruby, PHP, Flutter, Terraform, Unity), unless the folder already has one
- warns about files over GitHub's 100 MB limit
- commits everything, creates the repo on your account, links the folder as `origin` and pushes
- prints the link to the new repo

## Requirements

- git
- [GitHub CLI](https://cli.github.com) (`gh`), logged in with `gh auth login`
- Optional: run `gh auth setup-git` so plain `git push` uses the same login
