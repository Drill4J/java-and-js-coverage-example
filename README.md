# Сбор покрытия с Java + JS агентов в сервис-группе

## Подготовка

1. Запустить сервисы Drill4J

    ```shell
      docker-compose -f services-drill-docker-compose.yml up -d
    ```

2. Открыть [панель Drill4J](http://localhost:9091) и убедиться, что она доступна

3. Запустить сервисы приложения.

    ```shell
      docker-compose up -d
    ```

4. Вернуться в [панель Drill4J](http://localhost:9091). Развернуть сервис-группу `test`. Дождаться появления **двух** агентов (`messagingServiceAgent` и `angular-playground-agent`)

5. Зарегистрировать агента `messagingServiceAgent`.
      В packages ввести

      ```shell
        playground/messaging
        playground/messaging/controller
      ```

6. Зарегистрировать агента `angular-playground-agent`

7. Установить [extension](https://github.com/Drill4J/browser-extension/tags) не ниже версии v.0.3.20

8. Открыть приложение на [http://localhost](http://localhost) и запустить виджет

## Чтобы собрать coverage

1. Запустить тест

2. Обновить страницу

3. Завершить тест

4. Должно собраться покрытие для обоих агентов (`messagingServiceAgent` и `angular-playground-agent`)

For build instructions see the [original repo](https://github.com/ahmedabadawi/playground-docker-spring-angular.git)
