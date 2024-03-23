-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 22, 2024 lúc 11:12 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bke`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_id` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `updated_at`, `created_id`) VALUES
(555, 2, '2024-03-22 14:48:55', '2024-03-22 14:48:55'),
(950, 3, '2024-03-22 14:48:55', '2024-03-22 14:48:55'),
(998, 2, '2024-03-22 14:48:55', '2024-03-22 14:48:55'),
(999, 1, '2024-03-22 14:48:55', '2024-03-22 14:48:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders_details`
--

CREATE TABLE `orders_details` (
  `order_detai_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders_details`
--

INSERT INTO `orders_details` (`order_detai_id`, `order_id`, `product_id`, `updated_at`, `created_at`) VALUES
(101010, 999, 1113, '2024-03-22 14:54:40', '2024-03-22 14:54:40'),
(202020, 555, 1112, '2024-03-22 14:51:58', '2024-03-22 14:51:58'),
(303030, 555, 1112, '2024-03-22 14:54:15', '2024-03-22 14:54:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` double NOT NULL,
  `product_description` text NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `product_description`, `updated_at`, `created_at`) VALUES
(1111, 'Giày Adidas', 1500000, 'tồn kho', '2024-03-22 14:44:17', '2024-03-22 14:44:17'),
(1112, 'Vợt cầu long kumpoo 520 pro', 650000, 'hết hàng', '2024-03-22 14:44:17', '2024-03-22 14:44:17'),
(1113, 'Muối Tây Ninh', 5000, 'còn hàng', '2024-03-22 14:44:17', '2024-03-22 14:44:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(25) NOT NULL,
  `user_email` varchar(55) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `update_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_pass`, `update_at`, `created_at`) VALUES
(1, 'quang', 'quang@gmail.com', '1234', '2024-03-22 14:14:14', '2024-03-22 14:14:14'),
(2, 'tuan', 'tuan.@gmail.com', '1234', '2024-03-22 14:14:14', '2024-03-22 14:14:14'),
(3, 'vu', 'vu@gmaIl.com', '1234', '2024-03-22 14:14:14', '2024-03-22 14:14:14'),
(4, 'thinhga', 'thinh@gmail.com', '1234', '2024-03-22 15:18:42', '2024-03-22 15:18:42'),
(5, 'nguyen', 'nguyen.@gmail.com', '1234', '2024-03-22 15:18:42', '2024-03-22 15:18:42'),
(6, 'minh', 'minh@gmail.com', '1234', '2024-03-22 15:30:47', '2024-03-22 15:30:47'),
(7, 'qqqiqmm', 'qqqqq@email.tdc.edu.vn', '1234', '2024-03-22 15:32:44', '2024-03-22 15:32:44');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_user_orders` (`user_id`);

--
-- Chỉ mục cho bảng `orders_details`
--
ALTER TABLE `orders_details`
  ADD PRIMARY KEY (`order_detai_id`),
  ADD KEY `fk_produts_orderdetail` (`product_id`),
  ADD KEY `fk_orders_orderdetail` (`order_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT cho bảng `orders_details`
--
ALTER TABLE `orders_details`
  MODIFY `order_detai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=303031;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1114;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_user_orders` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `orders_details`
--
ALTER TABLE `orders_details`
  ADD CONSTRAINT `fk_orders_orderdetail` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
