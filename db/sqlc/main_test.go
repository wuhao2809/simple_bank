package db

import (
	"database/sql"
	"log"
	"os"
	"testing"

	_ "github.com/lib/pq"
)

const (
	dbDrive  = "postgres"
	dBSource = "postgresql://postgres:abcd136136@localhost:5432/simple_bank_2?sslmode=disable"
)

var testQueries *Queries
var testDB *sql.DB

func TestMain(m *testing.M) {
	var err error
	testDB, err = sql.Open(dbDrive, dBSource)
	if err != nil {
		log.Fatal("cannot load config:", err)
	}

	testQueries = New(testDB)
	os.Exit(m.Run())
}
