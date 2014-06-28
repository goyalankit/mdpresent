---
author: Ankit Goyal
title: introduction to mdpresent tool
---
# Mdpresent
## a quick presentation deployment tool

---

## Concept
> write in **markdown**, deploy on **heroku** or **github**, show the
> whole **world**!

---

## Getting started

> Install the mdpresent ruby gem

    gem install mdpresent

---

## How to setup github pages

---

* Create a new repo at github.com
* Create a new mdpresent project

```
mdpresent new slides
```

* Setup the github pages

```
mdpresent setup github
```

* Enter your username and reponame (that you created in step 1)
* You are all set!

---

## Creating and deploying a presentation

---

* Create a new presentation file in md\_files folder

```
cd md_files
touch presentation.md
```

* Write those insightful ideas in presentation.md
* At any time, generate your presentation.

```
 mdpresent gen md_files/presentation.md
```
* Add all the files in www/presentation and presentation.md to git*

```
 git add www md_files
 git commit -am 'presentation on mdpresent'
```


---

* deploy your presentation

```
mdpresent deploy
```

* Generate homepage

```
mdpresent update_home
```

* Open the public url

```
mdpresent open
```

---

> You can very easily deploy on heroku platform too..

Visit http://github.com/goyalankit/mdpresent

---

## Credits

> Thanks to **@egonSchiele** for writing **mdpress** gem to generate presentations.

---

# Thanks!


