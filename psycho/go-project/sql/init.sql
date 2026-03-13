-- SQL скрипт для инициализации базы данных
-- Этот файл автоматически выполнится при первом запуске PostgreSQL контейнера

-- Удаляем таблицу tasks, если она существует (для чистой установки)
DROP TABLE IF EXISTS tasks;

-- Создаем таблицу tasks для хранения задач
CREATE TABLE tasks (
    -- id - уникальный идентификатор задачи
    -- SERIAL автоматически создает последовательность и увеличивает значение при каждой вставке
    -- PRIMARY KEY означает, что это поле уникально и не может быть NULL
    id SERIAL PRIMARY KEY,
    
    -- title - заголовок задачи (название)
    -- VARCHAR(255) означает строку с максимальной длиной 255 символов
    -- NOT NULL означает, что поле обязательно для заполнения
    title VARCHAR(255) NOT NULL,
    
    -- description - подробное описание задачи
    -- TEXT позволяет хранить текст любой длины
    -- По умолчанию может быть NULL (пустым)
    description TEXT,
    
    -- completed - флаг завершения задачи
    -- BOOLEAN может быть true или false
    -- DEFAULT FALSE означает, что по умолчанию задача не завершена
    completed BOOLEAN DEFAULT FALSE,
    
    -- created_at - время создания задачи
    -- TIMESTAMP хранит дату и время
    -- DEFAULT CURRENT_TIMESTAMP автоматически устанавливает текущее время при создании записи
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- updated_at - время последнего обновления задачи
    -- DEFAULT CURRENT_TIMESTAMP устанавливает текущее время при создании
    -- Будем обновлять это поле вручную при изменении задачи
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Создаем индекс для ускорения поиска по полю completed
-- Индекс позволяет быстро находить все завершенные или незавершенные задачи
CREATE INDEX idx_tasks_completed ON tasks(completed);

-- Вставляем несколько примеров задач для тестирования
INSERT INTO tasks (title, description, completed) VALUES
    ('Изучить Go', 'Пройти базовый курс по языку программирования Go', false),
    ('Написать REST API', 'Создать REST API для управления задачами', false),
    ('Задеплоить приложение', 'Развернуть приложение на сервере', false);