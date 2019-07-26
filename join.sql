SELECT b.book_id, a.name, a.author_id, b.title 
FROM books AS b JOIN authors AS a ON a.author_id = b.author_id 
WHERE a.author_id BETWEEN 1 and 5;