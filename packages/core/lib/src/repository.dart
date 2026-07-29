abstract class Repository<T, TId> {
  const Repository();

  Future<T?> getById(TId id);
  Future<void> save(T entity);
  Future<void> delete(TId id);
}
