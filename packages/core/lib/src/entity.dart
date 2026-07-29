abstract class Entity<TId> {
  const Entity(this.id);

  final TId id;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Entity<TId> && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => Object.hash(runtimeType, id);
}
