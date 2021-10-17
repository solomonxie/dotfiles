# Git workflow

## Branching
- New branch
    $ git checkout -b NAME
    $ git branch NAME
- Remove branch
- Add remote branch
- Upload local new branch to remote


## Remote
- 将本地新建的分之推到远程（远程也新建相应的分之）
    $ git push -u origin <branch>
- 添加远程连接, URL可以是远程repo的http或ssh地址 (先设定为origin)
    git remote add origin URL
- 或者修改现有远程URL (这里先设定为origin)
    git remote set-url origin URL
- 先与远程同步
    git pull origin master
- 提交到远程
    git push origin master


## Remove credential from history

Steps:
1. Find out the file exposes credential (/path/to/file)
1. Find out the earliest commit submitted the credential (7b204)
2. Find out the commit remove the credential (HEAD)
3. Execute git builtin command:

```sh
$ git checkout master
$ git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch /path/to/file 7b204..HEAD
```
4. Wait until it's done
5. Force push:
```sh
$ git push --force origin master
```



## Colaboration
- Pull request
- Blame
- History

