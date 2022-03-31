# Bulletin

Flutter package to to show bulletins in your application.

<img src="https://i.imgur.com/Y8kadag.png" title="Bulletin"/>

## Show some :heart: and :star: the repo

## Demo

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

Include plugin to your project

```yml
dependencies:
  bulletin: <latest version>
```
Run `pub get` and get packages.

## Example
Go to example section in pub.dev to see the full example code.

In GitHub, head over to `example/lib/main.dart` to see the full example code.



```dart
Bulletin(
                icon: const Icon(
                  Icons.mic_outlined,
                  size: 20,
                ),
                backgroundColor: const Color(0xffFFF3D0),
                children: [
                  BulletinItem(
                    text:
                        "1. This is a bulletin.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget elementum libero.",
                    onTap: () {
                      debugPrint("OnTap Function called for BulletinItem 1 ");
                    },
                  ),
                  BulletinItem(
                    text:
                        "2. This is a bulletin.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget elementum libero.",
                    onTap: () {
                      debugPrint("OnTap Function called for BulletinItem 2 ");
                    },
                  ),
                  BulletinItem(
                    text:
                        "3. This is a bulletin.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget elementum libero.",
                    onTap: () {
                      debugPrint("OnTap Function called for BulletinItem 3 ");
                    },
                  ),
                ],
              ),
```

## Project Created & Maintained By

### Subham Praharaj

<a href="https://twitter.com/SubhamPraharaj6"><img src="https://github.com/aritraroy/social-icons/blob/master/twitter-icon.png?raw=true" width="60"></a> <a href="https://www.linkedin.com/in/subham-praharaj-66b172179/"><img src="https://github.com/aritraroy/social-icons/blob/master/linkedin-icon.png?raw=true" width="60"></a> <a href="https://instagram.com/the_champ_subham_865"><img src="https://github.com/aritraroy/social-icons/blob/master/instagram-icon.png?raw=true" width="60"></a>

[![GitHub followers](https://img.shields.io/github/followers/skpraharaj.svg?style=social&label=Follow)](https://github.com/skpraharaj/)

## Contributions

Contributions are welcomed!

**If you feel that a hook is missing, feel free to open a pull-request.**

For a custom-hook to be merged, you will need to do the following:

* Describe the use-case.

* Open an issue explaining why we need this hook, how to use it, ...
  This is important as a hook will not get merged if the hook doens't appeal to
  a large number of people.

* If your hook is rejected, don't worry! A rejection doesn't mean that it won't
  be merged later in the future if more people shows an interest in it.
  In the mean-time, feel free to publish your hook as a package on [https://pub.dev](https://pub.dev).

* A hook will not be merged unles fully tested, to avoid breaking it inadvertendly in the future.
  
## Stargazers

[![Stargazers repo roster for @DevsOnFlutter/bulletin](https://reporoster.com/stars/dark/DevsOnFlutter/bulletin)](https://github.com/DevsOnFlutter/bulletin/stargazers)

## Forkers

[![Forkers repo roster for @DevsOnFlutter/bulletin](https://reporoster.com/forks/dark/DevsOnFlutter/bulletin)](https://github.com/DevsOnFlutter/bulletin/network/members)

## Copyright & License

Code and documentation Copyright (c) 2021 [Divyanshu Shekhar](https://hackthedeveloper.com). Code released under the [BSD 3-Clause License](./LICENSE).

