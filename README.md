# Revisit Pro

A Flutter package that tracks the most visited and recently opened pages in an app.  
It categorizes pages, applies exponential decay for ranking, persists data, and allows custom UI.

## Features
✅ Tracks **Most Visited** and **Recently Opened** pages  
✅ Uses **Exponential Decay** for ranking  
✅ **Excludes specific pages** from tracking  
✅ **Configurable decay rate**  
✅ **Persistent storage** across sessions  
✅ Open-source and customizable  

## Installation

Add this to `pubspec.yaml`:

```yaml
dependencies:
  revisit_pro:
    git:
      url: https://github.com/45afeef/revisit_pro.git

```



## Usage

### **Initialize Hive**
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await VisitedPagesStorage.init();
  runApp(MyApp());
}
```

### **Track Page Visits**
```dart
PageTracker.startTracking("Home Page", "collection", "/home");

// When page is closed
PageTracker.stopTracking();
```

### **Use the UI Widget to Display Most Visited Pages**
```dart
VisitedPagesListView(
  itemBuilder: (context, page) => ListTile(
    title: Text(page.pageName),
    subtitle: Text("Visited ${page.visitCount} times"),
    onTap: () => Navigator.pushNamed(context, page.url),
  ),
)
```

### **Customize Settings**
```dart
VisitedPagesConfig.setDecayRate(0.05);
VisitedPagesConfig.excludePages(["/settings", "/login"]);
```

### **Reset Data**
```dart
await VisitedPagesStorage.resetTrackingData();
```