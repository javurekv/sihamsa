Sihamsa : Sinatra-based HAML и SCSS шаблон + jQuery + Twitter Bootstrap 2
=========================================================================




Как установить
--------------

Для работы приложения в системе должен быть установлен интерпретатор языка программирования [Ruby](https://www.ruby-lang.org/) версии _2.0_.


### Установка в Ubuntu

Самый простой способ установить _Ruby 2.0_ в _Ubuntu_ –- [RVM](https://rvm.io/) :

```bash
$ curl -L get.rvm.io | bash -s stable
$ rvm install 2.0.0
$ source ~/.rvm/scripts/rvm
```

**ВНИМАНИЕ!** При установке _RVM_ может потребовать установить дополнительные пакеты и сам подскажет как это сделать. 

**ВНИМАНИЕ!** _RVM_ устанавливается только для текущего пользователя и требует прописать в файле `~/.bashrc` следующее : 

```bash
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
```

Теперь _RVM_ будет автоматически загружаться при запуске нового сеанса терминала текущим пользователем ОС.


Для работы с _Git_ и _GitHub_ потребуется установить пакет _git_ : 

```shell
$ sudo apt-get install git
```


Теперь можно склонировать приложение и установить необходимые для него компоненты : 

```shell
$ git clone git@github.com:delfit/sihamsa.git
$ cd ./sihamsa
$ bundle install
```


### Установка в Windows

Самый простой способ установить _Ruby 2.0_ в _Windows_ –- [Ruby Installer](http://rubyinstaller.org/). 

Для работы с _GitHub_ потребуется установить [GitHub Windows](http://windows.github.com/). 

Теперь можно склонировать приложение [https://github.com/delfit/sihamsa.git](https://github.com/delfit/sihamsa.git) (смотри помощь [здесь](https://help.github.com/articles/adding-repositories-with-github-for-windows)) и в папке приложения в командной строке выполнить : 

```shell
> bundle install
```




Как запустить
-------------

В корне приложения нужно выполнить команду для запуска веб-сервера _Ruby_ : 

```shell
$ rackup
```




Как пользоваться
----------------

После запуска, приложение будет доступно по адресу [http://localhost:4567/](http://localhost:4567/). 

Теперь можно приступать непосредственно к написанию кода. 


### Нюансы для HAML

Все HAML-файлы находятся в папке `haml`. В браузере они работают по простой схеме : вместо `.haml` пишется `.html` __без__ указания папки `haml`. Например, для просмота в браузере файла `haml/about.haml`, нужно перейти по ссылке [http://localhost:4567/about.html](http://localhost:4567/about.html), а для файла `haml/pages/contacts.haml` -- [http://localhost:4567/pages/contacts.html](http://localhost:4567/pages/contacts.html). 

По-умолчанию, для всех HAML-файлов применяется шаблон `haml/layout.haml`, в который вынесена общая для всех страниц разметка (например, подключение файлов стилей и скриптов). Текущий HAML-файл вставляется в шаблон строкой `= yield`. Если шаблон не нужен, файл `haml/layout.haml` можно удалить или дать ему друго название. 

В данном приложении поддерживается возможность включения одного HAML-файла в другой с передачей параметров в подключаемый файл (_partial views_). Например, сейчас файл `haml/_version.haml` подключается в `haml/about.haml` (строка `= partial "_version", locals: { major: 2, minor: 8 }`) и в `haml/pages/contacts.haml` (строка `= partial "_version", locals: { major: 1, minor: 1 }`). В обоих случаях в `haml/_version.haml` передаются переменные `major` и `minor`, которые могут быть использованы в HAML-коде как `#{major}` и `#{minor}` : 

```
%h3(align="center") version #{major}.#{minor}
```

Официальная документация по `sinatra-partial` : [https://github.com/yb66/Sinatra-Partial](https://github.com/yb66/Sinatra-Partial)




### Нюансы для SCSS

Все SCSS-файлы находятся в папке `scss`. В браузере они работают по простой схеме : вместо `.scss` пишется `.css` __c__ указанием папки `scss`. Например, для подключения файла `scss/app.scss`, нужна ссылка [http://localhost:4567/scss/app.css](http://localhost:4567/scss/app.css), а для файла `scss/pages/contacts.scss` -- [http://localhost:4567/scss/pages/contacts.css](http://localhost:4567/scss/pages/contacts.css). 


### Нюансы для статических файлов (изображения, скрипты)

Все статические файлы находятся в папке `public`. В браузере они работают по простой схеме : в пути к файлу __отбрасывается__ `public`. Например, файл `public/images/logo.png` доступен по ссылке [http://localhost:4567/images/logo.png](http://localhost:4567/images/logo.png), а файл `public/js/app.js` -- по ссылке [http://localhost:4567/js/app.js](http://localhost:4567/js/app.js). 




### Как подключить сторонние CSS/JS библиотеки

Любые файлы в папке `public` являются доступными через браузер, поэтому для подключения сторонних библиотек нужно сделать вот что : 

1. Скопировать библиотеку в папку `public/vendor`
2. Подключить файлы библиотеки в HAML-код в нужном месте (для глобального подключения -- шаблон `haml/layout.haml`; для локального -- любая другая HAML-страница). При подключении в пути к файлу НЕ нужно писать `public` (например, файл `public/vendor/bootstrap/css/bootstrap.css` подключается с помощью такого HAML-кода : `%link(rel="stylesheet" href="/vendor/bootstrap/css/bootstrap.css")`)



HAML : Соглашения о кодировании
-------------------------------

##### 1. Для отступов используются два _пробела_

```
%p
  Text in paragraph.
```

##### 2. Атрибуты тэгов оформляются в HTML-стиле 

```
%h1(align="center") 
  %img(src="/images/logo.png" align="middle")
  Hello
```




SCSS : Соглашения о кодировании
-------------------------------

##### 1. Для отступов используются два _пробела_

```scss
p {
  font-size: 16px;
}
```

##### 2. Перед фигурной скобкой, открывающей блок свойств, _ставится_ пробел

```scss
div.example {
  color: #b4b4b4;
}
```

##### 3. Перед круглыми скобками (например, в вызове mixin'а или функции) пробел _НЕ ставится_

```scss
.basket-button {
  @include shadow-down(2px);
 
  background-image: url(image-path('basket/small.png'));
}
```

##### 4. Названия классов и mixin'ов пишутся в нижнем регистре с _дефисом_ для разделения слов

```scss
.highlighted-holder {
  @include background-radial-gradient(#ffffff, $gray, #646464);
}
```

##### 5. Названия переменных пишутся в нижнем регистре с _нижним подчеркиванием_ для разделения слов

```scss
@mixin background-radial-gradient($from_color, $through_color, $to_color) {
  background: $from_color; /* Old browsers */
  background: radial-gradient(ellipse at center, $from_color 0%, $through_color 50%, $to_color 100%); /* W3C */
}
```

##### 6. Параметры в вызове mixin'а разделяются пробелом

```scss
.container {
   @include gradient(#343539, $black);
}
```

##### 7. Глобальные переменные объявляются в начале файла

```scss
$gray: #c8c8c8;
 
@import url(http://fonts.googleapis.com/css?family=Jura&subset=latin,cyrillic);
@import 'mixins';
 
html {
  height: 100%;
  margin: 0;
  padding: 0;
}
```

##### 8. Mixin'ы подключаются в начале описания стиля и упорядочиваются по алфавиту

```scss
.letter.cell {
  @include link;
  @include zero-indents;
   
  padding: 10px;
  width: $letter_width;
 
  background: $text_bg_color;
}
```

##### 9. Локальные переменные тоже объявляются в начале (перед mixin'ами)

```scss
a {
  $text_color: #7c7c7f;
 
  @include zero-indents;
 
  font-size: 11px;
  color: $text_color;
  text-decoration: none;
 
  &:hover {
    border-bottom: 1px $text_color dashed;
  }
}
```

##### 10. Все свойства упорядочиваются в такие логические блоки : позиционирование, блочные свойства, блочные эффекты, оформление, шрифт. Логические блоки разделяются одной пустой строкой.

```scss
p {
  /* позиционирование (отсортированы по важности) */
  position: relative;
  top: -5px;
  left: -10px;
  z-index: 4;
   
  /* блочные свойства (отсортированы по алфавиту) */
  box-sizing: padding-box;
  display: block;
  height: 40px;
  margin: 10px;
  padding-left: 20px;
  padding-right: 20px;
  width: 200px;
 
  /* блочные эффекты (отсортированы по алфавиту) */
  filter: sepia(1) hue-rotate(180deg);
  opacity: .75;
  transition: top 1s ease-out 0.5s;
 
  /* оформление (отсортированы по алфавиту) */
  background-color: #cccccc;
  border-radius: 10px;
  border: 1px #c4c4c4 dashed;
  box-shadow: 0 5px 15px rgba(0, 0, 0, .9);
 
  /* шрифт (отсортированы по алфавиту) */
  color: #5b5a5a;
  font-family: 'Jura', sans-serif;
  font-size: 14px;
  line-height: 20px;
  text-align: center;
  text-shadow: 2px 2px 1px $gray;
  text-transform: uppercase;
}
```

##### 11. Вложенные стили пишутся в конце описания данного стиля через _одну_ пустую строку

```scss
table.products {
  margin: 0 0 0 2px;
  padding: 0;
 
  border-collapse: collapse;
  border: 0;
 
  td.product.cell {
    height: 251px;
    margin: 0;
    padding: 0 0 15px 0;
 
    border: 0;
 
    a.product {
      @include zero-indents;
 
      img {
        display: block;
        height: 170px;
        max-height: 170px;
      }
    }
  }
}
```




Enjoy
-----

Made with :heart: by _Delfit_