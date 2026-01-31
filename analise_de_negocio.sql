SELECT * FROM customer LIMIT 20

--Q1. Qual é a receita total gerada por clientes do sexo masculino vs. feminino?
SELECT gender, SUM(purchase_amount) AS revenue
FROM customer
GROUP BY gender

--Q2. Qual cliente utilizou um desconto, mas ainda assim gastou mais do que o valor médio de compra?
SELECT customer_id, purchase_amount
FROM customer
WHERE discount_applied = 'Yes' AND purchase_amount > (SELECT AVG (purchase_amount) FROM customer)

--Q3. Quais são os 5 produtos com a maior média de avaliação (review rating)?
SELECT item_purchased, ROUND(AVG(review_rating::numeric),2) AS "Média de Avaliação de Produtos"
FROM customer
GROUP BY item_purchased 
ORDER BY AVG(review_rating) DESC
LIMIT 5;

--Q4. Compare os valores médios de compra entre o frete Padrão (Standard) e o Expresso (Express).
SELECT shipping_type,
ROUND(AVG(purchase_amount),2)
FROM customer
WHERE shipping_type IN ('Standard','Express')
GROUP BY shipping_type

--Q5. Clientes assinantes gastam mais? Compare o gasto médio e a receita total entre assinantes e não assinantes.
SELECT subscription_status,
COUNT(customer_id) AS total_customers,
ROUND(AVG(purchase_amount),2) AS avg_spend,
ROUND(SUM(purchase_amount),2) AS total_revenue
FROM customer
GROUP BY subscription_status
ORDER BY total_revenue, avg_spend DESC;


--Q6. Quais são os 5 produtos que possuem a maior porcentagem de compras com desconto aplicado?
SELECT item_purchased,
ROUND(100 * SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS discount_rate
FROM customer
GROUP BY item_purchased
ORDER BY discount_rate DESC
LIMIT 5;

--Q7. Segmente os clientes em "Novo", "Recorrente" e "Fiel" com base no número total de compras anteriores e mostre a contagem de cada segmento.
WITH customer_type AS (
SELECT customer_id, previous_purchases,
CASE 
	WHEN previous_purchases = 1 THEN 'Novo'
	WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Recorrente'
	ELSE 'Fiel'
	END AS customer_segment
FROM customer
)

SELECT customer_segment, COUNT(*) AS "Número de consumidores"
FROM customer_type
GROUP BY customer_segment
ORDER BY "Número de consumidores" DESC;

--Q8. Quais são os 3 produtos mais comprados dentro de cada categoria?
WITH item_counts AS (
SELECT category, 
item_purchased,
COUNT(customer_id) AS total_orders,
ROW_NUMBER() OVER(PARTITION BY category ORDER BY COUNT(customer_id) DESC) AS item_rank
FROM customer
GROUP BY category, item_purchased
)

SELECT item_rank, category, item_purchased, total_orders
FROM item_counts
WHERE item_rank <= 3;

--Q9. Clientes que são compradores repetitivos (mais de 5 compras anteriores) também têm maior probabilidade de assinar?
SELECT subscription_status,
COUNT(customer_id) AS repeat_buyers
FROM customer
WHERE previous_purchases > 5
GROUP BY subscription_status

--Q10. Qual é a contribuição de receita de cada faixa etária?
SELECT age_group,
SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY age_group
ORDER BY total_revenue DESC;
