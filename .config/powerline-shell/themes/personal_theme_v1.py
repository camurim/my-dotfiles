from powerline_shell.themes.default import DefaultColor


class Color(DefaultColor):
    USERNAME_FG = 15
    USERNAME_BG = 4
    USERNAME_ROOT_BG = 1

    HOSTNAME_FG = 15
    HOSTNAME_BG = 10

    HOME_SPECIAL_DISPLAY = True
    HOME_BG = 68  # SteelBlue3
    HOME_FG = 15  # white

    PATH_FG = 7
    PATH_BG = 10
    CWD_FG = 15
    SEPARATOR_FG = 14

    READONLY_BG = 1
    READONLY_FG = 7

    REPO_CLEAN_FG = 14
    REPO_CLEAN_BG = 0
    REPO_DIRTY_FG = 3
    REPO_DIRTY_BG = 0

    JOBS_FG = 4
    JOBS_BG = 8

    CMD_PASSED_FG = 15
    CMD_PASSED_BG = 62
    CMD_FAILED_FG = 15
    CMD_FAILED_BG = 88

    SVN_CHANGES_FG = REPO_DIRTY_FG
    SVN_CHANGES_BG = REPO_DIRTY_BG

    GIT_AHEAD_BG = 240
    GIT_AHEAD_FG = 250
    GIT_BEHIND_BG = 240
    GIT_BEHIND_FG = 250
    GIT_STAGED_BG = 22
    GIT_STAGED_FG = 15
    GIT_NOTSTAGED_BG = 130
    GIT_NOTSTAGED_FG = 15
    GIT_UNTRACKED_BG = 52
    GIT_UNTRACKED_FG = 15
    GIT_CONFLICTED_BG = 9
    GIT_CONFLICTED_FG = 15

    GIT_STASH_BG = 221
    GIT_STASH_FG = 0

    VIRTUAL_ENV_BG = 15
    VIRTUAL_ENV_FG = 2

    AWS_PROFILE_FG = 7
    AWS_PROFILE_BG = 2

    TIME_FG = 15
    TIME_BG = 10
