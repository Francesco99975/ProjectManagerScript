# PRJMGR - Project Manager for code projects with many directories

## Getting started

1. Download prjmgr.sh
1. Give the script execution permissions with:

```bash
chmod +x prjmgr.sh
```

### Script System Integration

1. Create plain file version of the script:

```bash
cp prjmgr.sh prjmgr
```

2. Give the new file execution permissions

```bash
chmod +x prjmgr
```

3. Move this file in /usr/bin or any other folder on you PATH variable:

```bash
sudo mv prjmgr /usr/bin
```

Uses:

```bash
prjmgr run <project-directory>
prjmgr ls
prjmgr create <project-name> <project-directory> <project-directory>
prjmgr start <project-name>
prjmgr delete <project-name>
```
