class DatabaseError extends Error {

  String message;
  dynamic error;

  DatabaseError(this.message, this.error);

  @override
  String toString() {
    return "DatabaseError: $message: " + error.toString();
  }
}