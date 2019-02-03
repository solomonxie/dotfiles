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



## Colaboration
- Pull request
- Blame
- History

