2.What is the purpose of a database schema in PostgreSQL?
PostgreSQL হলো একটি ওপেন-সোর্স রিলেশনাল ডেটাবেস ম্যানেজমেন্ট সিস্টেম যা SQL এবং JSON Query সমর্থন করে। এটি ডেটা ম্যানেজমেন্টের জন্য একটি শক্তিশালী এবং উন্নত ডেটাবেস সিস্টেম হিসেবে পরিচিত, যা বড় ডেটাসেট, জটিল কোয়ারি, এবং উচ্চতর স্কেলেবিলিটির প্রয়োজনীয়তা মেটাতে সক্ষম |

3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
   Primary key হলো এমন একটি key যেটি একটি কলাম বা কলামের সংমিশ্রণ, যা প্রতিটি record জন্য unique। এটি টেবেলের মধ্যে ডুপ্লিকেট বা null মান থাকতে দেই না। একটি টেবিল জন্য একটি মাত্র Primary key.
   Foreign Key হলো এমন একটা কি যেটি এক বা একাধিক কলাম নিয়ে গঠিত। একটি primary key অন্য টেবিলের Foreign key। Foreign Key unique.

4.What is the difference between the VARCHAR and CHAR data types?
VARCHAR এবং CHAR হলো postgreSQL এর ব্যবহৃত দুটি string ডেটা টাইপ এদের মূল পার্থক্য হলো ডেটার length সংক্রান্ত আচরণ। CHAR(10) প্রতিটি entry তে 10 টি করে জায়গা ধারণ করে যদি কেউ 5 টি এন্ট্রি করে তো বাকি 5 টি স্থানে স্পেস pad করে। আর varchar (50) ব্যবহার করলে আপনি যতটুকু এন্ট্রি করবেন এতটাই পরিমাণ জায়গা নিবে, অতিরিক্ত জায়গা নেইনা।

5.Explain the purpose of the WHERE clause in a SELECT statement.
Select command মাধ্যমে ডেটাবেস টেবিল এর কলাম বা সব কলামের তথ্য নির্বাচন করা হয়।
syntax:-SELECT column1, column2 FROM table_name;
Example:- SELECT columns FROM table_name;

Where হচ্ছে শর্ত সাপেক্ষে তথ্য নির্বাচন করার ক্ষেত্রে ব্যবহার করা হয়।
Syntax:- SELECT COLUMN1, COLUMN2 FROM table_name WHERE condition;

6.What are the LIMIT and OFFSET clauses used for?
Limit:- এটি query ফলাফল থেকে কতটা রেকর্ড ফেরত দিতে হবে তা সীমিত করে ।
OFFSET: এটি QUERY ফলাফল থেকে কতটা রেকর্ড বাদ দিতে হবে তা নির্ধারণ করে। সাধারণত পেজিনেশন সিস্টেম এটি পরবর্তী পৃষ্টার জন্য ব্যবহৃত হয়।
LIMIT এবং OFFSET এর সিনট্যাক্স-
SELECT columns FROM table_name
Order By column_name
Limit number_of_rows
OFFSET number_of_rows_skip;

7.How can you modify data using UPDATE statements?
Update table_name
Set column1=value1, column2 = value2,
WHERE condition;
আমি এইখানে employee নামে টেবিল থেকে employee সালারি 5000 টাকা বৃদ্ধি করতে চাও ।
UPDATE employees SET salary = salary + 5000
WHERE employee_id = 10;

8.What is the significance of the JOIN operation, and how does it work in PostgreSQL?
JOIN অপারেশন হচ্ছে একাধিক টেবিলের সঙ্গে সংযুক্ত হওয়া। জয়েন এর সাহায্যে বিভিন্ন টেবিলের ডাটা নিয়ে অনেক অপারেশন চালানো যায়। কয়েক ধরনের JOIN আছে তবে তার মধ্যে থেকে JOIN গুলো হল LEFT JOIN, RIGHT JOIN, FULL JOIN, CROSS JOIN, NATARUL JOIN ,
LEFT JOIN:-
SELECT \* FROM table1,
LEFT JOIN table2
ON table1.column=table2.column;
Left join বাম দিকের টেবিলের ডাটা জয়েন করে এবং Right join ডান দিকের টেবিলের ডাটা জয়েন করে। Full join Left and Right টেবিলের সমস্ত ডেটা কে একত্রিত করে দেখাবে।
CROSS JOIN:- প্রথম টেবিলের প্রতিটি রেকর্ড সাথে দ্বিতীয় টেবিল প্রতিটি রেকর্ড সংমিশ্রণ রিটার্ন করে।

9.Explain the GROUP BY clause and its role in aggregation operations.
GROUP BY একটি গুরুত্বপূর্ণ ক্লোজ যা ডেটাকে নির্দিষ্ট কলামের ভিত্তিতে গ্রুপ করে এবং প্রতিটি গ্রুপের উপর এগ্রিগেট ফাংশন প্রয়োগ সহায়তা করে। প্রতিটি গ্রুপের জন্য একটি ROWS রিটার্ন করে, যেখানে এগ্রিগেট ফাংশনের ফলাফল প্রকাশিত হয়। গ্রুপ করা ডেটা উপরে অগ্রিগেট ফাংশন যেমন MAX(), SUM(), COUNT(),MIN(), AVG() ইউজ করা যায়
