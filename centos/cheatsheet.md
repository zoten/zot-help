# CentOS / Debian Cheatsheet

Thanks to [Papito Favaro](https://github.com/pfav)

# Deps

## CheatSheet

| operation                        | debian                | centos            |
|----------------------------------|-----------------------|-------------------|
| check package                    | dpkg -l package       | rpm -q package    |
| info package                     | dpkg -I file.deb      | rpm -qip file.rpm |
| info package(installed)          | nil                   | rpm -qi package   |
| show dependencies                | nil                   | rpm -qRp file.rpm |
| show dependencies(installed)     | nil                   | rpm -qR package   |
| show all packages                | dpkg -l               | rpm -qa           |
| show files in package            | dpkg -c file.deb      | rpm -qlp file.rpm |
| show files in package(installed) | dpkg -L package       | rpm -ql package   |
| show file package owner          | dpkg -S /bin/ls       | rpm -qf /bin/ls   |
| install package                  | dpkg -i file.deb      | rpm -i file.rpm   |
| upgrade package                  | dpkg -i file.deb      | rpm -U file.rpm   |
| remove package                   | dpkg --remove package | rpm -e package    |
| verify                           | nil                   | rpm -Vp file.rpm  |
| verify(installed)                | nil                   | rpm -V package    |

#### flags
* `-i` install a package
* `-v` verbose
* `-h` print hash mark as the package archive is unpacked
* `-q` query operation
* `-a` queries all installed packages
* `-f` filename
* `-d` refers documentation
* `-qi` view information about an rpm
* `-p` specify package filename
* `-l` list files in package
* `-R` show dependencies
* `-V` verify package
* `-e` erase package
* `-s` status

#### note
**rpm force behaviour**
* `--noscripts` Do not execute pre and post unistall scripts
* `--nodeps` Do not check dependencies

**formatting**
* `rpm -qa --queryformat '%{name}-%{version}-%{release} %{size}\n'`
* `rpm -qa --qf '%{name}\n'`

**verify legend**
* S file Size differs
* M Mode differs (includes permissions and file type)
* 5 MD5 sum differs
* D Device major/minor number mismatch
* L readlink(2) path mismatch
* U User ownership differs
* G Group ownership differs
* T mTime differs


### references
* [cheatsheet](http://itrs.tw/wiki/RPM_DPKG_Rosetta_Stone)
* [PKGS] (https://pkgs.org/)
* [Release engineering tools] (https://github.com/rpm-software-management/hawkey/wiki/Use-cases)
* [Pungi] (https://pagure.io/pungi)
* [Repotrack] (http://man7.org/linux/man-pages/man1/repotrack.1.html)
