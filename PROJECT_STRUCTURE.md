# UniVerse Project Structure & Implementation Guide

## Project Overview
University Club Management System with React, Spring Boot, MySQL, and Tailwind CSS

---

## Backend Structure (Spring Boot)

```
backend/
├── src/main/java/com/university/universe/
│   ├── UniverseApplication.java          # Main application entry point
│   ├── model/                            # Database entities
│   │   ├── User.java                     # User entity (Students, Admins)
│   │   ├── Club.java                     # Club entity
│   │   ├── Event.java                    # Event entity
│   │   └── ClubMembership.java           # Club membership junction table
│   ├── repository/                       # Database access layer
│   │   ├── UserRepository.java           # User CRUD operations
│   │   ├── ClubRepository.java           # Club CRUD operations
│   │   ├── EventRepository.java          # Event CRUD operations
│   │   └── ClubMembershipRepository.java # Membership CRUD operations
│   ├── service/                          # Business logic layer
│   │   ├── UserService.java              # User business logic
│   │   ├── JwtService.java               # JWT token generation/validation
│   │   ├── ClubService.java              # Club business logic
│   │   ├── EventService.java             # Event business logic
│   │   └── ClubMembershipService.java    # Membership business logic
│   ├── controller/                       # API endpoints (REST controllers)
│   │   ├── AuthController.java           # /api/auth/** endpoints
│   │   ├── ClubController.java           # /api/clubs/** endpoints
│   │   ├── EventController.java          # /api/events/** endpoints
│   │   ├── ClubMembershipController.java # /api/memberships/** endpoints
│   │   └── AdminController.java          # /api/admin/** endpoints
│   └── config/
│       └── SecurityConfig.java           # Spring Security & CORS configuration
├── src/main/resources/
│   ├── application.properties            # Database & app configuration
│   └── schema.sql                        # Database schema (run manually)
└── pom.xml                               # Maven dependencies

```

---

## Frontend Structure (React + TypeScript)

```
src/
├── components/
│   ├── auth/                             # PART 1: Authentication Components
│   │   ├── LoginForm.tsx                 # Login form component
│   │   ├── RegisterForm.tsx              # Registration form component
│   │   └── ProtectedRoute.tsx            # Route protection wrapper
│   ├── clubs/                            # PART 2: Club Components
│   │   ├── ClubCard.tsx                  # Display single club
│   │   ├── ClubList.tsx                  # List all clubs
│   │   ├── ClubDetail.tsx                # Club detail view
│   │   └── ClubRegistrationForm.tsx      # Form to join a club
│   ├── events/                           # PART 2: Event Components
│   │   ├── EventCard.tsx                 # Display single event
│   │   ├── EventList.tsx                 # List all events
│   │   └── EventDetail.tsx               # Event detail view
│   ├── admin/                            # PART 3: Admin Components
│   │   ├── SuperAdminPanel.tsx           # Super admin dashboard
│   │   ├── ClubAdminPanel.tsx            # Club admin dashboard
│   │   ├── UserManagement.tsx            # Manage users (super admin)
│   │   └── ClubAdminForm.tsx             # Create club admin form
│   ├── common/                           # Shared components
│   │   ├── Button.tsx                    # Reusable button
│   │   ├── Input.tsx                     # Reusable input
│   │   └── Card.tsx                      # Reusable card
│   └── layout/
│       ├── Navigation.tsx                # Navigation bar
│       └── Layout.tsx                    # Main layout wrapper
├── pages/
│   ├── HomePage.tsx                      # Landing page
│   ├── LoginPage.tsx                     # Login page
│   ├── RegisterPage.tsx                  # Registration page
│   ├── ClubsPage.tsx                     # All clubs page
│   ├── ClubDetailPage.tsx                # Single club page
│   ├── EventsPage.tsx                    # All events page
│   ├── EventDetailPage.tsx               # Single event page
│   ├── SuperAdminDashboard.tsx           # Super admin dashboard page
│   └── ClubAdminDashboard.tsx            # Club admin dashboard page
├── context/
│   └── AuthContext.tsx                   # PART 1: Authentication context
├── services/
│   └── api.ts                            # API calls to backend
├── types/
│   └── index.ts                          # TypeScript interfaces
└── App.tsx                               # Main app with routes

```

---

## Three-Part Work Division

### **PART 1: Authentication System**
**Teammate 1 Responsibilities:**
- Backend: `AuthController.java`, `UserService.java`, `JwtService.java`, `UserRepository.java`
- Frontend: `AuthContext.tsx`, `LoginForm.tsx`, `RegisterForm.tsx`, `ProtectedRoute.tsx`
- Pages: `LoginPage.tsx`, `RegisterPage.tsx`
- API: `authAPI` in `api.ts`

**Files to work on:**
```
backend/src/main/java/com/university/universe/
  ├── controller/AuthController.java
  ├── service/UserService.java
  ├── service/JwtService.java
  └── repository/UserRepository.java

frontend/src/
  ├── components/auth/
  │   ├── LoginForm.tsx
  │   ├── RegisterForm.tsx
  │   └── ProtectedRoute.tsx
  ├── pages/
  │   ├── LoginPage.tsx
  │   └── RegisterPage.tsx
  ├── context/AuthContext.tsx
  └── services/api.ts (authAPI section)
```

**GitHub Branch:** `feature/auth-system`

---

### **PART 2: Clubs & Events Management**
**Teammate 2 Responsibilities:**
- Backend: `ClubController.java`, `EventController.java`, `ClubMembershipController.java`
- Backend Services: `ClubService.java`, `EventService.java`, `ClubMembershipService.java`
- Frontend: Club and Event components
- Pages: Club and Event pages
- API: `clubAPI`, `eventAPI`, `membershipAPI`

**Files to work on:**
```
backend/src/main/java/com/university/universe/
  ├── controller/
  │   ├── ClubController.java
  │   ├── EventController.java
  │   └── ClubMembershipController.java
  ├── service/
  │   ├── ClubService.java
  │   ├── EventService.java
  │   └── ClubMembershipService.java
  └── repository/
      ├── ClubRepository.java
      ├── EventRepository.java
      └── ClubMembershipRepository.java

frontend/src/
  ├── components/
  │   ├── clubs/
  │   │   ├── ClubCard.tsx
  │   │   ├── ClubList.tsx
  │   │   ├── ClubDetail.tsx
  │   │   └── ClubRegistrationForm.tsx
  │   └── events/
  │       ├── EventCard.tsx
  │       ├── EventList.tsx
  │       └── EventDetail.tsx
  ├── pages/
  │   ├── ClubsPage.tsx
  │   ├── ClubDetailPage.tsx
  │   ├── EventsPage.tsx
  │   └── EventDetailPage.tsx
  └── services/api.ts (clubAPI, eventAPI, membershipAPI sections)
```

**GitHub Branch:** `feature/clubs-events`

---

### **PART 3: Admin Panels**
**Teammate 3 Responsibilities:**
- Backend: `AdminController.java`
- Frontend: Admin panel components
- Pages: Admin dashboards
- API: `adminAPI`

**Files to work on:**
```
backend/src/main/java/com/university/universe/
  └── controller/AdminController.java

frontend/src/
  ├── components/admin/
  │   ├── SuperAdminPanel.tsx
  │   ├── ClubAdminPanel.tsx
  │   ├── UserManagement.tsx
  │   └── ClubAdminForm.tsx
  ├── pages/
  │   ├── SuperAdminDashboard.tsx
  │   └── ClubAdminDashboard.tsx
  └── services/api.ts (adminAPI section)
```

**GitHub Branch:** `feature/admin-panels`

---

## Database Setup Guide

### Step 1: Install MySQL
1. Download MySQL from https://dev.mysql.com/downloads/
2. Install and set root password

### Step 2: Create Database
```sql
CREATE DATABASE universe_db;
USE universe_db;
```

### Step 3: Run Schema
Execute the schema from `backend/src/main/resources/schema.sql`

### Step 4: Update Configuration
Edit `backend/src/main/resources/application.properties`:
```properties
spring.datasource.username=root
spring.datasource.password=YOUR_PASSWORD
```

### Step 5: Team Sharing
**Option A: Shared Database**
- Host database on a server (e.g., AWS RDS, DigitalOcean)
- Share credentials via secure channel (NOT in Git)
- Everyone connects to same database

**Option B: Local Databases**
- Each teammate runs MySQL locally
- Use same schema.sql file
- Test independently
- Merge code through GitHub

---

## Running the Project

### Backend (Spring Boot)
```bash
cd backend
mvn spring-boot:run
```
Server runs on: http://localhost:8080

### Frontend (React)
```bash
cd UniVerse
npm install
npm run dev
```
App runs on: http://localhost:3000

---

## API Endpoints Reference

### Authentication (`/api/auth`)
- POST `/api/auth/register` - Register new user
- POST `/api/auth/login` - Login user
- GET `/api/auth/me` - Get current user

### Clubs (`/api/clubs`)
- GET `/api/clubs` - Get all clubs
- GET `/api/clubs/{id}` - Get club by ID
- POST `/api/clubs` - Create club (Admin)
- PUT `/api/clubs/{id}` - Update club (Admin)
- DELETE `/api/clubs/{id}` - Delete club (Admin)

### Events (`/api/events`)
- GET `/api/events` - Get all events
- GET `/api/events/{id}` - Get event by ID
- GET `/api/events/club/{clubId}` - Get events by club
- POST `/api/events` - Create event (Club Admin)
- PUT `/api/events/{id}` - Update event (Club Admin)
- DELETE `/api/events/{id}` - Delete event (Club Admin)

### Memberships (`/api/memberships`)
- POST `/api/memberships/join` - Join a club
- DELETE `/api/memberships/leave` - Leave a club
- GET `/api/memberships/user/{userId}` - Get user memberships
- GET `/api/memberships/club/{clubId}` - Get club members

### Admin (`/api/admin`)
- GET `/api/admin/users` - Get all users (Super Admin)
- GET `/api/admin/club-admins` - Get all club admins (Super Admin)
- POST `/api/admin/club-admins` - Create club admin (Super Admin)
- PUT `/api/admin/users/{id}` - Update user (Super Admin)
- DELETE `/api/admin/users/{id}` - Delete user (Super Admin)

---

## Git Collaboration Workflow

### Initial Setup
```bash
git clone https://github.com/sanduladissanayake/UniVerse.git
cd UniVerse
```

### For Teammate 1 (Auth System)
```bash
git checkout -b feature/auth-system
# Work on Part 1 files
git add .
git commit -m "Implement authentication system"
git push origin feature/auth-system
# Create Pull Request on GitHub
```

### For Teammate 2 (Clubs & Events)
```bash
git checkout -b feature/clubs-events
# Work on Part 2 files
git add .
git commit -m "Implement clubs and events management"
git push origin feature/clubs-events
# Create Pull Request on GitHub
```

### For Teammate 3 (Admin Panels)
```bash
git checkout -b feature/admin-panels
# Work on Part 3 files
git add .
git commit -m "Implement admin panels"
git push origin feature/admin-panels
# Create Pull Request on GitHub
```

### Merging to Main
1. Review Pull Requests
2. Test each feature
3. Merge to main branch
4. Pull latest changes: `git pull origin main`

---

## Environment Variables

### Backend (.env or application.properties)
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/universe_db
spring.datasource.username=root
spring.datasource.password=your_password
jwt.secret=UniVerseSecretKeyForJWTTokenGeneration2024
jwt.expiration=86400000
```

### Frontend (.env)
```env
VITE_API_BASE_URL=http://localhost:8080/api
```

---

## Viva Explanation Points

### Architecture
- **MVC Pattern**: Model (entities), View (React), Controller (REST APIs)
- **Three-tier**: Presentation (React), Business Logic (Services), Data (Repositories)
- **RESTful API**: HTTP methods (GET, POST, PUT, DELETE)

### Security
- **JWT Authentication**: Token-based authentication
- **Password Encryption**: BCrypt hashing
- **Role-based Access**: STUDENT, CLUB_ADMIN, SUPER_ADMIN

### Database
- **Relational Database**: MySQL with proper foreign keys
- **JPA/Hibernate**: Object-relational mapping
- **Cascade Operations**: Automatic deletion of related records

### Frontend
- **Component-based**: Reusable React components
- **State Management**: Context API for auth state
- **Routing**: React Router for navigation
- **Styling**: Tailwind CSS utility classes

### Backend
- **Spring Boot**: Auto-configuration and embedded server
- **RESTful Controllers**: @RestController, @RequestMapping
- **Service Layer**: Business logic separation
- **Repository Layer**: Database abstraction with JPA

---

## Testing Checklist

- [ ] User can register with STUDENT role
- [ ] User can login and receive JWT token
- [ ] Protected routes require authentication
- [ ] Students can view all clubs
- [ ] Students can join/leave clubs
- [ ] Students can view all events
- [ ] Club Admin can create/edit/delete events
- [ ] Club Admin can view club members
- [ ] Super Admin can create club admins
- [ ] Super Admin can delete users
- [ ] Super Admin can assign admins to clubs

---

## Common Issues & Solutions

### Backend won't start
- Check MySQL is running
- Verify database credentials
- Ensure port 8080 is available

### Frontend can't connect to backend
- Verify backend is running on port 8080
- Check CORS configuration
- Confirm API_BASE_URL in frontend

### Database errors
- Run schema.sql first
- Check foreign key constraints
- Verify table names match entities

---

## Additional Resources

- Spring Boot Docs: https://spring.io/projects/spring-boot
- React Docs: https://react.dev
- MySQL Docs: https://dev.mysql.com/doc/
- Tailwind CSS: https://tailwindcss.com/docs
