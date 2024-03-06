# Develop log

### Solve the deadlock:
1. -- name: GetAccountForUpdate :one
SELECT * FROM account
WHERE id = $1 LIMIT 1
FOR NO KEY UPDATE;

tell the postgres that NO KEY UPDATE

2. always alter the balance with the smaller accountID first