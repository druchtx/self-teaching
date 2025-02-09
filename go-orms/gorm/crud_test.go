package main

import (
	"testing"

	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

type User struct {
	gorm.Model
	Name    string
	Email   string
	Remarks string
}

var user = User{Name: "Lucas", Email: "xulu@ymail.ne.jp"}

// Create 创建
func TestCreateRecord(t *testing.T) {
	db := getConnection()

	result := db.Create(&user)

	if result.Error != nil {
		t.Fatal(result.Error)
	}
}

// Create 创建特定字段 1
func TestCreateWithSelectedFields1(t *testing.T) {
	db := getConnection()
	db.Select("Name").Create(&user)
}
func TestCreateWithSelectedFields2(t *testing.T) {
	db := getConnection()
	(&user).Remarks = "TestCreateWithSelectedFields2"
	db.Omit("Name").Create(&user)
}

func TestBatchInsert(t *testing.T) {
	db := getConnection()
	users := []User{
		{Name: "Lily"},
		{Name: "Mary"},
	}
	db.CreateInBatches(users, 100)
}

func TestRetrieving(t *testing.T) {

	db := getConnection()
	result := db.First(&User{})
	if result.Error != nil {
		t.Fail()
	}
	t.Log(result.RowsAffected)
}

func TestRetrieving1(t *testing.T) {

	db := getConnection()
	var users []*User
	result := db.Find(&users)
	if result.Error != nil {
		t.Fail()
	}
	t.Log(result.RowsAffected)
	t.Log(users)
}
func getConnection() *gorm.DB {
	db, err := gorm.Open(sqlite.Open("test.db"), &gorm.Config{})
	if err != nil {
		panic("failed to connect database")
	}
	db.AutoMigrate(&User{})
	return db
}
