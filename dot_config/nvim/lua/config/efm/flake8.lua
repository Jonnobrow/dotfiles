local flake8 = {
    lintCommand = "flake8 --max-line-length 72 --format '%(path)s:%(row)d:%(col)d: %(code)s %(code)s %(text)s' --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintIgnoreExitCode = true,
    lintFormats = {"%f:%l:%c: %t%n%n%n %m"},
    lintSource = "flake8"
}
