<h1>CrudAppTest</h1>

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/2165d60214e749669b17fa44ac861691)](https://www.codacy.com/app/OleksandrKorol/CrudAppTest?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=OleksandrKorol/CrudAppTest&amp;utm_campaign=Badge_Grade)

<h4>Test task for javarush internship</h4>

#####CRUD (create, read, update, delete). Стандартное crud приложение, которое отображает список всех книг в базе (с пейджингом). С возможностью их удаления, редактирования, добавления новых. И поиска по полю title.

Запрос для создания базы данных, таблицы и заполнения ее тестовыми данными осуществляется с помощью sql запроса из файла: create_db_script_javarush.sql

После деплоя в Томкэт приложение будет доступно по урл: http://localhost:8080/

Технологии:<br/>
Maven (для сборки проекта)<br/>
Hibernate (для маппинга сущностей приложения на БД, и работы с БД)<br/>
Tomcat 8<br/>
Mysql. Имя базы test, с логином и паролем root<br/>
Frontend: Spring MVC<br/>
