Shared Linux Knowledge
=============

Открытый проект по созданию учебных материалов по GNU/Linux и связанных с ним технологий.

Разрабатывается под эгидой [MLUG (Minsk Linux User Group)](http://mlug.linux.by/)

Лицензия
-------------

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Лицензия Creative Commons" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />Это произведение доступно по <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">лицензии Creative Commons «Attribution-ShareAlike» («Атрибуция — На тех же условиях») 4.0 Всемирная</a>.

Некоторые материалы могут распространяться с использованием других лицензий, если это явно указано в документе.

_Disclaimer_: поскольку некоторые материалы либо идеи были найдены на просторах Интернета -- могут возникнуть правовые коллизии. В случае обнаружения таких коллизий просьба незамедлительно связаться для исправления, указания авторства либо удаления проблемного контента.

Структура
-------------

Репозиторий содержит библиотеку слайдов в формате beamer LaTeX, разбитых по темам, в каталоге "slides/", которые можно использовать для создания своих собственных лекций и презентаций.

На данный момент созданы и доступны для использования следующие материалы:

* epam/LinuxEssentials/ -- введение в Linux, ежедневные навыки работы в консоли (EPAM Systems)
* epam/DevelopmentToolchain/ -- курс для программистов по использованию различных утилит для разработки (EPAM Systems)
* epam/BashScripting/ -- отдельный курс по программированию в Bash (EPAM Systems)
* epam/handbooks/ -- слайды в виде методичек (EPAM Systems)
* epam/Python/ -- отдельный курс по программированию на Python (pptx) (EPAM Systems)
* sam-solutions/ -- введение в Linux для QA (SaM-Solutions)
* promwad/ -- курс "Программирование встраиваемых систем" (Promwad)

Сборка в Docker окружении
-------------
~~~
 docker-compose run slides
~~~


Сборка в Jenkins окружении
-------------

Шаги по сборке курса для itacademy. Работает только в ветке xetex, поэтому нужно настроить Jenkins забирать Jenkinsfile из ветки xetex, который расположен itacademy/LinuxEssBash/buildenv/

Для запуска Jenkins используется контейнер https://hub.docker.com/r/jenkinsci/blueocean/ и шаги по установке https://jenkins.io/doc/book/installing/.

![alt text](https://github.com/nixuser/linux_courses/blob/xetex/pipeline_config.png)

~~~
 docker run --rm -u root -p 8080:8080 -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v "$HOME":/home jenkinsci/blueocean
~~~
