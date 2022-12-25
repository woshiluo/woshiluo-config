# Dotfiles

Woshiluo 的自用配置集合~

使用 `GNU Stow` 来管理

`pkglist.txt` 是目前电脑主动安装的包，参见[ ArchWiki - Pacman ](https://wiki.archlinux.org/index.php/Pacman)

## Tips

```bash
# 获取当前系统中主动安装的包
pacman -Qqet > pkglist.txt
# 从列表文件安装软件包
pacman -S --needed - < pkglist.txt
```

使用 `stow --adopt` 可以快速将原有配置复制过来  
使用 `stow --no-folding` 可以让 Stow 在创建链接不直接链接文件夹，而是链接文件

## 协议

如果文件有声明其协议，则使用其所声明的协议

MPV 的配置文件修改自 <https://bbs.vcb-s.com/thread-2730-1-1.html>  

Rime 的词库部分来自[ 雾凇拼音 ](https://github.com/iDvel/rime-ice)，使用了[ 八股文 ](https://github.com/lotem/rime-octagram-data)

剩下的使用[ CC 0 ](https://creativecommons.org/publicdomain/zero/1.0/deed.zh)授权
