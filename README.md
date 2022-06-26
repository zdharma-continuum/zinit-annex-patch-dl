# zinit-annex-patch-dl

A Zinit extension (i.e., an [annex](https://zdharma-continuum.github.io/zinit/wiki/Annexes/)) that downloads files and
applies patches. It adds two ice modifiers:

```zsh
zinit ice dl'{URL} [-> {optional-output-file-name}]; …' …
```

and

```zsh
zinit ice patch'{file-name-with-the-patch-to-apply}; …' …
```

The Zinit annex (i.e., an extension) will:

- Download the given `{URL}` under the path `{optional-output-file-name}` (if no file name is given, then it is taken
  from the last segment of the URL) in case of the `dl''` ice-mod,
- Apply a patch given by the `{file-name-with-the-patch-to-apply}` in case of the `patch''` ice-mod.

You can use this functionality to download and apply patches. For example, to install `fbterm`, two patches are being
needed, one to fix the operation, the other one to fix the build:

```zsh
zinit ice \
    as"command" \
    atclone"./configure --prefix=$ZPFX" \
    atpull"%atclone" \
    dl"https://aur.archlinux.org/cgit/aur.git/plain/0001-Fix-build-with-gcc-6.patch?h=fbterm-git" \
    dl"https://bugs.archlinux.org/task/46860?getfile=13513 -> ins.patch" \
    make"install" \
    patch"ins.patch; 0001-Fix-build-with-gcc-6.patch" \
    pick"$ZPFX/bin/fbterm" \
    reset

zinit load izmntuk/fbterm
```

This command will result in:

![fbterm example](https://raw.githubusercontent.com/zdharma-continuum/zinit-annex-patch-dl/master/images/fbterm-ex.png)

## Installation

Run the following command to add the annex to Zinit:

```zsh
zinit light zdharma-continuum/zinit-annex-patch-dl
```

After executing this command, you can use the `dl''` and `patch''` ice-mods.

<!-- vim:set ft=markdown tw=120 et sw=4 sts=4: -->
