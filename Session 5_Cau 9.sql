select film_id, title, rating, length, rental_rate
from sakila.film
where rating = 'PG' and length > 100 and rental_rate > 2.00
order by rental_rate desc;

update sakila.film
set rental_rate = rental_rate / 2
where rating = 'PG' and length>100 and rental_rate>2.00;

/*
1. Rủi ro:
   Nếu UPDATE không có hoặc sai WHERE, toàn bộ giá thuê phim sẽ bị giảm,
   gây thất thoát doanh thu nghiêm trọng và ảnh hưởng báo cáo tài chính.

2. Kế hoạch hoàn tác:
   Có thể khôi phục giá bằng câu lệnh ngược lại:
   UPDATE sakila.film
   SET rental_rate = rental_rate * 2
   WHERE rating = 'PG' AND length > 100 AND rental_rate <= 2.00;

   Việc chuẩn bị lệnh rollback giúp xử lý lỗi nhanh và bảo vệ tính toàn vẹn dữ liệu.

3. Đề xuất cải tiến:
   Lưu giá gốc vào cột original_rental_rate hoặc tạo bảng backup để đảm bảo an toàn trước khi cập nhật hàng loạt.
*/