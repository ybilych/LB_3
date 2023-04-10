-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 10 2023 г., 15:49
-- Версия сервера: 5.7.33
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lab3_7`
--

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`id_client`, `name`, `login`, `password`, `ip`, `balance`) VALUES
(0, 'Admin', 'admin', 'admin', '0.0.0.0', 34122),
(1, 'admln', 'admln', 'hack', '0.0.0.1', 999999),
(123, 'Victor', 'vic123', '123', '62.16.64.0', 12231),
(124, 'Urii', 'Urii001', 'Urii001', '192.0.0.1', 10000),
(231, 'Igor', 'Igor231', '231', '62.16.95.255', -412),
(789, 'Max', 'Max789', '789', '178.219.184.0', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `seanse`
--

CREATE TABLE `seanse` (
  `id_seanse` int(11) NOT NULL,
  `start` time NOT NULL,
  `stop` time NOT NULL,
  `in_traffic` int(11) NOT NULL,
  `out_traffic` int(11) NOT NULL,
  `fid_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `seanse`
--

INSERT INTO `seanse` (`id_seanse`, `start`, `stop`, `in_traffic`, `out_traffic`, `fid_client`) VALUES
(0, '13:22:26', '15:06:00', 563, 1231, 0),
(1, '12:22:26', '13:06:00', 1231, 1341, 1),
(2, '02:22:26', '07:06:00', 14231, 13411, 123),
(3, '10:22:26', '17:06:00', 1231, 1341, 231),
(4, '00:22:26', '08:06:00', 19731, 13341, 789),
(5, '02:22:26', '07:06:00', 14231, 13411, 124);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Индексы таблицы `seanse`
--
ALTER TABLE `seanse`
  ADD PRIMARY KEY (`id_seanse`),
  ADD KEY `id_seanse` (`id_seanse`),
  ADD KEY `fk_seanse_client` (`fid_client`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `seanse`
--
ALTER TABLE `seanse`
  ADD CONSTRAINT `fk_seanse_client` FOREIGN KEY (`fid_client`) REFERENCES `client` (`id_client`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
