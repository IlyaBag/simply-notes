# Simply Notes

__Simply Notes — ваш простейший менеджер заметок.__

## Описание

Сервис предоставляет возможность создания и просмотра текстовых заметок. Заметки состоят из двух основных полей: заголовок (Title) и содержимое (Content). Также при сохранении новой заметки фиксируются дата и время её создания.

Особенностью Simply Notes является проверка орфографии при создании заметки. Для этого в приложение интегрирован сервис [Яндекс.Спеллер](https://yandex.ru/dev/speller/).

При работе с приложением требуется аутентификация по логину и паролю. Для регистрации своего профиля свяжитесь, пожалуйста, с [разработчиком приложения](#контакты).

Взаимодействие с приложением происходит в стиле REST API, то есть с помощью HTTP-запросов.

### Endpoints

Сервис предоставляет 2 эндпоинта:

- `'GET' /api/v1/notes` — получить список всех заметок текущего пользователя
- `'POST' /api/v1/notes` — создать новую заметку от имени текущего пользователя

## Основные зависимости

- python = "^3.10"
- fastapi = "0.112.2"
- SQLAlchemy = "2.0.32"
- asyncpg = "0.29.0"
- httpx = "0.27.2"
- uvicorn = "0.30.6"

Полный список можно посмотреть в файле `requirements.txt`.

## Требования

Для запуска приложения потребуется [Docker](https://www.docker.com/).

## Установка с помощью Docker

1. Клонировать репозиторий

```
git clone https://github.com/IlyaBag/simply-notes.git
```

2. Создать файл с переменными окружения

Для этого можно переименовать файл `example.env_docker` в `.env_docker` вручную или в UNIX-подобных системах использовать команду

```
mv example.env_docker .env_docker
```

3. Запустить сервисы приложения и базы данных командой

```
docker compose up
```

4. Уже можно наслаждаться приложением ;-)

## Использование

После запуска приложение будет доступно локально по адресу [http://127.0.0.1:8000/api/v1/notes/](http://127.0.0.1:8000/api/v1/notes/).

Просматривать заметки, то есть делать GET-запросы, можно в обычном браузере, просто перейдя по ссылке выше или введя указанный адрес в адресную строку. Но для полноценной работы вам потребуется специальное приложение, способное отправлять как GET-, так и POST-запросы. Это может быть консольная утилита "curl", сервис наподобие [Postman](https://www.postman.com/) или любой другой доступный вариант.

### Примеры запросов в утилите `curl`

Примеры будут даны для пользователя с ником "usser" и паролем "qwerty". В запросах эти данные передаются в виде `dXNzZXI6cXdlcnR5`, что является строкой `usser:qwerty`, закодированной в формате Base64.

#### Создание заметки:

```
curl -X 'POST' \
  'http://127.0.0.1:8000/api/v1/notes/' \
  -H 'accept: application/json' \
  -H 'Authorization: Basic dXNzZXI6cXdlcnR5' \
  -H 'Content-Type: application/json' \
  -d '{
  "title": "Чудесная заметка",
  "content": "Чудесная сегодня погодка!"
}'
```

Поля "title" и "content" заполняются на свой вкус)

#### Получение списка заметок:

```
curl -X 'GET' \
  'http://127.0.0.1:8000/api/v1/notes/' \
  -H 'accept: application/json' \
  -H 'Authorization: Basic dXNzZXI6cXdlcnR5'
```

Заметки приходят в формате JSON. Для более удобного визуального представления можно использовать любой онлайн-сервис для работы с JSON, например [JSON formatter](https://jsonformatter.org/).

## Контакты

Связаться с автором приложения вы можете по адресу [ilyabonly@gmail.com](mailto:ilyabonly@gmail.com)

Удачных заметок! :)
