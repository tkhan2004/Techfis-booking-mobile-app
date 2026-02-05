# Flutter MVVM + GetX Template

> Template dự án Flutter chuẩn công ty Techfis với kiến trúc MVVM + GetX

##  Giới thiệu

Template này được thiết kế để khởi tạo nhanh các dự án Flutter mới tại công ty Techfis, đảm bảo:
-  Cấu trúc thư mục chuẩn MVVM + Clean Architecture
-  State management với GetX
-  Base components và design system đồng nhất
-  Coding standards và naming conventions nhất quán

##  Cấu trúc dự án

```
lib/
├── data/                       # Lớp dữ liệu
│   ├── datasources/            # API Client, Local DB
│   └── repositories/           # Repository implementations
├── domain/                     # Lớp nghiệp vụ
│   ├── entities/               # Business entities
│   └── usecases/               # Business logic
├── presentation/               # Lớp hiển thị
│   ├── controllers/            # GetX Controllers (ViewModels)
│   ├── pages/                  # Screens
│   └── widgets/                # Page-specific widgets
├── models/                     # Data models (JSON)
├── utils/                      # Utilities
│   ├── constants/              # Colors, Themes, Constants
│   └── helpers/                # Helper functions
└── global_widgets/             # Reusable components
```

##  Sử dụng

### 1. Clone template
```bash
git clone <repository-url> <tên-dự-án-mới>
cd <tên-dự-án-mới>
```

### 2. Đổi tên package
```bash
# Cập nhật package name trong:
# - pubspec.yaml
# - android/app/build.gradle.kts
# - ios/Runner.xcodeproj/project.pbxproj
```

### 3. Cài đặt dependencies
```bash
flutter pub get
```

### 4. Cấu hình API
Cập nhật `baseUrl` trong `lib/data/datasources/api_client.dart`

### 5. Bắt đầu code
```bash
flutter run
```

##  Thư viện có sẵn

- **get** `^4.6.6` - State Management & Navigation
- **dio** `^5.4.0` - HTTP Client
- **shared_preferences** `^2.2.2` - Local Storage
- **flutter_secure_storage** `^9.0.0` - Secure Storage

##  Base Components

Template đã bao gồm các components chuẩn:

### Colors & Theme
- `AppColors` - Bảng màu chuẩn công ty
- `AppTheme` - Light/Dark theme với font Inter, spacing 16px, radius 8/12px

### Widgets
- `CompanyButton` - Nút bấm chuẩn (Primary, Secondary, Outline, Text, Danger)
- `CompanyTextField` - Input field với validation, password toggle

### API Client
- Dio client đã config sẵn interceptors
- Token management với secure storage
- Error handling tự động

##  Quy tắc Code

### Naming Conventions
- **Files:** `snake_case` (ví dụ: `user_repository.dart`)
- **Classes:** `PascalCase` (ví dụ: `UserCard`)
- **Controllers:** `PascalCase` + `Controller` (ví dụ: `AuthController`)
- **Variables:** `camelCase` (ví dụ: `userName`)

### Architecture Rules

** TUYỆT ĐỐI KHÔNG viết logic trong Widget**

Widget chỉ được:
- Hiển thị UI
- Gọi methods từ Controller
- Sử dụng Obx/GetBuilder

Logic phải nằm trong:
- **Controller** - State management, gọi UseCase
- **UseCase** - Business logic
- **Repository** - Data access

---

**Techfis Company** © 2026
