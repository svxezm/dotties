<?php
try {
    $pdo = new PDO("mysql:host=hostname;dbname=databasename;charset=utf8mb4", "user", "password", [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false
    ]);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(["error" => "Database connection failed: " . $e->getMessage()]);
    exit();
}

$results = $pdo->query("SELECT id, password FROM users");

while ($row = $results->fetch(PDO::FETCH_ASSOC)) {
    $userId = $row["id"];
    $plainPassword = $row["password"];

    if (strlen($plainPassword) >= 60 && password_get_info($plainPassword)["algo"] !== 0) {
        continue;
    }

    $hashedPassword = password_hash($plainPassword, PASSWORD_DEFAULT);

    $stmt = $pdo->prepare("UPDATE users SET password = :password WHERE id = :id");
    $stmt->execute([
        ":password" => $hashedPassword,
        ":id", $userId
    ]);

}
echo "Passwords updated successfully~";
?>
