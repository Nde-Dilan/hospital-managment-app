import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'package:mysql1/mysql1.dart';

// Database connection settings Any one working on this reset based on sys settings
final settings = ConnectionSettings(
  host: 'localhost',
  port: 3306,
  user: 'root',
  password: '134294',
  db: 'hospi_ms',
);

// Function to handle database connection
Future<MySqlConnection> getConnection() async {
  return await MySqlConnection.connect(settings);
}

// Function to handle GET requests for appointments
Future<Response> handleGetAppointments(Request request) async {
  try {
    final connection = await getConnection();
    final results = await connection.query('SELECT * FROM appointments');
    await connection.close();

    final appointments = results.map((row) {
      return {
        'appointment_id': row['appointment_id'],
        'patient_id': row['patient_id'],
        'doctor_id': row['doctor_id'],
        'description': row['description'],
        'date': row['date'].toString(),
        'time': row['time'].toString(),
        'appointment_status': row['appointment_status'],
        'comments': row['comments'],
      };
    }).toList();

    return Response.ok(jsonEncode(appointments), headers: {'Content-Type': 'application/json'});
  } catch (e) {
    return Response.internalServerError(body: 'Error fetching appointments: $e');
  }
}

// Function to handle GET requests for prescriptions
Future<Response> handleGetPrescriptions(Request request) async {
  try {
    final connection = await getConnection();
    final results = await connection.query('SELECT * FROM prescriptions');
    await connection.close();

    final prescriptions = results.map((row) {
      return {
        'prescription_id': row['prescription_id'],
        'doctor_id': row['doctor_id'],
        'patient_id': row['patient_id'],
        'appointment_id': row['appointment_id'],
        'prescription': row['prescription'],
        'prescription_status': row['prescription_status'],
        'prescription_location': row['prescription_location'],
      };
    }).toList();

    return Response.ok(jsonEncode(prescriptions), headers: {'Content-Type': 'application/json'});
  } catch (e) {
    return Response.internalServerError(body: 'Error fetching prescriptions: $e');
  }
}

// Function to handle GET requests for lab tests
Future<Response> handleGetLabTests(Request request) async {
  try {
    final connection = await getConnection();
    final results = await connection.query('SELECT * FROM lab_tests');
    await connection.close();

    final labTests = results.map((row) {
      return {
        'test_id': row['test_id'],
        'patient_id': row['patient_id'],
        'details': row['details'],
        'date': row['date'].toString(),
        'test_status': row['test_status'],
      };
    }).toList();

    return Response.ok(jsonEncode(labTests), headers: {'Content-Type': 'application/json'});
  } catch (e) {
    return Response.internalServerError(body: 'Error fetching lab tests: $e');
  }
}

// Function to handle GET requests for users
Future<Response> handleGetUsers(Request request) async {
  try {
    final connection = await getConnection();
    final results = await connection.query('SELECT * FROM users');
    await connection.close();

    final users = results.map((row) {
      return {
        'user_id': row['user_id'],
        'full_name': row['full_name'],
        'username': row['username'],
        'email': row['email'],
        'contact': row['contact'],
        'address': row['address'],
        'user_type': row['user_type'],
        'user_status': row['user_status'],
      };
    }).toList();

    return Response.ok(jsonEncode(users), headers: {'Content-Type': 'application/json'});
  } catch (e) {
    return Response.internalServerError(body: 'Error fetching users: $e');
  }
}

// Function to handle POST requests for appointments
Future<Response> handlePostAppointment(Request request) async {
  try {
    final payload = await request.readAsString();
    final data = jsonDecode(payload);

    final connection = await getConnection();
    await connection.query(
      'INSERT INTO appointments (patient_id, doctor_id, description, date, time, appointment_status, comments) VALUES (?, ?, ?, ?, ?, ?, ?)',
      [
        data['patient_id'],
        data['doctor_id'],
        data['description'],
        data['date'],
        data['time'],
        data['appointment_status'],
        data['comments']
      ],
    );
    await connection.close();

    return Response.ok(jsonEncode({'message': 'Appointment created successfully'}), headers: {'Content-Type': 'application/json'});
  } catch (e) {
    return Response.internalServerError(body: 'Error creating appointment: $e');
  }
}

// Function to handle POST requests for prescriptions
Future<Response> handlePostPrescription(Request request) async {
  try {
    final payload = await request.readAsString();
    final data = jsonDecode(payload);

    final connection = await getConnection();
    await connection.query(
      'INSERT INTO prescriptions (doctor_id, patient_id, appointment_id, prescription, prescription_status, prescription_location) VALUES (?, ?, ?, ?, ?, ?)',
      [
        data['doctor_id'],
        data['patient_id'],
        data['appointment_id'],
        data['prescription'],
        data['prescription_status'],
        data['prescription_location']
      ],
    );
    await connection.close();

    return Response.ok(jsonEncode({'message': 'Prescription created successfully'}), headers: {'Content-Type': 'application/json'});
  } catch (e) {
    return Response.internalServerError(body: 'Error creating prescription: $e');
  }
}

// Function to handle POST requests for lab tests
Future<Response> handlePostLabTest(Request request) async {
  try {
    final payload = await request.readAsString();
    final data = jsonDecode(payload);

    final connection = await getConnection();
    await connection.query(
      'INSERT INTO lab_tests (patient_id, details, date, test_status) VALUES (?, ?, ?, ?)',
      [
        data['patient_id'],
        data['details'],
        data['date'],
        data['test_status']
      ],
    );
    await connection.close();

    return Response.ok(jsonEncode({'message': 'Lab test created successfully'}), headers: {'Content-Type': 'application/json'});
  } catch (e) {
    return Response.internalServerError(body: 'Error creating lab test: $e');
  }
}

// Function to handle POST requests for users
Future<Response> handlePostUser(Request request) async {
  try {
    final payload = await request.readAsString();
    final data = jsonDecode(payload);

    final connection = await getConnection();
    await connection.query(
      'INSERT INTO users (full_name, username, email, contact, address, password, user_type, user_status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
      [
        data['full_name'],
        data['username'],
        data['email'],
        data['contact'],
        data['address'],
        data['password'],
        data['user_type'],
        data['user_status']
      ],
    );
    await connection.close();

    return Response.ok(jsonEncode({'message': 'User created successfully'}), headers: {'Content-Type': 'application/json'});
  } catch (e) {
    return Response.internalServerError(body: 'Error creating user: $e');
  }
}

// Function to handle PUT requests for appointments
Future<Response> handlePutAppointment(Request request) async {
  try {
    final payload = await request.readAsString();
    final data = jsonDecode(payload);

    final connection = await getConnection();
    await connection.query(
      'UPDATE appointments SET patient_id = ?, doctor_id = ?, description = ?, date = ?, time = ?, appointment_status = ?, comments = ? WHERE appointment_id = ?',
      [
        data['patient_id'],
        data['doctor_id'],
        data['description'],
        data['date'],
        data['time'],
        data['appointment_status'],
        data['comments'],
        data['appointment_id']
      ],
    );
    await connection.close();

    return Response.ok(jsonEncode({'message': 'Appointment updated successfully'}), headers: {'Content-Type': 'application/json'});
  } catch (e) {
    return Response.internalServerError(body: 'Error updating appointment: $e');
  }
}

// Function to handle PUT requests for prescriptions
Future<Response> handlePutPrescription(Request request) async {
  try {
    final payload = await request.readAsString();
    final data = jsonDecode(payload);

    final connection = await getConnection();
    await connection.query(
      'UPDATE prescriptions SET doctor_id = ?, patient_id = ?, appointment_id = ?, prescription = ?, prescription_status = ?, prescription_location = ? WHERE prescription_id = ?',
      [
        data['doctor_id'],
        data['patient_id'],
        data['appointment_id'],
        data['prescription'],
        data['prescription_status'],
        data['prescription_location'],
        data['prescription_id']
      ],
    );
    await connection.close();

    return Response.ok(jsonEncode({'message': 'Prescription updated successfully'}), headers: {'Content-Type': 'application/json'});
  } catch (e) {
    return Response.internalServerError(body: 'Error updating prescription: $e');
  }
}

// Function to handle PUT requests for lab tests
Future<Response> handlePutLabTest(Request request) async {
  try {
    final payload = await request.readAsString();
    final data = jsonDecode(payload);

    final connection = await getConnection();
    await connection.query(
      'UPDATE lab_tests SET patient_id = ?, details = ?, date = ?, test_status = ? WHERE test_id = ?',
      [
        data['patient_id'],
        data['details'],
        data['date'],
        data['test_status'],
        data['test_id']
      ],
    );
    await connection.close();

    return Response.ok(jsonEncode({'message': 'Lab test updated successfully'}), headers: {'Content-Type': 'application/json'});
  } catch (e) {
    return Response.internalServerError(body: 'Error updating lab test: $e');
  }
}

// Function to handle PUT requests for users
Future<Response> handlePutUser(Request request) async {
  try {
    final payload = await request.readAsString();
    final data = jsonDecode(payload);

    final connection = await getConnection();
    await connection.query(
      'UPDATE users SET full_name = ?, username = ?, email = ?, contact = ?, address = ?, password = ?, user_type = ?, user_status = ? WHERE user_id = ?',
      [
        data['full_name'],
        data['username'],
        data['email'],
        data['contact'],
        data['address'],
        data['password'],
        data['user_type'],
        data['user_status'],
        data['user_id']
      ],
    );
    await connection.close();

    return Response.ok(jsonEncode({'message': 'User updated successfully'}), headers: {'Content-Type': 'application/json'});
  } catch (e) {
    return Response.internalServerError(body: 'Error updating user: $e');
  }
}

// Function to handle DELETE requests for appointments
Future<Response> handleDeleteAppointment(Request request) async {
  try {
    final payload = await request.readAsString();
    final data = jsonDecode(payload);

    final connection = await getConnection();
    await connection.query('DELETE FROM appointments WHERE appointment_id = ?', [data['appointment_id']]);
    await connection.close();

    return Response.ok(jsonEncode({'message': 'Appointment deleted successfully'}), headers: {'Content-Type': 'application/json'});
  } catch (e) {
    return Response.internalServerError(body: 'Error deleting appointment: $e');
  }
}

// Function to handle DELETE requests for prescriptions
Future<Response> handleDeletePrescription(Request request) async {
  try {
    final payload = await request.readAsString();
    final data = jsonDecode(payload);

    final connection = await getConnection();
    await connection.query('DELETE FROM prescriptions WHERE prescription_id = ?', [data['prescription_id']]);
    await connection.close();

    return Response.ok(jsonEncode({'message': 'Prescription deleted successfully'}), headers: {'Content-Type': 'application/json'});
  } catch (e) {
    return Response.internalServerError(body: 'Error deleting prescription: $e');
  }
}

// Function to handle DELETE requests for lab tests
Future<Response> handleDeleteLabTest(Request request) async {
  try {
    final payload = await request.readAsString();
    final data = jsonDecode(payload);

    final connection = await getConnection();
    await connection.query('DELETE FROM lab_tests WHERE test_id = ?', [data['test_id']]);
    await connection.close();

    return Response.ok(jsonEncode({'message': 'Lab test deleted successfully'}), headers: {'Content-Type': 'application/json'});
  } catch (e) {
    return Response.internalServerError(body: 'Error deleting lab test: $e');
  }
}

// Function to handle DELETE requests for users
Future<Response> handleDeleteUser(Request request) async {
  try {
    final payload = await request.readAsString();
    final data = jsonDecode(payload);

    final connection = await getConnection();
    await connection.query('DELETE FROM users WHERE user_id = ?', [data['user_id']]);
    await connection.close();

    return Response.ok(jsonEncode({'message': 'User deleted successfully'}), headers: {'Content-Type': 'application/json'});
  } catch (e) {
    return Response.internalServerError(body: 'Error deleting user: $e');
  }
}

// Main function to set up the server
void main() async {
  final router = Router()
    ..get('/appointments', handleGetAppointments)
    ..get('/prescriptions', handleGetPrescriptions)
    ..get('/lab_tests', handleGetLabTests)
    ..get('/users', handleGetUsers)
    ..post('/appointments', handlePostAppointment)
    ..post('/prescriptions', handlePostPrescription)
    ..post('/lab_tests', handlePostLabTest)
    ..post('/users', handlePostUser)
    ..put('/appointments', handlePutAppointment)
    ..put('/prescriptions', handlePutPrescription)
    ..put('/lab_tests', handlePutLabTest)
    ..put('/users', handlePutUser)
    ..delete('/appointments', handleDeleteAppointment)
    ..delete('/prescriptions', handleDeletePrescription)
    ..delete('/lab_tests', handleDeleteLabTest)
    ..delete('/users', handleDeleteUser);

  final handler = const Pipeline().addMiddleware(logRequests()).addHandler(router);

  final server = await io.serve(handler, 'localhost', 8080);
  print('Server running on localhost:${server.port}');
}
