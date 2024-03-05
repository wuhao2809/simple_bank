postgres:
	docker run --name postgresSimpleBank -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=abcd136136 -d postgres

createdb:
	docker exec -it postgresSimpleBank createdb --username=postgres --owner=postgres simple_bank_2

dropdb:
	docker exec -it postgresSimpleBank dropdb simple_bank_2 -U postgres

migrateup:
	migrate -path ./migration -database "postgresql://postgres:abcd136136@localhost:5432/simple_bank_2?sslmode=disable" -verbose up

migratedown:
	migrate -path ./migration -database "postgresql://postgres:abcd136136@localhost:5432/simple_bank_2?sslmode=disable" -verbose down

sqlc:
	sqlc generate
.PHONY: createdb postgres dropdb migrateup migratedown sqlc