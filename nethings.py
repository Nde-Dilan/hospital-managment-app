from flask import Flask, request, jsonify
import sqlite3
from sqlite3 import Error

app = Flask(__name__)

# Database connection settings
DATABASE = 'hospi_ms.db'

# Function to handle database connection
def get_connection():
    try:
        connection = sqlite3.connect(DATABASE)
        connection.row_factory = sqlite3.Row
        return connection
    except Error as e:
        print(f"Error: {e}")
        return None

@app.route('/appointments', methods=['GET'])
def handle_get_appointments():
    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM appointments")
        appointments = [dict(row) for row in cursor.fetchall()]
        cursor.close()
        connection.close()
        return jsonify(appointments), 200
    except Error as e:
        return jsonify({'error': str(e)}), 500

@app.route('/prescriptions', methods=['GET'])
def handle_get_prescriptions():
    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM prescriptions")
        prescriptions = [dict(row) for row in cursor.fetchall()]
        cursor.close()
        connection.close()
        return jsonify(prescriptions), 200
    except Error as e:
        return jsonify({'error': str(e)}), 500

@app.route('/lab_tests', methods=['GET'])
def handle_get_lab_tests():
    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM lab_tests")
        lab_tests = [dict(row) for row in cursor.fetchall()]
        cursor.close()
        connection.close()
        return jsonify(lab_tests), 200
    except Error as e:
        return jsonify({'error': str(e)}), 500

@app.route('/users', methods=['GET'])
def handle_get_users():
    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM users")
        users = [dict(row) for row in cursor.fetchall()]
        cursor.close()
        connection.close()
        return jsonify(users), 200
    except Error as e:
        return jsonify({'error': str(e)}), 500

@app.route('/appointments', methods=['POST'])
def handle_post_appointment():
    try:
        data = request.json
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute("""
            INSERT INTO appointments (patient_id, doctor_id, description, date, time, appointment_status, comments)
            VALUES (?, ?, ?, ?, ?, ?, ?)
        """, (data['patient_id'], data['doctor_id'], data['description'], data['date'], data['time'], data['appointment_status'], data['comments']))
        connection.commit()
        cursor.close()
        connection.close()
        return jsonify({'message': 'Appointment created successfully'}), 200
    except Error as e:
        return jsonify({'error': str(e)}), 500

@app.route('/prescriptions', methods=['POST'])
def handle_post_prescription():
    try:
        data = request.json
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute("""
            INSERT INTO prescriptions (doctor_id, patient_id, appointment_id, prescription, prescription_status, prescription_location)
            VALUES (?, ?, ?, ?, ?, ?)
        """, (data['doctor_id'], data['patient_id'], data['appointment_id'], data['prescription'], data['prescription_status'], data['prescription_location']))
        connection.commit()
        cursor.close()
        connection.close()
        return jsonify({'message': 'Prescription created successfully'}), 200
    except Error as e:
        return jsonify({'error': str(e)}), 500

@app.route('/lab_tests', methods=['POST'])
def handle_post_lab_test():
    try:
        data = request.json
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute("""
            INSERT INTO lab_tests (patient_id, details, date, test_status)
            VALUES (?, ?, ?, ?)
        """, (data['patient_id'], data['details'], data['date'], data['test_status']))
        connection.commit()
        cursor.close()
        connection.close()
        return jsonify({'message': 'Lab test created successfully'}), 200
    except Error as e:
        return jsonify({'error': str(e)}), 500

@app.route('/users', methods=['POST'])
def handle_post_user():
    try:
        data = request.json
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute("""
            INSERT INTO users (full_name, username, email, contact, address, password, user_type, user_status)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        """, (data['full_name'], data['username'], data['email'], data['contact'], data['address'], data['password'], data['user_type'], data['user_status']))
        connection.commit()
        cursor.close()
        connection.close()
        return jsonify({'message': 'User created successfully'}), 200
    except Error as e:
        return jsonify({'error': str(e)}), 500

@app.route('/appointments', methods=['PUT'])
def handle_put_appointment():
    try:
        data = request.json
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute("""
            UPDATE appointments
            SET patient_id = ?, doctor_id = ?, description = ?, date = ?, time = ?, appointment_status = ?, comments = ?
            WHERE appointment_id = ?
        """, (data['patient_id'], data['doctor_id'], data['description'], data['date'], data['time'], data['appointment_status'], data['comments'], data['appointment_id']))
        connection.commit()
        cursor.close()
        connection.close()
        return jsonify({'message': 'Appointment updated successfully'}), 200
    except Error as e:
        return jsonify({'error': str(e)}), 500

@app.route('/prescriptions', methods=['PUT'])
def handle_put_prescription():
    try:
        data = request.json
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute("""
            UPDATE prescriptions
            SET doctor_id = ?, patient_id = ?, appointment_id = ?, prescription = ?, prescription_status = ?, prescription_location = ?
            WHERE prescription_id = ?
        """, (data['doctor_id'], data['patient_id'], data['appointment_id'], data['prescription'], data['prescription_status'], data['prescription_location'], data['prescription_id']))
        connection.commit()
        cursor.close()
        connection.close()
        return jsonify({'message': 'Prescription updated successfully'}), 200
    except Error as e:
        return jsonify({'error': str(e)}), 500

@app.route('/lab_tests', methods=['PUT'])
def handle_put_lab_test():
    try:
        data = request.json
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute("""
            UPDATE lab_tests
            SET patient_id = ?, details = ?, date = ?, test_status = ?
            WHERE test_id = ?
        """, (data['patient_id'], data['details'], data['date'], data['test_status'], data['test_id']))
        connection.commit()
        cursor.close()
        connection.close()
        return jsonify({'message': 'Lab test updated successfully'}), 200
    except Error as e:
        return jsonify({'error': str(e)}), 500

@app.route('/users', methods=['PUT'])
def handle_put_user():
    try:
        data = request.json
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute("""
            UPDATE users
            SET full_name = ?, username = ?, email = ?, contact = ?, address = ?, password = ?, user_type = ?, user_status = ?
            WHERE user_id = ?
        """, (data['full_name'], data['username'], data['email'], data['contact'], data['address'], data['password'], data['user_type'], data['user_status'], data['user_id']))
        connection.commit()
        cursor.close()
        connection.close()
        return jsonify({'message': 'User updated successfully'}), 200
    except Error as e:
        return jsonify({'error': str(e)}), 500

@app.route('/appointments', methods=['DELETE'])
def handle_delete_appointment():
    try:
        data = request.json
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute("DELETE FROM appointments WHERE appointment_id = ?", (data['appointment_id'],))
        connection.commit()
        cursor.close()
        connection.close()
        return jsonify({'message': 'Appointment deleted successfully'}), 200
    except Error as e:
        return jsonify({'error': str(e)}), 500

@app.route('/prescriptions', methods=['DELETE'])
def handle_delete_prescription():
    try:
        data = request.json
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute("DELETE FROM prescriptions WHERE prescription_id = ?", (data['prescription_id'],))
        connection.commit()
        cursor.close()
        connection.close()
        return jsonify({'message': 'Prescription deleted successfully'}), 200
    except Error as e:
        return jsonify({'error': str(e)}), 500

@app.route('/lab_tests', methods=['DELETE'])
def handle_delete_lab_test():
    try:
        data = request.json
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute("DELETE FROM lab_tests WHERE test_id = ?", (data['test_id'],))
        connection.commit()
        cursor.close()
        connection.close()
        return jsonify({'message': 'Lab test deleted successfully'}), 200
    except Error as e:
        return jsonify({'error': str(e)}), 500

@app.route('/users', methods=['DELETE'])
def handle_delete_user():
    try:
        data = request.json
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute("DELETE FROM users WHERE user_id = ?", (data['user_id'],))
        connection.commit()
        cursor.close()
        connection.close()
        return jsonify({'message': 'User deleted successfully'}), 200
    except Error as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(host='localhost', port=5003)
