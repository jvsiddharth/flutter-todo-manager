A full-stack todo management application built with a Flutter frontend and a Node.js backend.
The system automatically classifies tasks based on their title and description using keyword-based text parsing to determine task category, priority, and suggested actions.

---

## Tech Stack

Backend
- Node.js
- TypeScript
- Fastify
- PostgreSQL (Supabase)
- Jest (unit testing)
- Render (deployment)

Frontend
- Flutter (Material Design 3)
- Dart
- Riverpod (state management)
- Dio (API client)
- Intl (date formatting)

Infrastructure & Tooling
- Supabase (PostgreSQL database)
- Render (backend hosting)
- Environment variables for secrets
- Swagger / OpenAPI documentation

---

## Features

Core Features
- Create, view, update, and delete tasks
- Automatic task classification and prioritization
- Jira-like task organization concepts
- Summary of tasks by status
- Search and task filtering
- Pull-to-refresh
- Due date & time selection
- Inline task updates
- Task deletion
- Dark mode support
- Responsive Flutter UI

Intelligent Classification
On task creation, the backend:
- Detects task category (scheduling, finance, technical, safety, general)
- Assigns priority (high, medium, low)
- Extracts relevant entities from text
- Generates suggested actions based on category

---

## Backend Setup

Steps:
1. cd backend
2. npm install
3. npm run dev

Environment variables example:
DATABASE_URL=your_supabase_postgres_url

---

## Flutter App Setup

Steps:
1. flutter pub get
2. flutter run

---

## API Documentation

Swagger / OpenAPI docs are available at:
{BASE_URL}/docs

Endpoints:
- POST /api/tasks – Create a new task (with auto-classification)
- GET /api/tasks – List tasks (supports pagination & filters)
- GET /api/tasks/{id} – Get task details
- PATCH /api/tasks/{id} – Update task
- DELETE /api/tasks/{id} – Delete task

---

## Deployed Backend URL

Backend:
https://flutter-todo-manager.onrender.com

Swagger Docs:
https://flutter-todo-manager.onrender.com/docs

---

## Database Schema

tasks table
- id (uuid, primary key)
- title (text, not null)
- description (text)
- category (text)
- priority (text)
- status (text)
- assigned_to (text)
- due_date (timestamp)
- extracted_entities (jsonb)
- suggested_actions (jsonb)
- created_at (timestamp)
- updated_at (timestamp)

task_history table
- id (uuid, primary key)
- task_id (uuid, foreign key referencing tasks.id)
- action (text)
- old_value (jsonb)
- new_value (jsonb)
- changed_by (text)
- changed_at (timestamp)

---

## Screenshots

Main Dashboard
https://ibb.co/6kCWdf2

Create Task
https://ibb.co/8n4bmbQR

Added Task
https://ibb.co/cK9J16tz

Edit Task
https://ibb.co/b5N8yv41

Dark Mode
https://ibb.co/d02KBcmM

---

## Testing

- Unit tests implemented for task classification logic
- Tests validate category detection, priority assignment, and entity extraction
- Test runner: Jest

---

## Architecture Decisions

- Fastify chosen for lightweight and high-performance backend APIs
- Supabase used for reliable PostgreSQL hosting
- Flutter selected for cross-platform UI development
- Riverpod used for predictable and scalable state management
- Deterministic keyword-based classification used for transparency and testability
- Single-screen dashboard UI to keep the app focused and simple

---

## What I’d Improve With More Time

- User accounts and team collaboration
- JWT-based authentication with Google & Apple OAuth
- Role-based access control
- Real-time updates using Supabase subscriptions
- Drag-and-drop task reordering
- Export tasks to CSV
- Further UI polish inspired by modern productivity tools
  
---

Navicon Infraprojects
Backend + Flutter Hybrid Developer Assessment
