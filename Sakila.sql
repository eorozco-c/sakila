-- Consultas
-- 1. ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312? Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.

SELECT S1.first_name,S1.last_name,S1.email,S2.address,S2.district FROM customer AS S1
INNER JOIN address AS S2 ON S1.address_id = S2.address_id
WHERE S2.city_id = 312;

-- 2. ¿Qué consulta harías para obtener todas las películas de comedia? Su consulta debe devolver el título de la película, la descripción, 
-- el año de estreno, la calificación, las características especiales y el género (categoría).

SELECT S2.title,S2.description,S2.release_year,S2.rating,S2.special_features,S3.name AS category
FROM film_category AS S1
INNER JOIN film AS S2 ON S2.film_id = S1.film_id
INNER JOIN category AS S3 ON S3.category_id = S1.category_id
WHERE S1.category_id = 5;


-- 3. ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5? Su consulta debe devolver la identificación del actor, 
-- el nombre del actor, el título de la película, la descripción y el año de lanzamiento.

SELECT S3.first_name,S3.last_name,S2.title,S2.description,S2.release_year
FROM film_actor AS S1
INNER JOIN film AS S2 ON S2.film_id = S1.film_id
INNER JOIN actor AS S3 ON S3.actor_id = S1.actor_id
WHERE S1.actor_id = 5;

-- 4. ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y dentro de estas ciudades (1, 42, 312 y 459)? 
-- Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.

SELECT S1.store_id,S2.city_id,S1.first_name,S1.last_name,S1.email,S2.address
FROM customer AS S1
INNER JOIN address AS S2 ON S2.address_id = S1.address_id
WHERE S1.store_id = 1 
AND ( S2.city_id = 1 OR  S2.city_id = 42 OR  S2.city_id = 312 OR  S2.city_id = 459);

-- 5. ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y "característica especial = detrás de escena", 
-- unidas por actor_id = 15? Su consulta debe devolver el título de la película, la descripción, el año de lanzamiento, la calificación y 
-- la función especial. Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'.

SELECT S1.title,S1.description,S1.release_year,S1.rating,S1.special_features FROM film AS S1
INNER JOIN film_actor AS S2 ON S2.film_id = S1.film_id
INNER JOIN actor AS S3 ON S3.actor_id = S2.actor_id
WHERE S1.rating = "G" 
AND S1.special_features LIKE "%Behind the Scenes%"
AND S3.actor_id = 15;

-- 6. ¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369? 
-- Su consulta debe devolver film_id, title, actor_id y actor_name.

SELECT S1.film_id,S3.title,S1.actor_id,concat(S2.first_name, " ", S2.last_name) AS actor_name
FROM film_actor AS S1
INNER JOIN actor AS S2 ON S2.actor_id = S1.actor_id
INNER JOIN film AS S3 ON S3.film_id = S1.film_id
WHERE S1.film_id = 369;


-- 7. ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99? 
-- Su consulta debe devolver el título de la película, la descripción, 
-- el año de estreno, la calificación, las características especiales y el género (categoría).

SELECT S1.film_id,S2.title,S2.description,S2.release_year,S2.rating,S2.special_features,S3.name AS category,S2.rental_rate
FROM film_category AS S1
INNER JOIN film AS S2 ON S2.film_id = S1.film_id
INNER JOIN category AS S3 ON S3.category_id = S1.category_id
WHERE S1.category_id = 7
AND S2.rental_rate = 2.99;

-- 8. ¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER? Su consulta debe devolver 
-- el título de la película, la descripción, el año de estreno, la calificación, las características especiales, 
-- el género (categoría) y el nombre y apellido del actor.

SELECT S1.film_id,S2.title,S2.description,S2.release_year,S2.rating,S2.special_features,S5.category_id, S5.name AS category, S1.actor_id, CONCAT(S3.first_name, " ", S3.last_name) AS actor_name
FROM film_actor AS S1
INNER JOIN film AS S2 ON S2.film_id = S1.film_id
INNER JOIN actor AS S3 ON S3.actor_id = S1.actor_id
INNER JOIN film_category AS S4 ON S4.film_id = S2.film_id
INNER JOIN category AS S5 ON S5.category_id = S4.category_id
WHERE S4.category_id = 1
AND CONCAT(S3.first_name, " ", S3.last_name) = "SANDRA KILMER"