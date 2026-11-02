-- Abdulwaris Ahmad - Oracle 23ai Vector Lab - Kano, Nigeria
-- Project for Qatar DBA Interview - Oct 2026

CREATE TABLE baggage_search (
  id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  description VARCHAR2(1000),
  embedding VECTOR(768, FLOAT32)
);

-- Insert sample with dummy vector (real would be from embedding model)
INSERT INTO baggage_search (description) VALUES ('Black suitcase from Kano to Doha');

-- Vector search query - The future of Qatar airport search
SELECT id, description,
       VECTOR_DISTANCE(embedding, :query_vector, COSINE) as similarity
FROM baggage_search
ORDER BY similarity
FETCH FIRST 5 ROWS ONLY;
