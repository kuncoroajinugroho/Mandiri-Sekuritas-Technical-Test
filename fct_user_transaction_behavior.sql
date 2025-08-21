CREATE OR REPLACE TABLE `data-analyst-mandiri-sekuritas.Technical_Test_1.fct_user_transaction_behavior` AS
SELECT
  -- From users_data
  u.id AS user_id,
  u.gender,
  u.current_age,
  CASE
    WHEN u.current_age BETWEEN 18 AND 26 THEN 'Gen Z (18-26)'
    WHEN u.current_age BETWEEN 27 AND 43 THEN 'Millennials (27-43)'
    WHEN u.current_age BETWEEN 44 AND 59 THEN 'Gen X (44-59)'
    WHEN u.current_age >= 60 THEN 'Boomers (60+)'
    ELSE 'Unknown'
  END age_segment,
  u.birth_year,
  u.birth_month,
  u.per_capita_income,
  u.yearly_income,
  u.total_debt,
  u.credit_score,
  u.num_credit_cards,
  u.latitude,
  u.longitude,
  
  -- From cards_data
  c.id AS card_id,
  c.card_type,
  c.card_brand,
  c.num_cards_issued,
  c.credit_limit,
  c.has_chip,
  c.card_on_dark_web,
  c.acct_open_date,
  
  -- From transaction_data
  t.id AS transaction_id,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', date) AS transaction_date,
  t.amount AS transaction_amount,
  t.use_chip,
  t.merchant_id,
  t.merchant_city,
  t.merchant_state,
  t.zip,
  t.mcc,
  t.errors
  
FROM `data-analyst-mandiri-sekuritas.Technical_Test_1.transaction_data` t
LEFT JOIN `data-analyst-mandiri-sekuritas.Technical_Test_1.cards_data` c
  ON t.card_id = c.id
LEFT JOIN `data-analyst-mandiri-sekuritas.Technical_Test_1.users_data` u
  ON t.client_id = u.id;



