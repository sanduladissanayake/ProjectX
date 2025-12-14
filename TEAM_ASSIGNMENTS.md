# Team Work Assignment Guide

## Overview
This document clearly defines which files each team member should work on.

---

## PART 1: Authentication System
**Assigned to: Teammate 1**  
**Branch:** `feature/auth-system`

### Backend Files to Create/Edit:
```
backend/src/main/java/com/university/universe/
├── controller/AuthController.java        ✓ Created
├── service/UserService.java              ✓ Created
├── service/JwtService.java               ✓ Created
├── repository/UserRepository.java        ✓ Created
└── model/User.java                       ✓ Created
```

### Frontend Files to Create:
```
src/
├── context/
│   └── AuthContext.tsx                   ⚠️ TO DO
├── components/auth/
│   ├── LoginForm.tsx                     ⚠️ TO DO
│   ├── RegisterForm.tsx                  ⚠️ TO DO
│   └── ProtectedRoute.tsx                ⚠️ TO DO
├── pages/
│   ├── LoginPage.tsx                     ⚠️ TO DO
│   └── RegisterPage.tsx                  ⚠️ TO DO
```

### Tasks:
1. ✅ Backend API endpoints are ready
2. ⬜ Create AuthContext.tsx for managing login state
3. ⬜ Create LoginForm.tsx component
4. ⬜ Create RegisterForm.tsx component
5. ⬜ Create ProtectedRoute.tsx for route protection
6. ⬜ Create LoginPage.tsx
7. ⬜ Create RegisterPage.tsx
8. ⬜ Test login/register flow

### API Endpoints You'll Use:
- POST `/api/auth/register` - Register new user
- POST `/api/auth/login` - Login user
- GET `/api/auth/me` - Get current user info

---

## PART 2: Clubs & Events Management
**Assigned to: Teammate 2**  
**Branch:** `feature/clubs-events`

### Backend Files (Already Created ✓):
```
backend/src/main/java/com/university/universe/
├── controller/
│   ├── ClubController.java               ✓ Created
│   ├── EventController.java              ✓ Created
│   └── ClubMembershipController.java     ✓ Created
├── service/
│   ├── ClubService.java                  ✓ Created
│   ├── EventService.java                 ✓ Created
│   └── ClubMembershipService.java        ✓ Created
├── repository/
│   ├── ClubRepository.java               ✓ Created
│   ├── EventRepository.java              ✓ Created
│   └── ClubMembershipRepository.java     ✓ Created
└── model/
    ├── Club.java                         ✓ Created
    ├── Event.java                        ✓ Created
    └── ClubMembership.java               ✓ Created
```

### Frontend Files to Create:
```
src/
├── components/clubs/
│   ├── ClubCard.tsx                      ⚠️ TO DO
│   ├── ClubList.tsx                      ⚠️ TO DO
│   ├── ClubDetail.tsx                    ⚠️ TO DO
│   └── ClubRegistrationForm.tsx          ⚠️ TO DO
├── components/events/
│   ├── EventCard.tsx                     ⚠️ TO DO (exists, may need update)
│   ├── EventList.tsx                     ⚠️ TO DO
│   └── EventDetail.tsx                   ⚠️ TO DO
├── pages/
│   ├── ClubsPage.tsx                     ⚠️ TO DO (exists, may need update)
│   ├── ClubDetailPage.tsx                ⚠️ TO DO (exists, may need update)
│   ├── EventsPage.tsx                    ⚠️ TO DO (exists, may need update)
│   └── EventDetailPage.tsx               ⚠️ TO DO (exists, may need update)
```

### Tasks:
1. ✅ Backend API endpoints are ready
2. ⬜ Create/Update ClubCard.tsx to display club info
3. ⬜ Create ClubList.tsx to show all clubs
4. ⬜ Create/Update ClubsPage.tsx with club listing
5. ⬜ Create ClubDetail.tsx for detailed club view
6. ⬜ Create ClubRegistrationForm.tsx for joining clubs
7. ⬜ Create/Update EventCard.tsx to display event info
8. ⬜ Create EventList.tsx to show all events
9. ⬜ Create/Update EventsPage.tsx with event listing
10. ⬜ Create EventDetail.tsx for detailed event view
11. ⬜ Test club and event features

### API Endpoints You'll Use:
**Clubs:**
- GET `/api/clubs` - Get all clubs
- GET `/api/clubs/{id}` - Get specific club
- POST `/api/clubs` - Create club (admin only)
- PUT `/api/clubs/{id}` - Update club (admin only)
- DELETE `/api/clubs/{id}` - Delete club (admin only)

**Events:**
- GET `/api/events` - Get all events
- GET `/api/events/{id}` - Get specific event
- GET `/api/events/club/{clubId}` - Get events by club
- POST `/api/events` - Create event (club admin only)
- PUT `/api/events/{id}` - Update event (club admin only)
- DELETE `/api/events/{id}` - Delete event (club admin only)

**Memberships:**
- POST `/api/memberships/join` - Join a club
- DELETE `/api/memberships/leave` - Leave a club
- GET `/api/memberships/user/{userId}` - Get user's clubs
- GET `/api/memberships/club/{clubId}` - Get club members

---

## PART 3: Admin Panels
**Assigned to: Teammate 3**  
**Branch:** `feature/admin-panels`

### Backend Files (Already Created ✓):
```
backend/src/main/java/com/university/universe/
└── controller/
    └── AdminController.java              ✓ Created
```

### Frontend Files to Create:
```
src/
├── components/admin/
│   ├── SuperAdminPanel.tsx               ⚠️ TO DO
│   ├── ClubAdminPanel.tsx                ⚠️ TO DO
│   ├── UserManagement.tsx                ⚠️ TO DO
│   └── ClubAdminForm.tsx                 ⚠️ TO DO
├── pages/
│   ├── SuperAdminDashboard.tsx           ⚠️ TO DO
│   └── ClubAdminDashboard.tsx            ⚠️ TO DO
```

### Tasks:
1. ✅ Backend API endpoints are ready
2. ⬜ Create SuperAdminPanel.tsx with admin management
3. ⬜ Create ClubAdminPanel.tsx for club admin features
4. ⬜ Create UserManagement.tsx for user CRUD
5. ⬜ Create ClubAdminForm.tsx to add club admins
6. ⬜ Create SuperAdminDashboard.tsx page
7. ⬜ Create ClubAdminDashboard.tsx page
8. ⬜ Test admin functionalities

### API Endpoints You'll Use:
**Super Admin:**
- GET `/api/admin/users` - Get all users
- GET `/api/admin/club-admins` - Get all club admins
- POST `/api/admin/club-admins` - Create new club admin
- PUT `/api/admin/users/{id}` - Update user
- DELETE `/api/admin/users/{id}` - Delete user

**Club Admin (uses Club & Event APIs):**
- POST `/api/clubs` - Create club
- PUT `/api/clubs/{id}` - Update their club
- POST `/api/events` - Create events
- PUT `/api/events/{id}` - Update events
- GET `/api/memberships/club/{clubId}` - View members

---

## Shared Files (All Team Members)

### Backend:
```
backend/
├── pom.xml                               ✓ Created (DO NOT MODIFY)
├── src/main/resources/
│   ├── application.properties            ✓ Created (Only change password)
│   └── schema.sql                        ✓ Created (DO NOT MODIFY)
└── src/main/java/com/university/universe/
    ├── UniverseApplication.java          ✓ Created (DO NOT MODIFY)
    ├── config/SecurityConfig.java        ✓ Created (DO NOT MODIFY)
    └── model/                            ✓ All created (DO NOT MODIFY)
```

### Frontend:
```
src/
├── services/
│   └── api.ts                            ✓ Created (Add your API functions)
├── types/
│   └── index.ts                          ⚠️ TO DO (Define interfaces together)
├── App.tsx                               ⚠️ TO DO (Add routes together)
├── main.tsx                              ✓ Created (DO NOT MODIFY)
└── components/layout/
    └── Navigation.tsx                    ⚠️ TO DO (Update together)
```

---

## Coordination Points

### Before Starting:
1. Pull latest code: `git pull origin main`
2. Create your feature branch
3. Ensure MySQL database is running
4. Run backend to test APIs

### During Development:
1. Commit small, logical changes
2. Write clear commit messages
3. Test your features locally
4. Don't modify shared files without team discussion

### Before Pull Request:
1. Test your feature end-to-end
2. Ensure no console errors
3. Pull latest main and resolve conflicts
4. Test again after merge

### Dependencies Between Parts:
- **Part 2 & 3** depend on **Part 1** for authentication
- **Part 3** uses **Part 2** APIs for club/event management
- Coordinate on `api.ts` structure
- Coordinate on TypeScript interfaces in `types/index.ts`

---

## Communication Protocol

### Daily Standup (Recommended):
- What did you complete yesterday?
- What will you work on today?
- Any blockers or questions?

### Code Review Process:
1. Create Pull Request on GitHub
2. Tag team members for review
3. Address review comments
4. Get approval before merging
5. Merge to main

### Shared Decisions:
- TypeScript interfaces (types/index.ts)
- Component styling patterns
- API response formats
- Error handling approach

---

## Timeline Suggestion

### Week 1:
- **All:** Setup environment, MySQL, run backend
- **Part 1:** Complete authentication system
- **Part 2 & 3:** Start after Part 1 is merged

### Week 2:
- **Part 2:** Complete clubs & events
- **Part 3:** Complete admin panels
- **All:** Integration testing

### Week 3:
- **All:** Bug fixes
- **All:** Polish UI
- **All:** Prepare viva presentation

---

## Quick Start Commands

### For Teammate 1:
```bash
git checkout -b feature/auth-system
cd backend
mvn spring-boot:run
# In another terminal
cd ..
npm run dev
```

### For Teammate 2:
```bash
git checkout -b feature/clubs-events
cd backend
mvn spring-boot:run
# In another terminal
cd ..
npm run dev
```

### For Teammate 3:
```bash
git checkout -b feature/admin-panels
cd backend
mvn spring-boot:run
# In another terminal
cd ..
npm run dev
```

---

## Need Help?

### Backend Issues:
- Check `backend/README.md`
- Verify MySQL is running
- Check application.properties configuration

### Frontend Issues:
- Ensure backend is running on port 8080
- Check browser console for errors
- Verify API calls in Network tab

### Git Issues:
- Pull latest changes regularly
- Resolve conflicts carefully
- Ask team before force push

---

**Good luck with the project! 🚀**
