player p1 = player(); // p1 new address 清水區民有路227巷38號 ram =>
player p2 = p1; // -> p1 address
// Weapon m4 = Weapon(); //會失敗

class player implements owen {
  @override
  double speed = 0.0;
  @override
  Ak gun = Ak();
  @override
  void shot() {
    gun.shot();
  }

  @override
  void reload() {
    gun.reload();
  }

  @override
  void smoke() {}
  @override
  void transmit() {
    // TODO: implement transmit
  }
  @override
  void transmitAnywhere() {
    // TODO: implement transmitAnywhere
  }
  @override
  void blind() {
    // TODO: implement blind
  }
}

abstract class owen {
  double get speed;
  Weapon get gun;

  void shot();
  void reload();
  void smoke();
  void transmit();
  void transmitAnywhere();
  void blind();
}

class Ak implements Weapon {
  @override
  double damage = 35;
  int currentBullet = 30;
  int clipBullet = 30;
  int totalBullet = 90;
  @override
  void shot() {
    if (currentBullet == 0) return;
    currentBullet -= 1;
    totalBullet -= 1;
  }

  // 30/60 90
  // 29/60 89
  // 30/59 89
  @override
  void reload() {
    if (currentBullet == 30) return;
    int shotBullet = clipBullet - currentBullet;
    int remainBullet = totalBullet - currentBullet;
    if (remainBullet >= shotBullet) {
      currentBullet = 30;
    } else {
      currentBullet = currentBullet + remainBullet;
    }
  }

  @override
  int clip() {
    return (totalBullet - currentBullet) ~/ clipBullet;
  }
}

//interface = abstract class
abstract class Weapon {
  double get damage;
  int get currentBullet;
  int get clipBullet;
  int get totalBullet;
  void shot();

  void reload();

  int clip();
}
