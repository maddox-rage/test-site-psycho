package handlers

import "examplePractice/internal/database"

type Handlers struct {
	store *database.TaskStore
}

func NewHandlers