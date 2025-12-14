# 🚀 UniVerse Setup & Deployment Guide

## 📋 Prerequisites

Before you start, ensure you have:
- **Node.js** (v16 or higher) - [Download](https://nodejs.org/)
- **Java JDK** (17 or higher) - [Download](https://adoptium.net/)
- **MySQL** (8.0 or higher) - [Download](https://dev.mysql.com/downloads/)
- **Maven** (3.6 or higher) - Comes with most Java IDEs
- **Git** - [Download](https://git-scm.com/)

---

## 🗄️ Database Setup

### Step 1: Start MySQL Server
Open MySQL Workbench or command line.

### Step 2: Run Migration Script
```sql
-- Open the file: database/migration_v1.0.sql
-- Execute the entire script in MySQL Workbench
-- This will:
-- 1. Create universe_db database
-- 2. Create all tables (users, clubs, events, club_memberships)
-- 3. Insert sample data
```

### Step 3: Verify Database
```sql
USE universe_db;
SHOW TABLES;
SELECT * FROM users;
SELECT * FROM clubs;
```

You should see:
- ✅ 1 super admin user (email: admin@university.edu, password: admin123)
- ✅ 5 sample clubs
- ✅ 5 sample events

---

## 🖥️ Backend Setup (Spring Boot)

### Step 1: Configure Database Connection
Navigate to `backend/src/main/resources/application.properties`:

```properties
# Update with YOUR MySQL credentials
spring.datasource.username=root
spring.datasource.password=YOUR_MYSQL_PASSWORD
```

### Step 2: Install Dependencies & Run
```bash
# Navigate to backend folder
cd backend

# Install dependencies (Maven will download all packages)
mvn clean install

# Run the application
mvn spring-boot:run
```

### Step 3: Verify Backend is Running
Open browser and go to: `http://localhost:8080`

You should see Spring Boot is running. Test an endpoint:
- `GET http://localhost:8080/api/clubs` - Should return list of clubs

---

## 🎨 Frontend Setup (React + Vite)

### Step 1: Install Dependencies
```bash
# Navigate to project root
cd UniVerse

# Install all npm packages
npm install
```

### Step 2: Run Development Server
```bash
npm run dev
```

The app will start at: `http://localhost:3000`

---

## 🧪 Testing the Application

### Test Super Admin Login
1. Go to `http://localhost:3000/login`
2. Email: `admin@university.edu`
3. Password: `admin123`
4. You should see the Super Admin Dashboard

### Test Student Registration
1. Go to `http://localhost:3000/register`
2. Fill in the form
3. Register as a student
4. Login and explore clubs/events

### Test Club Admin Creation
1. Login as Super Admin
2. Go to Super Admin Panel
3. Click "Create Club Admin"
4. Fill in the form and create a new admin
5. Logout and login with the new admin credentials
6. You should see the Club Admin Panel

---

## 👥 GitHub Collaboration Guide

### For Each Team Member:

#### Step 1: Clone the Repository
```bash
git clone <your-repo-url>
cd UniVerse
```

#### Step 2: Create Local Database
Each member must:
1. Install MySQL locally
2. Run `database/migration_v1.0.sql` on their machine
3. Update `backend/src/main/resources/application.properties` with THEIR password

⚠️ **NEVER commit database passwords to GitHub!**

#### Step 3: Create Local Configuration
Create `backend/src/main/resources/application-local.properties`:
```properties
spring.datasource.password=YOUR_PASSWORD
```

Add this to `.gitignore`:
```
application-local.properties
```

### Team Workflow:

#### Developer 1: Frontend Components
```bash
git checkout -b feature/frontend-components
# Work on React components
git add .
git commit -m "Add new components"
git push origin feature/frontend-components
# Create Pull Request
```

#### Developer 2: Backend APIs
```bash
git checkout -b feature/backend-apis
# Work on Spring Boot controllers/services
git add .
git commit -m "Add new API endpoints"
git push origin feature/backend-apis
# Create Pull Request
```

#### Developer 3: Database Changes
```bash
git checkout -b feature/database-schema
# Create new migration file: database/migration_v1.1.sql
git add database/migration_v1.1.sql
git commit -m "Add new database tables"
git push origin feature/database-schema
# Create Pull Request
# Other team members will pull and run the new migration
```

### Handling Database Changes:
1. Create new migration file (e.g., `migration_v1.1.sql`)
2. Never modify existing migration files
3. Each team member runs new migrations locally
4. Document migrations in a MIGRATIONS.md file

---

## 🛠️ Troubleshooting

### Backend Won't Start
- ✅ Check MySQL is running
- ✅ Verify database `universe_db` exists
- ✅ Check username/password in `application.properties`
- ✅ Ensure port 8080 is not in use

### Frontend Won't Start
- ✅ Run `npm install` again
- ✅ Delete `node_modules` and `package-lock.json`, then reinstall
- ✅ Check Node.js version (should be 16+)

### CORS Errors
Backend is configured to allow `http://localhost:3000`. If you change ports, update:
```java
// backend/src/main/java/com/university/universe/config/SecurityConfig.java
.allowedOrigins("http://localhost:3000") // Update this
```

### Database Connection Errors
```bash
# Test MySQL connection
mysql -u root -p
# If it works, MySQL is running
# If not, start MySQL service
```

---

## 📦 Production Deployment

### Build Frontend
```bash
npm run build
# Creates optimized build in dist/ folder
```

### Build Backend
```bash
cd backend
mvn clean package
# Creates JAR file in target/ folder
```

### Deploy to Server
1. Upload JAR file to server
2. Run: `java -jar universe-0.0.1-SNAPSHOT.jar`
3. Upload frontend `dist/` folder to web server (Nginx, Apache)
4. Configure environment variables for production database

---

## 🎯 Quick Reference

### Default Credentials
- **Super Admin**: admin@university.edu / admin123

### Ports
- **Frontend**: http://localhost:3000
- **Backend**: http://localhost:8080
- **MySQL**: localhost:3306

### Key Directories
- `Frontend/src/components/` - React components
- `backend/src/main/java/.../` - Java backend code
- `database/` - SQL migration files

---

## 📞 Need Help?

Check these files for more info:
- `GETTING_STARTED.md` - Detailed beginner guide
- `PROJECT_STRUCTURE.md` - Architecture overview
- `backend/README.md` - Backend-specific info

---

**Happy Coding! 🎉**
