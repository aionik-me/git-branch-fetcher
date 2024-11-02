# Git Branch Fetcher

A simple bash script to fetch and download all branches from a Git repository into separate directories. This tool is particularly useful when you need to:
- Download all branches from a repository for offline access
- Compare files across different branches
- Backup all branches locally
- Work with multiple branches simultaneously

## Features

- Downloads all branches from a Git repository
- Creates separate directories for each branch
- Handles large repositories efficiently using shallow clones
- Continues operation even if some branches fail
- Shows clear progress for each branch
- Minimal dependencies (just requires git)

## Prerequisites

- Git installed on your system
- Bash shell
- Read access to the target repository

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/git-branch-fetcher.git
   ```

2. Make the script executable:
   ```bash
   chmod +x fetch_all_branches.sh
   ```

## Usage

### Fetch All Branches
    ```bash
    ./fetch_all_branches.sh <repository_url> <github_token>
    ```

The script will:
1. Create a parent directory named `repo-all-branches`
2. Clone each branch into its own subdirectory
3. Show progress as it processes each branch

### Directory Structure
After running the script, you'll have a directory structure like this:
    ```
    repo-all-branches/
    ├── branch1/
    │   ├── .git/
    │   └── ... (all files from branch1)
    ├── branch2/
    │   ├── .git/
    │   └── ... (all files from branch2)
    ```

## Troubleshooting

### Common Issues

1. **Permission Denied**
   - Ensure you have read access to the repository
   - Check your Git credentials
   - For private repositories, make sure you're authenticated with GitHub

2. **Connection Timeout**
   - The script will continue with other branches
   - You can retry failed branches individually
   - Consider using a more stable internet connection

3. **Disk Space**
   - Ensure you have enough disk space for all branches
   - Use `du -sh *` to check directory sizes
   - Consider using `--depth 1` for shallow clones if you only need recent files

4. **Rate Limiting**
   - GitHub may rate limit multiple clone operations
   - The script will show relevant error messages
   - Wait a few minutes before retrying

## Advanced Usage

### Environment Variables
The script respects standard Git environment variables:
- `GIT_SSL_NO_VERIFY`: Set to `true` to skip SSL verification
- `GIT_TERMINAL_PROMPT`: Set to `0` to prevent password prompts
- `GIT_SSH_COMMAND`: Customize SSH command if needed

### Customization
You can modify the script to:
- Change the parent directory naming scheme
- Adjust clone depth
- Add specific branch filtering
- Modify error handling behavior

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the MIT License

## Support

If you encounter any issues or have questions:
1. Check the [Troubleshooting](#troubleshooting) section
2. Search existing [GitHub Issues](https://github.com/yourusername/git-branch-fetcher/issues)
3. Create a new issue with detailed information about your problem

## Roadmap

Future improvements planned:
- Add support for selective branch downloading
- Implement parallel downloading for faster operations
- Add progress bars for large repositories
- Create configuration file support
