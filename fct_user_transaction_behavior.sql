
-- Create FCT Table: fct_user_transaction_behavior

WITH transaction_per_user AS (
  SELECT
    client_id AS user_id,
    COUNT(*) AS transaction_per_user
  FROM `project.dataset.transaction_data`
  GROUP BY client_id
)

SELECT
  -- User data
  u.id AS user_id,
  u.gender,
  u.current_age,
  u.per_capita_income,
  u.yearly_income,
  u.total_debt,
  u.credit_score,
  u.num_credit_cards,

  -- Card data
  c.id AS card_id,
  c.card_type,
  c.card_brand,
  c.credit_limit,
  c.has_chip,
  c.card_on_dark_web,

  -- Transaction data
  t.id AS transaction_id,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', t.date) AS transaction_date,
  t.amount AS transaction_amount,
  t.use_chip,
  t.merchant_id,
  t.mcc,
  t.errors,

  -- Behavior segmentation
  tp.transaction_per_user,
  CASE
    WHEN tp.transaction_per_user = 1 THEN 'One-Time Buyer'
    WHEN tp.transaction_per_user BETWEEN 2 AND 10 THEN 'Occasional Buyer'
    WHEN tp.transaction_per_user > 10 THEN 'Frequent Buyer'
    ELSE 'Unknown'
  END AS repeat_user_segment

FROM `project.dataset.transaction_data` t
LEFT JOIN `project.dataset.cards_data` c ON t.card_id = c.id
LEFT JOIN `project.dataset.users_data` u ON t.client_id = u.id
LEFT JOIN transaction_per_user tp ON t.client_id = tp.user_id;
