-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2024 at 10:22 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fquiz`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `answer`
--

CREATE TABLE `answer` (
  `id` int(11) NOT NULL,
  `A` varchar(200) NOT NULL,
  `B` varchar(200) NOT NULL,
  `C` varchar(200) NOT NULL,
  `D` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `A`, `B`, `C`, `D`) VALUES
(1, 'Framework do budowy interfejsów użytkownika', 'Środowisko uruchomieniowe oparte na silniku V8', 'Biblioteka do tworzenia gier komputerowych', 'Serwer bazodanowy'),
(2, 'Synchroniczne przetwarzanie danych', 'Obsługa równoległości przy użyciu wątków', 'Jednonitkowość i asynchroniczność', 'Wbudowany system kontroli wersji'),
(3, 'JavaScript', 'Python', 'Java', 'C++'),
(4, 'Do zarządzania paczkami (modułami) w środowisku Node.js', ' Do kompilacji kodu źródłowego', 'Do uruchamiania testów jednostkowych', 'Do tworzenia interfejsów użytkownika'),
(5, 'Wysoka wydajność przy przetwarzaniu danych w trybie synchronicznym', 'Obsługa wielowątkowości', 'Szybkie tworzenie prototypów aplikacji', 'Brak wsparcia dla systemów operacyjnych Windows'),
(6, 'Node.js jest jednonitkowy i asynchroniczny', 'Node.js korzysta z wątków do obsługi równoległości', 'Tradycyjne środowiska serwerowe są oparte na silniku V8', 'Node.js nie obsługuje protokołu HTTP'),
(7, 'Tworzenie interfejsów użytkownika', 'Tworzenie gier komputerowych', 'Aplikacje sieciowe, serwery API, aplikacje czasu rzeczywistego', 'Systemy operacyjne'),
(8, 'Mechanizm umożliwiający jednoczesne wykonywanie wielu procesów', 'Pętla odpowiedzialna za obsługę zdarzeń i callbacków', 'Interfejs graficzny dla użytkowników', 'Moduł do obsługi baz danych'),
(9, 'Fragmenty kodu JavaScript, które można ponownie wykorzystać', 'Komponenty interfejsu użytkownika', 'Kolekcje danych w bazie danych', 'Obrazy dyskowe'),
(10, 'read() i write()', 'console.log() i console.error()', 'fs.readFile() i fs.writeFile()', 'input() i output()'),
(11, 'Przez zatrzymywanie aplikacji w przypadku błędu', 'Przez wyświetlanie błędów na stronie internetowej', 'Przez obsługę wyjątków za pomocą bloków try-catch', 'Przez ignorowanie błędów'),
(12, 'lodash, jQuery, React', 'express.js, mongoose, socket.io', 'Python, Ruby, PHP', 'npm, git, bash'),
(13, 'Za pomocą wielowątkowości', 'Za pomocą procesów dziecinnych', 'Za pomocą jednonitkowości i asynchroniczności', 'Za pomocą modułu concurrency'),
(14, 'Framework do budowy interfejsów użytkownika', 'Środowisko uruchomieniowe oparte na silniku V8', 'Biblioteka do tworzenia gier komputerowych', 'Framework do budowy aplikacji sieciowych i API'),
(15, 'Callbacki są synchroniczne, a Promises są asynchroniczne', 'Callbacki obsługują tylko błędy, a Promises pozwalają na obsługę sukcesów i błędów', 'Callbacki są obsługiwane przez Event Loop, a Promises są obsługiwane przez moduł promise', 'Callbacki są obowiązkowe w Node.js, a Promises są opcjonalne'),
(16, 'Za pomocą modułu dependencies', 'Za pomocą narzędzia npm i pliku package.json', 'Za pomocą zmiennych globalnych', 'Za pomocą funkcji import'),
(17, 'Visual Studio Code, WebStorm, Node Inspector', 'Photoshop, Illustrator, Sketch', 'Excel, Word, PowerPoint', 'Eclipse, IntelliJ IDEA, NetBeans'),
(18, 'Program komputerowy do kompilacji kodu źródłowego', 'Narzędzie do tworzenia interfejsów użytkownika', 'Silnik JavaScript, który interpretuje i wykonuje kod JavaScript', 'Framework do tworzenia aplikacji mobilnych'),
(19, 'Testy jednostkowe, testy integracyjne, testy funkcjonalne', 'Testy automatyczne, testy manualne, testy wydajnościowe', 'Testy oprogramowania, testy sprzętowe, testy użytkownika', 'Testy wizualne, testy statyczne, testy dynamiczne'),
(20, 'Mikrousługi, serwisy kontenerowe, ciągła integracja i dostawa', 'Aplikacje desktopowe, rozszerzona rzeczywistość, sztuczna inteligencja', 'Aplikacje mobilne, internet rzeczy (IoT), gry wideo', 'Strony internetowe, blogi, sklepy internetowe');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `correct_answer`
--

CREATE TABLE `correct_answer` (
  `id` int(11) NOT NULL,
  `correct_answer` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `correct_answer`
--

INSERT INTO `correct_answer` (`id`, `correct_answer`) VALUES
(1, 'B'),
(2, 'C'),
(3, 'A'),
(4, 'A'),
(5, 'C'),
(6, 'A'),
(7, 'C'),
(8, 'B'),
(9, 'A'),
(10, 'C'),
(11, 'C'),
(12, 'B'),
(13, 'C'),
(14, 'D'),
(15, 'B'),
(16, 'B'),
(17, 'A'),
(18, 'C'),
(19, 'A'),
(20, 'A');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `header` varchar(200) DEFAULT NULL,
  `correct_answer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `header`, `correct_answer_id`) VALUES
(1, 'Co to jest Node.js?', 1),
(2, 'Jakie są główne cechy Node.js?', 2),
(3, 'W jakim języku programowania napisane jest Node.js?', 3),
(4, 'Do czego służy npm?', 4),
(5, 'Jakie są główne zalety korzystania z Node.js?', 5),
(6, 'Czym różni się Node.js od tradycyjnych środowisk serwerowych?', 6),
(7, 'Jakie są najpopularniejsze zastosowania Node.js?', 7),
(8, 'Co to jest Event Loop w kontekście Node.js?', 8),
(9, 'Co to są moduły w Node.js?', 9),
(10, 'Jakie są główne metody obsługi wejścia/wyjścia w Node.js?', 10),
(11, 'Jak można obsługiwać błędy w Node.js?', 11),
(12, 'Jakie są najważniejsze zewnętrzne moduły w środowisku Node.js?', 12),
(13, 'W jaki sposób Node.js obsługuje równoległość?', 13),
(14, 'Co to jest Express.js i jakie są jego zastosowania w kontekście Node.js?', 14),
(15, 'Jakie są różnice między callbackami a Promises w Node.js?', 15),
(16, 'Jak można zarządzać zależnościami w Node.js?', 16),
(17, 'Jakie są dostępne narzędzia do debugowania aplikacji Node.js?', 17),
(18, 'Co to jest środowisko uruchomieniowe (runtime) Node.js?', 18),
(19, 'Jakie są metody testowania aplikacji napisanych w Node.js?', 19),
(20, 'Jakie są obecne trendy w rozwoju aplikacji opartych na Node.js?', 20);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `correct_answer`
--
ALTER TABLE `correct_answer`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `correct_answer_id` (`correct_answer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `correct_answer`
--
ALTER TABLE `correct_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `fk_correct_answer_id` FOREIGN KEY (`correct_answer_id`) REFERENCES `correct_answer` (`id`),
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`id`) REFERENCES `answer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
