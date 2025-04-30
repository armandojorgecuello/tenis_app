import 'dart:async';
import 'dart:developer';
import 'package:app_tennis/data/models/tennis_courts_reservation_model.dart';
import 'package:app_tennis/data/models/user_model.dart';
import 'package:app_tennis/domain/entities/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:app_tennis/data/models/tennis_courts_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  // Singleton pattern
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'login_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreateUser);
  }

  Future<void> _onCreateUser(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL UNIQUE,
        phone TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL,
        confirmpassword TEXT NOT NULL,
        email TEXT,
        created_at TEXT DEFAULT CURRENT_TIMESTAMP
      )
    ''');

    // Tabla de canchas de tenis
    await db.execute('''
    CREATE TABLE tennis_courts(
      id TEXT PRIMARY KEY,
      name TEXT NOT NULL,
      court_type TEXT NOT NULL,
      available_date TEXT NOT NULL,
      price_per_hour TEXT NOT NULL,
      reserved_by TEXT,
      time_reserved TEXT,
      location TEXT NOT NULL,
      image TEXT NOT NULL,
      available_hours TEXT NOT NULL,
      is_available INTEGER NOT NULL
    )
  ''');

    // Nueva tabla my_reservations con todos los campos del modelo
    await db.execute('''
    CREATE TABLE my_reservations(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      courtType TEXT NOT NULL,
      availableDate TEXT NOT NULL,
      availableHours TEXT NOT NULL,
      pricePerHour TEXT NOT NULL,
      reserverdBy TEXT,
      timeReserved TEXT,
      location TEXT NOT NULL,
      image TEXT NOT NULL,
      isAvailable INTEGER NOT NULL,
      instructor TEXT,
      dateReserved TEXT,
      reservedHours TEXT,
      inittialHour TEXT,
      finalHour TEXT,
      price TEXT,
      comment TEXT
    )
  ''');

    // Insertar un usuario de prueba
    await db.insert('users', {
      'name': 'admin',
      'password': 'admin123',
      'phone': '3000000000',
      'confirmpassword': 'admin123',
      'email': 'admin@example.com',
    });
  }

  Future<int> insertTennisCourts({required List<TennisCourts> courts}) async {
    try {
      final db = await database;

      // Validar si la tabla existe
      final tableExists = await db.rawQuery(
        "SELECT name FROM sqlite_master WHERE type='table' AND name='tennis_courts';",
      );

      if (tableExists.isEmpty) {
        return 0;
      }

      int count = 0;
      for (var court in courts) {
        await db.insert(
          'tennis_courts',
          court.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        count++;
      }

      return count;
    } catch (e) {
      print('Error insertTennisCourts: $e');
      return 0;
    }
  }

  // Método para insertar reservas en la nueva tabla
  Future<int> insertReservation(TennisCourtsReservedModel reservation) async {
    try {
      final db = await database;
      return await db.insert(
        'my_reservations',
        reservation.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print('Error insertReservation: $e');
      return 0;
    }
  }

  // Método para obtener todas las reservas
  Future<List<TennisCourtsReservedModel>> getReservations() async {
    try {
      final db = await database;
      final infoRaw = await db.query('my_reservations');
      final response =
          infoRaw.map((e) => TennisCourtsReservedModel.fromJson(e)).toList();
      return response;
    } catch (e) {
      log('Error getReservations: $e');
      return [];
    }
  }

  // Método para obtener una reserva específica
  Future<Map<String, dynamic>?> getReservationById(String id) async {
    try {
      final db = await database;
      List<Map<String, dynamic>> results = await db.query(
        'my_reservations',
        where: 'id = ?',
        whereArgs: [id],
        limit: 1,
      );

      if (results.isNotEmpty) {
        return results.first;
      }
      return null;
    } catch (e) {
      log('Error getReservationById: $e');
      return null;
    }
  }

  // Método para actualizar una reserva
  Future<int> updateReservation(TennisCourtsReservedModel reservation) async {
    try {
      final db = await database;
      return await db.update(
        'my_reservations',
        reservation.toJson(),
        where: 'id = ?',
        whereArgs: [reservation.id],
      );
    } catch (e) {
      print('Error updateReservation: $e');
      return 0;
    }
  }

  Future<List<TennisCourts>> getTennisCourts() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query('tennis_courts');

      return List.generate(maps.length, (i) {
        return TennisCourts.fromJson(maps[i]);
      });
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  // CRUD Operations
  Future<int> register(Map<String, dynamic> user) async {
    Database db = await database;
    return await db.insert('users', user);
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    Database db = await database;

    List<Map<String, dynamic>> emailCheck = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
      limit: 1,
    );

    if (emailCheck.isEmpty) {
      return {
        'success': false,
        'error': 'EMAIL_NOT_FOUND',
        'message': 'El correo electrónico no existe en la base de datos',
      };
    }

    List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
      limit: 1,
    );

    if (results.isEmpty) {
      return {
        'success': false,
        'error': 'INCORRECT_PASSWORD',
        'message': 'La contraseña es incorrecta',
      };
    }

    return {
      'success': true,
      'user': results.first,
      'message': 'Inicio de sesión exitoso',
    };
  }

  Future<User?> getUser(String userId) async {
    Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [userId],
      limit: 1,
    );

    if (results.isNotEmpty) {
      final UserModel user = UserModel.fromJson(results.first);
      return user.toEntity();
    }
    return null;
  }

  Future<int> updateUser(Map<String, dynamic> user) async {
    Database db = await database;
    return await db.update(
      'users',
      user,
      where: 'id = ?',
      whereArgs: [user['id']],
    );
  }

  Future<int> deleteUser(int id) async {
    Database db = await database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }
}
