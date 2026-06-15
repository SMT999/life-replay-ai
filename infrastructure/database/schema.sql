
Screenshot_20260613-193337.png
Where is the paper clip attachment 

Great. Let's start with the repository structure for a serious MVP.

Repository Structure
life-replay-ai/
│
├── apps/
│   ├── web/                 # Next.js frontend
│   └── api/                 # FastAPI backend
│
├── packages/
│   ├── shared/
│   └── ui/
│
├── infrastructure/
│   ├── docker/
│   └── database/
│
├── docs/
│
├── .github/
│   └── workflows/
│
├── docker-compose.yml
├── README.md
└── .env.example
Phase 1 Database Schema
Create:

infrastructure/database/schema.sql

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE memories (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id),
    title VARCHAR(255),
    content TEXT NOT NULL,
    summary TEXT,
    mood VARCHAR(50),
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE tags (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE memory_tags (
    memory_id UUID REFERENCES memories(id),
    tag_id UUID REFERENCES tags(id),
    PRIMARY KEY(memory_id, tag_id)
);

CREATE TABLE goals (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id),
    title VARCHAR(255),
    description TEXT,
    progress INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW()
);
