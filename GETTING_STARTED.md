# UniVerse Project - Complete Setup Summary

## ✅ What Has Been Created

### Backend (Spring Boot) - 100% Complete
```
✓ UniverseApplication.java - Main application
✓ SecurityConfig.java - Security & CORS configuration
✓ 4 Model classes (User, Club, Event, ClubMembership)
✓ 4 Repository interfaces (Database access)
✓ 5 Service classes (Business logic)
✓ 5 Controller classes (REST APIs)
✓ application.properties - Configuration
✓ schema.sql - Database schema
✓ pom.xml - Maven dependencies
```

### Database Schema - Ready
- Users table (Students, Club Admins, Super Admins)
- Clubs table
- Events table
- Club Memberships table
- Proper foreign keys and relationships

### Frontend Folders - Organized
```
✓ src/components/auth/ - Authentication components
✓ src/components/clubs/ - Club components
✓ src/components/events/ - Event components
✓ src/components/admin/ - Admin components
✓ src/components/common/ - Shared components
```

### Documentation
```
✓ PROJECT_STRUCTURE.md - Complete project architecture
✓ TEAM_ASSIGNMENTS.md - Clear work division for 3 teammates
✓ backend/README.md - How to run backend
✓ This summary file
```

---

## 🎯 Three-Part Division (Simple & Clear)

### PART 1: Authentication (Teammate 1)
**What:** Login and Registration system
**Backend:** Already done ✓
**Frontend:** Need to create:
- LoginForm.tsx
- RegisterForm.tsx
- AuthContext.tsx (manages who is logged in)
- LoginPage.tsx
- RegisterPage.tsx

**Simple Explanation:**
- User fills login form
- Frontend sends email/password to backend
- Backend checks database
- Backend sends back JWT token
- Frontend saves token
- User is now logged in!

---

### PART 2: Clubs & Events (Teammate 2)
**What:** Students can view/join clubs and see events
**Backend:** Already done ✓
**Frontend:** Need to create/update:
- ClubCard.tsx (shows one club)
- EventCard.tsx (shows one event)
- ClubsPage.tsx (shows all clubs)
- EventsPage.tsx (shows all events)
- ClubRegistrationForm.tsx (join a club)

**Simple Explanation:**
- Frontend calls `/api/clubs` to get clubs
- Display clubs in cards
- Student clicks "Join Club"
- Frontend calls `/api/memberships/join`
- Student is now a member!

---

### PART 3: Admin Panels (Teammate 3)
**What:** Super Admin manages users, Club Admin manages their club
**Backend:** Already done ✓
**Frontend:** Need to create:
- SuperAdminPanel.tsx (add/remove club admins)
- ClubAdminPanel.tsx (manage club, create events)
- UserManagement.tsx (list of users)

**Simple Explanation:**
- Super Admin sees all users
- Can create new Club Admin
- Club Admin can create events for their club
- Club Admin can see who joined their club

---

## 🚀 How to Start Working

### Step 1: Setup MySQL Database
```sql
CREATE DATABASE universe_db;
USE universe_db;
-- Run the schema.sql file
```

### Step 2: Configure Backend
Edit `backend/src/main/resources/application.properties`:
```properties
spring.datasource.password=YOUR_MYSQL_PASSWORD
```

### Step 3: Run Backend
```bash
cd backend
mvn spring-boot:run
```
Backend will start on http://localhost:8080

### Step 4: Run Frontend
```bash
cd UniVerse
npm install
npm run dev
```
Frontend will start on http://localhost:3000

---

## 📁 Backend Structure (Easy to Explain in Viva)

### Layer 1: Controller (API Endpoints)
- Receives HTTP requests from frontend
- Example: `AuthController.java` handles `/api/auth/login`
- Returns JSON responses

### Layer 2: Service (Business Logic)
- Processes the requests
- Example: `UserService.java` checks if password is correct
- Calls Repository to access database

### Layer 3: Repository (Database Access)
- Talks to MySQL database
- Example: `UserRepository.java` finds user by email
- Uses JPA (automatic SQL generation)

### Layer 4: Model (Database Tables)
- Represents database tables as Java classes
- Example: `User.java` = `users` table
- Has getters and setters

**Flow Example:**
```
Frontend → Controller → Service → Repository → MySQL Database
   ↓          ↓           ↓           ↓
 Login     Check       Verify      Find user
 request   data        password    in database
```

---

## 🔒 Simple Security Explanation

### JWT (JSON Web Token)
1. User logs in with email/password
2. Backend creates a token (like a ticket)
3. Frontend saves token
4. Frontend sends token with every request
5. Backend checks token to verify user

### Password Security
- Never store plain passwords
- Use BCrypt to encrypt passwords
- `password123` becomes `$2a$10$abc...xyz`

### Roles
- STUDENT: Can view clubs/events, join clubs
- CLUB_ADMIN: Can create events, manage their club
- SUPER_ADMIN: Can create club admins, delete users

---

## 🗄️ Database Relationships (Simple)

### Users → Clubs (One-to-Many)
- One user can be admin of multiple clubs
- `clubs.admin_id` → `users.id`

### Clubs → Events (One-to-Many)
- One club can have multiple events
- `events.club_id` → `clubs.id`

### Users ↔ Clubs (Many-to-Many)
- One user can join multiple clubs
- One club can have multiple members
- `club_memberships` table connects them

---

## 📡 API Endpoints (What Frontend Calls)

### Authentication
```javascript
// Register
POST /api/auth/register
Body: {email, password, firstName, lastName, role}

// Login
POST /api/auth/login
Body: {email, password}
Returns: {token, user}
```

### Clubs
```javascript
// Get all clubs
GET /api/clubs
Returns: {success: true, clubs: [...]}

// Join a club
POST /api/memberships/join
Body: {userId, clubId}
```

### Events
```javascript
// Get all events
GET /api/events
Returns: {success: true, events: [...]}

// Create event (Club Admin only)
POST /api/events
Body: {title, description, eventDate, location, clubId}
```

### Admin
```javascript
// Get all users (Super Admin only)
GET /api/admin/users
Returns: {success: true, users: [...]}

// Create club admin (Super Admin only)
POST /api/admin/club-admins
Body: {email, password, firstName, lastName}
```

---

## 🧪 Testing Your Features

### Test Authentication (Part 1)
1. Start backend
2. Open Postman or browser
3. POST to `http://localhost:8080/api/auth/register`
4. Check if you get a token back
5. Try login with same credentials

### Test Clubs (Part 2)
1. GET `http://localhost:8080/api/clubs`
2. Should return empty array initially
3. Create a club using POST
4. GET clubs again, should see your club

### Test Admin (Part 3)
1. Login as super admin
2. GET `http://localhost:8080/api/admin/users`
3. Should see list of users
4. POST to create a club admin

---

## 🎨 Frontend Implementation Tips

### Simple Component Pattern
```typescript
// ClubCard.tsx - Display one club
export const ClubCard = ({ club }) => {
  return (
    <div className="card">
      <h3>{club.name}</h3>
      <p>{club.description}</p>
      <button>Join Club</button>
    </div>
  );
};

// ClubsPage.tsx - Display all clubs
export const ClubsPage = () => {
  const [clubs, setClubs] = useState([]);
  
  useEffect(() => {
    // Call API
    fetch('http://localhost:8080/api/clubs')
      .then(res => res.json())
      .then(data => setClubs(data.clubs));
  }, []);
  
  return (
    <div>
      {clubs.map(club => (
        <ClubCard key={club.id} club={club} />
      ))}
    </div>
  );
};
```

### Simple API Call Pattern
```typescript
// In your component
const handleJoinClub = async (clubId) => {
  const response = await fetch('http://localhost:8080/api/memberships/join', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${localStorage.getItem('token')}`
    },
    body: JSON.stringify({
      userId: currentUser.id,
      clubId: clubId
    })
  });
  
  const data = await response.json();
  if (data.success) {
    alert('Joined successfully!');
  }
};
```

---

## 🔄 Git Workflow (Step by Step)

### Initial Setup
```bash
git clone https://github.com/sanduladissanayake/UniVerse.git
cd UniVerse
```

### Create Your Branch
```bash
# Teammate 1
git checkout -b feature/auth-system

# Teammate 2
git checkout -b feature/clubs-events

# Teammate 3
git checkout -b feature/admin-panels
```

### Daily Work
```bash
# 1. Pull latest changes
git pull origin main

# 2. Work on your files
# ... make changes ...

# 3. Check what changed
git status

# 4. Add your changes
git add .

# 5. Commit with message
git commit -m "Add login form component"

# 6. Push to GitHub
git push origin YOUR_BRANCH_NAME
```

### Create Pull Request
1. Go to GitHub repository
2. Click "Pull Requests"
3. Click "New Pull Request"
4. Select your branch
5. Add description of changes
6. Request review from teammates

---

## 🎤 Viva Questions & Answers

**Q: What is MVC architecture?**
A: Model (database entities), View (React frontend), Controller (REST API endpoints)

**Q: How does authentication work?**
A: User logs in → Backend generates JWT token → Frontend stores token → Token sent with each request

**Q: What is JPA?**
A: Java Persistence API - automatically converts Java objects to SQL queries

**Q: Why use three layers (Controller, Service, Repository)?**
A: Separation of concerns - each layer has one job, easier to maintain and test

**Q: What is CORS?**
A: Cross-Origin Resource Sharing - allows frontend (port 3000) to talk to backend (port 8080)

**Q: How do you handle many-to-many relationships?**
A: Use junction table (club_memberships) that connects users and clubs

**Q: What is REST API?**
A: Representational State Transfer - uses HTTP methods (GET, POST, PUT, DELETE) for operations

**Q: Why use React Context?**
A: To share authentication state across all components without prop drilling

---

## 📊 Current Status

### ✅ Completed
- All backend code (Models, Repositories, Services, Controllers)
- Database schema
- Security configuration
- Project structure documentation
- Team assignments
- Folder organization

### ⚠️ To Do (By Team)
- Frontend components for each part
- React routing setup
- UI styling with Tailwind
- Integration testing
- Bug fixes

---

## 🆘 Common Problems & Solutions

### Problem: MySQL connection error
**Solution:** 
1. Check MySQL is running
2. Verify username/password in application.properties
3. Ensure database `universe_db` exists

### Problem: CORS error in browser
**Solution:** 
- Already configured in SecurityConfig.java
- Make sure backend is running on port 8080
- Frontend should be on port 3000 or 5173

### Problem: 401 Unauthorized
**Solution:**
- Check if token is being sent in Authorization header
- Verify token is stored in localStorage
- Check token hasn't expired (24 hours)

### Problem: Cannot find module
**Solution:**
```bash
cd UniVerse
npm install
```

---

## 📞 Next Steps

1. **All Team Members:**
   - Read PROJECT_STRUCTURE.md
   - Read TEAM_ASSIGNMENTS.md
   - Setup MySQL database
   - Test running backend

2. **Teammate 1 (Auth):**
   - Start with AuthContext.tsx
   - Then LoginForm.tsx
   - Test login flow

3. **Teammate 2 (Clubs):**
   - Wait for Part 1 to be merged
   - Start with ClubCard.tsx
   - Then ClubsPage.tsx

4. **Teammate 3 (Admin):**
   - Wait for Part 1 to be merged
   - Start with SuperAdminPanel.tsx
   - Use Part 2's components for club management

---

## 🎉 You're Ready!

All backend code is done and ready to use. The folder structure is organized. Each teammate knows exactly what to build. The database schema is ready.

**Now start coding and good luck with your viva! 🚀**

---

**Questions?** Check the documentation files:
- `PROJECT_STRUCTURE.md` - Full architecture
- `TEAM_ASSIGNMENTS.md` - Who does what
- `backend/README.md` - How to run backend
