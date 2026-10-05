// Static mock data only (TCIE-II rule: no backend wiring).
// Mirrors system_design/04_class_diagram_database.md tables.
// Only Divya edits; members read from here.
class MockData {
  static const projects = [
    {'id': 'p1', 'name': 'Metro Line Phase 2A', 'location': 'Sector 62, Noida', 'report': 'DRAFT', 'status': 'ACTIVE'},
    {'id': 'p2', 'name': 'Downtown Commercial Hub', 'location': 'MG Road, Bengaluru', 'report': 'PENDING', 'status': 'ACTIVE'},
    {'id': 'p3', 'name': 'Riverside Apartments', 'location': 'Kochi', 'report': 'NOT STARTED', 'status': 'ON HOLD'},
  ];
  static const workers = [
    {'name': 'Rajesh Kumar', 'role': 'Mason', 'present': true},
    {'name': 'Vikram Singh', 'role': 'Helper', 'present': true},
    {'name': 'Sunil Dutt', 'role': 'Carpenter', 'present': false},
    {'name': 'Anil Sharma', 'role': 'Mason', 'present': true},
  ];
  static const materials = [
    {'name': 'Cement', 'qty': '50 Bags'},
    {'name': 'Coarse Sand', 'qty': '200 CFT'},
  ];
  static const tasks = [
    {'name': 'Concreting Pier 45', 'project': 'Metro Line Phase 2A', 'due': 'Today', 'status': 'IN PROGRESS', 'progress': 0.65},
    {'name': 'Rebar Binding Pier 46', 'project': 'Metro Line Phase 2A', 'due': 'Tomorrow', 'status': 'PENDING', 'progress': 0.0},
    {'name': 'Site Safety Walk', 'project': 'Downtown Commercial Hub', 'due': '-', 'status': 'COMPLETED', 'progress': 1.0},
  ];
  static const team = [
    {'name': 'Rajesh Kumar', 'role': 'Mason Lead', 'project': 'Metro Line Phase 2A', 'status': 'PRESENT'},
    {'name': 'Vikram Singh', 'role': 'Helper', 'project': 'Metro Line Phase 2A', 'status': 'PRESENT'},
    {'name': 'Amit Patel', 'role': 'Safety Inspector', 'project': 'Downtown Commercial Hub', 'status': 'OFF-SITE'},
  ];
}
