class DatabaseError extends Error {

  String message;
  Error error;

  DatabaseError(this.message, this.error);

  @override
  String toString() {
    return "DatabaseError: $message: " + error.toString();
  }
}